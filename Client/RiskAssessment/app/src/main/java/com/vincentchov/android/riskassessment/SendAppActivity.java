package com.vincentchov.android.riskassessment;

import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.LinearLayout;
import android.widget.ListView;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;


public class SendAppActivity extends AppCompatActivity {
    ExpandableListView mExpandableListView;
    ExpandableListAdapter mExpandableListAdapter;
    List<String> mExpandableListTitle;
    HashMap<String, List<String>> mExpandableListDetail;
    List<String> mGeneralInfoList;
    ListView mGeneralListView;
    ArrayAdapter mGeneralListViewAdapter;
    LinearLayout mLinearLayout;

    TextView mSharedTV;
    TextView mGreetingTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_app);

        mSharedTV = (TextView) findViewById(R.id.sharedTV);
        mGreetingTV = (TextView) findViewById(R.id.greetingTV);
        mLinearLayout = (LinearLayout) findViewById(R.id.AssessLayout);

        // Get intent, action and MIME type
        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();

        // Get the text that was sent to our app
        if (Intent.ACTION_SEND.equals(action) && type != null && "text/plain".equals(type)) {
            handleSendText(intent); // Handle text being sent
        } else {
            // Handle other intents, such as being started from the home screen
        }
    }

    void handleSendText(Intent intent) {
        String sharedText = intent.getStringExtra(Intent.EXTRA_TEXT);
        if (sharedText != null && sharedText.contains("play.google.com/store/apps/details")) {
            // Update UI to reflect text being shared
            mGreetingTV.setText(getString(R.string.greeting));
            mSharedTV.setText(sharedText);
            Toast.makeText(getApplicationContext(), R.string.sentRequest, Toast.LENGTH_LONG).show();
            try {
                Thread.sleep(5000);
            } catch (InterruptedException e) {
                e.printStackTrace();
            }

            String[] url_args = sharedText.split("\\?");
            String appID = "";
            for(String substring : url_args){
                String[] arg = substring.split("\\=");
                if (arg[0].equals("id")){
                    appID = arg[1];
                    break;
                }
            }

            ExpandableListDataPump.mContext = this;
            mExpandableListView = (ExpandableListView) findViewById(R.id.expandableListView);
            mExpandableListDetail = ExpandableListDataPump.getExpandableListDetail(appID);
            mExpandableListTitle = new ArrayList<String>(mExpandableListDetail.keySet());
            mExpandableListAdapter = new CustomExpandableListAdapter(this, mExpandableListTitle, mExpandableListDetail);
            mExpandableListView.setAdapter(mExpandableListAdapter);

            mGeneralListView = (ListView) findViewById(R.id.generalListView);
            mGeneralInfoList = ExpandableListDataPump.getRegularListViewData();
            mGeneralListViewAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, mGeneralInfoList);
            mGeneralListView.setAdapter(mGeneralListViewAdapter);
            Log.i("SendAppActivity", "Done setting adapters");

            Toast.makeText(getApplicationContext(), R.string.assRecvd, Toast.LENGTH_LONG).show();
            mGreetingTV.setVisibility(View.GONE);
            mSharedTV.setVisibility(View.GONE);

            // Make the ListViews visible
            mLinearLayout.setVisibility(View.VISIBLE);
        } else {
            mSharedTV.setText(R.string.whyYouNoLinkToApp);

        }
    }

    public static class ExpandableListDataPump{
        private static HashMap<String, List<String>> mExpandableListDetail;
        private static ArrayList<String> mRegularListViewData;
        private static JSONObject mJSONObject;
        private static JSONObject mScoreObject;
        private static String mFullURL;
        static Context mContext;

        public Context getAppContext(){
            return mContext;
        }

        public static HashMap<String, List<String>> getExpandableListDetail(String appID) {
            mExpandableListDetail = new HashMap<String, List<String>>();
            mRegularListViewData = new ArrayList<String>();

            // Initialize the JSONObject to say the report doesn't exist
            mJSONObject = new JSONObject();
            try {
                mJSONObject.put("report_exists", "false");
            } catch (JSONException e) {
                e.printStackTrace();
            }

            // AppID
            mRegularListViewData.add("AppID: " + appID);

            Log.i("DataPump", "Starting the assessment");

            // Start and complete the Risk Assessment report asynchronously
            startAssessment(appID);
            // Block until the report is retrieved
            try {
                while(!mJSONObject.getString("report_exists").equals("true")){
                    Thread.sleep(5000);
                    Toast.makeText(mContext, "Waiting on the server...", Toast.LENGTH_SHORT).show();
                }
            } catch (JSONException | InterruptedException e) {
                e.printStackTrace();
            }

            return mExpandableListDetail;
        }

        public static ArrayList<String> getRegularListViewData(){
            return mRegularListViewData;
        }

        private static void startAssessment(final String appID){
            // Start the risk assessment and return the full URL with the task id.
            OkHttpClient okHttpClient = new OkHttpClient();
            Request request = new Request.Builder()
                    .url("http://androidrisk.uconn.edu/report/" + appID)
                    .build();
            okHttpClient.newCall(request).enqueue(new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    e.printStackTrace();
                }

                @Override
                public void onResponse(Call call, Response response) throws IOException {
                    if(!response.isSuccessful()){
                        throw new IOException("Unexpected code: " + response);
                    }
                    try {
                        String jsonData = response.body().string();
                        mJSONObject = new JSONObject(jsonData);
                        mFullURL = "http://androidrisk.uconn.edu/report/" + appID + "/" + mJSONObject.getString("task_id");
                        Log.i("DataPump", "Done initializing the risk assessment");
                        completeAssessment();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

        private static void completeAssessment() {
            Log.i("DataPump", "Running completeAssessment");
            OkHttpClient okHttpClient = new OkHttpClient();
            Request request = new Request.Builder()
                    .url(mFullURL)
                    .build();
            okHttpClient.newCall(request).enqueue(new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    e.printStackTrace();
                }

                @Override
                public void onResponse(Call call, Response response) {
                    if(!response.isSuccessful()){
                        System.out.println(response);
                    }
                    try {
                        String jsonData = response.body().string();
                        Log.i("completeAssessment", jsonData);
                        mJSONObject = new JSONObject(jsonData);
                        if(!mJSONObject.getString("report_exists").equals("true")){
                            // If the report doesn't exist yet, ping the server again
                            Log.i("DataPump", "Report doesn't exist yet");
                            Thread.sleep(5000);
                            completeAssessment();
                        }
                        else{
                            // If it does exist, parse the assessment
                            Log.i("completeAssessment", response.body().toString());
                            if(mJSONObject.getString("task_state").equals("SUCCESS")){
                                parseAssessment();
                            }
                            else{
                                Toast.makeText(mContext, "Risk assessment failed!", Toast.LENGTH_LONG).show();
                            }
                        }
                    } catch (JSONException | IOException | InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            });
        }

        private static void parseAssessment(){
            Log.i("parseAssessment", "Running parseAssessment");
            try {
                // Overall scored
                mScoreObject = mJSONObject.getJSONObject("score");

                String overallScore = mScoreObject.getString("overall_score");
                mRegularListViewData.add("Overall score: " + overallScore);

                // Permissions
                JSONObject permissions = mScoreObject.getJSONObject("permissions");
                // Dangerous permissions
                JSONObject dangerous_permissions_json = permissions.getJSONObject("dangerous_permissions");
                List<String> dangerous_permissions = new ArrayList<String>();
                Iterator<?> dangerous_permissions_keys = dangerous_permissions_json.keys();
                while (dangerous_permissions_keys.hasNext()){
                    dangerous_permissions.add((String) dangerous_permissions_keys.next());
                }
                if(dangerous_permissions_json.length() == 0){
                    dangerous_permissions.add("No dangerous permissions found");
                }
                mExpandableListDetail.put("Dangerous Permissions", dangerous_permissions);
                // Total points contributed
                String dangerous_totalPointsContributed = permissions.getString("total_points_contributed");
                dangerous_permissions.add("Total points contributed: " + dangerous_totalPointsContributed);

                // Rating
                String rating = mScoreObject.getString("rating");
                mRegularListViewData.add("Rating: " + rating);

                // Risk Factors
                List<String> riskFactors = new ArrayList<String>();
                JSONObject risk_factors = mScoreObject.getJSONObject("risk_factors");
                JSONObject risk_factors_identified = risk_factors.getJSONObject("risk_factors_identified");
                Iterator<?> risk_factors_keys = risk_factors_identified.keys();
                while(risk_factors_keys.hasNext()){
                    riskFactors.add((String) risk_factors_keys.next());
                }
                if(risk_factors_identified.length() == 0){
                    riskFactors.add("No major risk factors found");
                }
                String risk_totalPointsContributed = risk_factors.getString("total_points_contributed");
                riskFactors.add("Total points contributed: " + risk_totalPointsContributed);
                mExpandableListDetail.put("Risk Factors", riskFactors);

                // Threats
                List<String> threats = new ArrayList<String>();
                JSONArray threats_array = mScoreObject.getJSONArray("threats");
                for(int i=0; i<threats_array.length(); i++){
                    threats.add(threats_array.getString(i));
                }
                if(threats_array.length() == 0){
                    threats.add("No major threats found");
                }
                mExpandableListDetail.put("Threats", threats);

                Log.i("parseAssessment", "Done parsing");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }
}
