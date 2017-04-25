package com.vincentchov.android.riskassessment;

import android.content.Context;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.widget.ArrayAdapter;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ListView;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {
    ExpandableListView expandableListView;
    ExpandableListAdapter expandableListAdapter;
    List<String> expandableListTitle;
    HashMap<String, List<String>> expandableListDetail;
    List<String> generalInfoList;
    ListView generalListView;
    ArrayAdapter generalListViewAdapter;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

//        ExpandableListDataPump.mContext = this;
//        expandableListView = (ExpandableListView) findViewById(R.id.expandableListView);
//        expandableListDetail = ExpandableListDataPump.getExpandableListDetail("com.google.earth");
//        expandableListTitle = new ArrayList<String>(expandableListDetail.keySet());
//        expandableListAdapter = new CustomExpandableListAdapter(this, expandableListTitle, expandableListDetail);
//        expandableListView.setAdapter(expandableListAdapter);
//
//        generalListView = (ListView) findViewById(R.id.generalListView);
//        generalInfoList = ExpandableListDataPump.getRegularListViewData();
//        generalListViewAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, generalInfoList);
//        generalListView.setAdapter(generalListViewAdapter);

        Log.i("MainActivity", "Done setting adapters");
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
            mRegularListViewData.add(appID);

            Log.i("DataPump", "Starting the assessment");

            // Start and complete the Risk Assessment report asynchronously
            startAssessment(appID);
            // Block until the report is retrieved
            try {
                while(!mJSONObject.getString("report_exists").equals("true")){
                    Thread.sleep(5000);
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
                            parseAssessment();
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
                mRegularListViewData.add(overallScore);

                // Permissions
                JSONObject permissions = mScoreObject.getJSONObject("permissions");
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
                String rating = mScoreObject.getString("rating");
                mRegularListViewData.add(rating);

                // Risk Factors
                List<String> riskFactors = new ArrayList<String>();
                JSONObject risk_factors = mScoreObject.getJSONObject("risk_factors");
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
                JSONArray threats_array = mScoreObject.getJSONArray("threats");
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
