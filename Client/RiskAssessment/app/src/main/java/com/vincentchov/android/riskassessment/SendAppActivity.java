package com.vincentchov.android.riskassessment;

import android.content.Intent;
import android.content.res.Resources;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.io.Writer;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;


public class SendAppActivity extends AppCompatActivity {
    TextView _sharedTV;
    TextView _greetingTV;
    LinearLayout mLinearLayout;
    TextView _appNameTV;
    TextView _riskFactorsTV;
    TextView _knownMalwareTV;
    TextView _malwarePresentTV;
    TextView _malwareWeightTV;
    TextView _requestsRootTV;
    TextView _rrPresentTV;
    TextView _rrWeightTV;
    TextView _rfWeightTV;
    TextView _rfWeightRatioTV;
    TextView _rfTotalTV;
    TextView _permissionDangersTV;
    TextView _locationDangerTV;
    TextView _dpTotalTV;
    TextView _overallTV;
    TextView _ratingTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_app);

        mLinearLayout = (LinearLayout) findViewById(R.id.AssessLayout);
        _sharedTV = (TextView) findViewById(R.id.sharedTV);
        _greetingTV = (TextView) findViewById(R.id.greetingTV);
        _appNameTV = (TextView) findViewById(R.id.TV_APP_NAME);
        _riskFactorsTV = (TextView) findViewById(R.id.TV_RISK_FACTORS);
        _knownMalwareTV = (TextView) findViewById(R.id.TV_KNOWN_MALWARE);
        _malwarePresentTV = (TextView) findViewById(R.id.TV_MALWARE_PRESENT);
        _malwareWeightTV = (TextView) findViewById(R.id.TV_MALWARE_WEIGHT);
        _requestsRootTV = (TextView) findViewById(R.id.TV_REQUESTS_ROOT);
        _rrPresentTV = (TextView) findViewById(R.id.TV_RR_PRESENT);
        _rrWeightTV = (TextView) findViewById(R.id.TV_RR_WEIGHT);
        _rfWeightTV = (TextView) findViewById(R.id.TV_RF_WEIGHT);
        _rfWeightRatioTV = (TextView) findViewById(R.id.TV_RF_WEIGHT_RATIO);
        _rfTotalTV = (TextView) findViewById(R.id.TV_RF_TOTAL);
        _permissionDangersTV = (TextView) findViewById(R.id.TV_PERMISSION_DANGERS);
        _locationDangerTV = (TextView) findViewById(R.id.TV_LOCATION_DANGER);
        _dpTotalTV = (TextView) findViewById(R.id.TV_DP_TOTAL);
        _overallTV = (TextView) findViewById(R.id.TV_OVERALL);
        _ratingTV = (TextView) findViewById(R.id.TV_RATING);

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
                    parseRiskAssessment(riskAssessment);
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
        try {
            InputStream inputStream = getApplicationContext().
                                      getResources().
                                      openRawResource(R.raw.google_earth);
            int size = inputStream.available();
            byte[] buffer = new byte[size];
            inputStream.read(buffer);
            inputStream.close();
            jsonString = new String(buffer, "UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }

        JSONObject jsonObject = null;
        try {
            jsonObject = new JSONObject(jsonString);
        } catch (JSONException e) {
            e.printStackTrace();
        }
        Log.i("Info", "Risk Assessment loaded!");

        return jsonObject;
    }

    void parseRiskAssessment(JSONObject riskAssessment){
        try {
            Log.i("parseRiskAssessment", "Parsing!");
            String appName = riskAssessment.getString("app_name");
            _appNameTV.setText(getString(R.string.TAG_APP_NAME, appName));

            // Get everything in the outer risk_factors JSON object
            JSONObject riskFactorsOuter = riskAssessment.getJSONObject("risk_factors");

            // This array contains two dictionaries of dictionaries
            JSONArray riskFactorsArray = riskFactorsOuter.getJSONArray("risk_factors");

            JSONObject knownMalwareWrapper = riskFactorsArray.getJSONObject(0);

            JSONObject knownMalware = knownMalwareWrapper.getJSONObject("known_malware");
            String KMpresent = knownMalware.getString("present");
            _malwarePresentTV.setText(getString(R.string.TAG_MALWARE_PRESENT, KMpresent));
            String KMweight = knownMalware.getString("weight");
            _malwareWeightTV.setText(getString(R.string.TAG_MALWARE_WEIGHT, KMweight));

            JSONObject requestsRootWrapper = riskFactorsArray.getJSONObject(1);
            JSONObject requestsRoot = requestsRootWrapper.getJSONObject("requests_root");
            String RRpresent = requestsRoot.getString("present");
            _rrPresentTV.setText(getString(R.string.TAG_RR_PRESENT, RRpresent));
            String RRweight = requestsRoot.getString("weight");
            _rrWeightTV.setText(getString(R.string.TAG_RR_WEIGHT, RRweight));

            String totalWeight = riskFactorsOuter.getString("total_weight");
            _rfWeightTV.setText(getString(R.string.TAG_RF_WEIGHT, totalWeight));
            String weightRatio = riskFactorsOuter.getString("weight_ratio");
            _rfWeightRatioTV.setText(getString(R.string.TAG_RF_WEIGHT_RATIO, weightRatio));
            String totalPointsContributed = riskFactorsOuter.getString("total_points_contributed");
            _rfTotalTV.setText(getString(R.string.TAG_RF_TOTAL, totalPointsContributed));

            // Now get dangerous_permissions and its contents
            JSONObject dangerousPermissions = riskAssessment.getJSONObject("dangerous_permissions");
            JSONArray dangerousArray = dangerousPermissions.getJSONArray("dangerous_permissions");
            String dangerousLocation = dangerousArray.getJSONObject(0).getString("location");
            _locationDangerTV.setText(getString(R.string.TAG_LOCATION_DANGER, dangerousLocation));
            String totalPtsDangerous = dangerousPermissions.getString("total_points_contributed");
            _dpTotalTV.setText(getString(R.string.TAG_DP_TOTAL, totalPtsDangerous));

            String overallScore = riskAssessment.getString("overall_score");
            _overallTV.setText(getString(R.string.TAG_OVERALL, overallScore));
            String rating = riskAssessment.getString("rating");
            _ratingTV.setText(getString(R.string.TAG_RATING, rating));

            Log.i("parseRiskAssessment", "Finally done with this!");

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
