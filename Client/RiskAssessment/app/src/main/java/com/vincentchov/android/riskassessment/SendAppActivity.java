package com.vincentchov.android.riskassessment;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Handler;
import android.os.Looper;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
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
    ExpandableListView expandableListView;
    ExpandableListAdapter expandableListAdapter;
    List<String> expandableListTitle;
    HashMap<String, List<String>> expandableListDetail;
    List<String> generalInfoList;
    ListView generalListView;
    ArrayAdapter generalListViewAdapter;

    TextView _sharedTV;
    TextView _greetingTV;
    JSONObject _jsonObject;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_app);

        _sharedTV = (TextView) findViewById(R.id.sharedTV);
        _greetingTV = (TextView) findViewById(R.id.greetingTV);

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
        if (sharedText != null && sharedText.contains("play.google.com/store/apps")) {
            // Update UI to reflect text being shared
            _sharedTV.setText(sharedText);
            Toast.makeText(getApplicationContext(), R.string.sentRequest, Toast.LENGTH_LONG).show();


            // Wait two seconds
            Handler handler = new Handler();
            handler.postDelayed(new Runnable() {
                @Override
                public void run() {
                    Toast.makeText(getApplicationContext(), R.string.assRecvd, Toast.LENGTH_LONG).show();
                    _greetingTV.setVisibility(View.GONE);
                    _sharedTV.setVisibility(View.GONE);
                }
            }, 3000);

        } else {
            _sharedTV.setText(R.string.whyYouNoLinkToApp);
        }

    }

    public class ExpandableListDataPump{
        private HashMap<String, List<String>> mExpandableListDetail;
        private ArrayList<String> mRegularListViewData;
        private JSONObject mJSONObject;
        private String mFullURL;
        Context mContext = SendAppActivity.this.getApplicationContext();

        public Context getAppContext(){
            return mContext;
        }

        public HashMap<String, List<String>> getExpandableListDetail(String appID) {
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
            mRegularListViewData.add(appID);

            Log.i("DataPump", "Starting the assessment");

            // Start and complete the Risk Assessment report asynchronously
            startAssessment(appID);
            // Block until the report is retrieved
            Handler handler = new Handler(Looper.getMainLooper());
            try {
                while(!mJSONObject.getString("report_exists").equals("true")){
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
                            Log.i("getData", "Waiting for the report to be done...");
                        }
                    }, 5000);
                }
            } catch (JSONException e) {
                e.printStackTrace();
            }

            return mExpandableListDetail;
        }

        public ArrayList<String> getRegularListViewData(){
            return mRegularListViewData;
        }

        private void startAssessment(final String appID){
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

        private void completeAssessment() throws JSONException {
            // Every 5 seconds refresh the value of the JSON until the task is completed
            ((Activity) mContext).runOnUiThread(new Runnable() {
                @Override
                public void run() {
                    Handler handler = new Handler();
                    handler.postDelayed(new Runnable() {
                        @Override
                        public void run() {
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
                                public void onResponse(Call call, Response response) throws IOException {
                                    if(!response.isSuccessful()){
                                        throw new IOException("Unexpected code: " + response);
                                    }
                                    try {
                                        String jsonData = response.body().string();
                                        Log.i("completeAssessment", jsonData);
                                        mJSONObject = new JSONObject(jsonData);
                                        if(!mJSONObject.getString("report_exists").equals("true")){
                                            // If the report doesn't exist yet, ping the server again
                                            Log.i("DataPump", "Report doesn't exist yet");
//                                        completeAssessment();
                                        }
                                        else{
                                            // If it does exist, parse the assessment
                                            parseAssessment();
                                        }
                                    } catch (JSONException e) {
                                        e.printStackTrace();
                                    }
                                }
                            });
                        }
                    }, 5000);
                }
            });
        }

        private void parseAssessment(){
            try {
                // Overall score
                String overallScore = mJSONObject.getString("overall_score");
                mRegularListViewData.add(overallScore);

                // Permissions
                JSONObject permissions = mJSONObject.getJSONObject("permissions");
                // Dangerous permissions
                JSONObject dangerous_permissions_json = permissions.getJSONObject("dangerous_permissions");
                List<String> dangerous_permissions = new ArrayList<String>();
                Iterator<?> dangerous_permissions_keys = dangerous_permissions_json.keys();
                while (dangerous_permissions_keys.hasNext()){
                    dangerous_permissions.add((String) dangerous_permissions_keys.next());
                }
                mExpandableListDetail.put("Dangerous Permissions", dangerous_permissions);
                // Total points contributed
                String dangerous_totalPointsContributed = permissions.getString("total_points_contributed");
                dangerous_permissions.add(dangerous_totalPointsContributed);

                // Rating
                String rating = mJSONObject.getString("rating");
                mRegularListViewData.add(rating);

                // Risk Factors
                List<String> riskFactors = new ArrayList<String>();
                JSONObject risk_factors = mJSONObject.getJSONObject("risk_factors");
                JSONObject risk_factors_identified = risk_factors.getJSONObject("risk_factors_identified");
                Iterator<?> risk_factors_keys = risk_factors_identified.keys();
                while(risk_factors_keys.hasNext()){
                    riskFactors.add((String) risk_factors_keys.next());
                }
                String risk_totalPointsContributed = risk_factors.getString("total_points_contributed");
                riskFactors.add(risk_totalPointsContributed);
                mExpandableListDetail.put("Risk Factors", riskFactors);

                // Threats
                List<String> threats = new ArrayList<String>();
                JSONArray threats_array = mJSONObject.getJSONArray("threats");
                for(int i=0; i<threats_array.length(); i++){
                    threats.add(threats_array.getString(i));
                }
                mExpandableListDetail.put("Threats", threats);

                Log.i("parseAssessment", "Done parsing");
            } catch (JSONException e) {
                e.printStackTrace();
            }
        }
    }

}
