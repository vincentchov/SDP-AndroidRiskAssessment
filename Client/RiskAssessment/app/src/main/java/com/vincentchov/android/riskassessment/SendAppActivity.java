package com.vincentchov.android.riskassessment;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.util.Arrays;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;


public class SendAppActivity extends AppCompatActivity {
    TextView _sharedTV;
    TextView _greetingTV;
    LinearLayout mLinearLayout;
    TextView _permissionDangersTV;
    TextView _riskFactorsTV;
    TextView _systemPermissionsTV;
    TextView _ratingTV;
    TextView _appNameTV;
    TextView _totalTV;
    TextView _overallTV;
    JSONObject _jsonObject;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_app);

        mLinearLayout = (LinearLayout) findViewById(R.id.AssessLayout);
        _sharedTV = (TextView) findViewById(R.id.sharedTV);
        _greetingTV = (TextView) findViewById(R.id.greetingTV);
        _appNameTV = (TextView) findViewById(R.id.TV_APP_NAME);
        _riskFactorsTV = (TextView) findViewById(R.id.TV_RISK_FACTORS);
        _permissionDangersTV = (TextView) findViewById(R.id.TV_PERMISSION_DANGERS);
        _systemPermissionsTV = (TextView) findViewById(R.id.TV_SYSTEM_PERMISSIONS);
        _ratingTV = (TextView) findViewById(R.id.TV_RATING);
        _totalTV = (TextView) findViewById(R.id.TV_TOTAL);
        _overallTV = (TextView) findViewById(R.id.TV_OVERALL);

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
                    JSONObject riskAssessment = loadJSONObject();             // Load the JSONObject
                    try {
                        JSONObject score = riskAssessment.getJSONObject("score");
                        parseRiskAssessment(score);
                    } catch (JSONException e) {
                        e.printStackTrace();
                    } catch (Exception e){
                        e.printStackTrace();
                    }

                    _greetingTV.setVisibility(View.GONE);
                    _sharedTV.setVisibility(View.GONE);
                    mLinearLayout.setVisibility(View.VISIBLE);       // Make the assessments visible
                }
            }, 3000);

        } else {
//            _sharedTV.setText(R.string.whyYouNoLinkToApp);
        }
    }

    public JSONObject loadJSONObject() {
        String jsonString = null;
        _jsonObject = null;
        try {
            OkHttpClient okHttpClient = new OkHttpClient();
            Request request = new Request.Builder()
                    .url("http://androidrisk.uconn.edu/report/foobar")
                    .build();

            okHttpClient.newCall(request).enqueue(new Callback() {
                @Override
                public void onFailure(Call call, IOException e) {
                    e.printStackTrace();
                }

                @Override
                public void onResponse(Call call, Response response) throws IOException {
                    if(response.isSuccessful() == false){
                        throw new IOException("Unexpected code: " + response);
                    }

                    String jsonData = response.body().string();
                    Log.i("loadJSONObject string", jsonData);

                    try {
                        _jsonObject = new JSONObject(jsonData);
                        Log.i("loadJSONObject", _jsonObject.toString());

                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            });
        } catch (Exception e){
            e.printStackTrace();
        }
        Log.i("Info", "Risk Assessment loaded!");

        Log.i("loadJSONObject b4return", _jsonObject.toString());

        return _jsonObject;
    }

    void parseRiskAssessment(JSONObject riskAssessment){
        try {
            Log.i("parseRiskAssessment", "Parsing!");

//            // App name
            String appName = riskAssessment.getString("app_name");
            System.out.println(riskAssessment.getString("app_name"));
            _appNameTV.setText(getString(R.string.TAG_APP_NAME, appName));

            // Risk Factors
            String riskFactors = riskAssessment.getString("risk_factors");
            _riskFactorsTV.setText(getString(R.string.TAG_RISK_FACTORS, riskFactors));

            // Skipping AppID for now

            // Dangerous permissions
            JSONArray dangerousArray = riskAssessment.getJSONArray("dangerous_permissions");
            _permissionDangersTV.setText(getString(R.string.TAG_PERMISSION_DANGERS, dangerousArray.toString()));

            // System permissions
            JSONArray systemPermissionsArray = riskAssessment.getJSONArray("system_permissions");
            _systemPermissionsTV.setText(getString(R.string.TAG_SYSTEM_PERMISSIONS, systemPermissionsArray.toString()));

            // Total points contributed
            String totalPointsContributed = riskAssessment.getString("total_points_contributed");
            _totalTV.setText(getString(R.string.TAG_TOTAL, totalPointsContributed));

            String overallScore = riskAssessment.getString("overall_score");
            _overallTV.setText(getString(R.string.TAG_OVERALL, overallScore));

            // Rating
            String rating = riskAssessment.getString("rating");
            _ratingTV.setText(getString(R.string.TAG_RATING, rating));

            Log.i("parseRiskAssessment", "Finally done with this!");

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
