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
import java.util.Iterator;

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
                    loadJSONObject();
                    _greetingTV.setVisibility(View.GONE);
                    _sharedTV.setVisibility(View.GONE);
                    mLinearLayout.setVisibility(View.VISIBLE);       // Make the assessments visible
                }
            }, 3000);

        } else {
//            _sharedTV.setText(R.string.whyYouNoLinkToApp);
        }
    }

    public void loadJSONObject() {
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

                        final JSONObject score = _jsonObject.getJSONObject("score");
                        runOnUiThread(new Runnable() {
                            @Override
                            public void run() {
                                parseRiskAssessment(score);
                            }
                        });
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            });
        } catch (Exception e){
            e.printStackTrace();
        }
        Log.i("Info", "Risk Assessment loaded!");
//        return _jsonObject;
    }

    void parseRiskAssessment(JSONObject riskAssessment){
        try {
            Log.i("parseRiskAssessment", "Parsing!");

            // AppID
            String appID = riskAssessment.getString("app_id");

            // App name
            String appName = riskAssessment.getString("app_name");
            System.out.println(riskAssessment.getString("app_name"));
            _appNameTV.setText(getString(R.string.TAG_APP_NAME, appName));

            String overallScore = riskAssessment.getString("overall_score");
            _overallTV.setText(getString(R.string.TAG_OVERALL, overallScore));

            // Permissions
            JSONObject permissions = riskAssessment.getJSONObject("permissions");

            // Dangerous permissions
            JSONObject dangerous_permissions = permissions.getJSONObject("dangerous_permissions");
            String dangerous_permissions_string = "";
            Iterator<?> dangerous_permissions_keys = dangerous_permissions.keys();
            while (dangerous_permissions_keys.hasNext()){
                 dangerous_permissions_string += dangerous_permissions_keys.next() + "\n\t";
            }
            _permissionDangersTV.setText(getString(R.string.TAG_PERMISSION_DANGERS, dangerous_permissions_string));

            // Total points contributed
            String totalPointsContributed = permissions.getString("total_points_contributed");
            _totalTV.setText(getString(R.string.TAG_TOTAL, totalPointsContributed));

            // Rating
            String rating = riskAssessment.getString("rating");
            _ratingTV.setText(getString(R.string.TAG_RATING, rating));

            // Risk Factors
            JSONObject risk_factors = riskAssessment.getJSONObject("risk_factors");
            JSONObject risk_factors_identified = risk_factors.getJSONObject("risk_factors_identified");
            Iterator<?> risk_factors_keys = risk_factors_identified.keys();
            String risk_factors_string = "";
            while(risk_factors_keys.hasNext()){
                risk_factors_string += risk_factors_keys.next() + "\n";
            }
            _riskFactorsTV.setText(getString(R.string.TAG_RISK_FACTORS, risk_factors_string));

            Log.i("parseRiskAssessment", "Finally done with this!");

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
