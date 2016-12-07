package com.vincentchov.android.riskassessment;

import android.content.Intent;
import android.os.Handler;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
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
            _greetingTV.setVisibility(View.GONE);
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
                }
            }, 2000);

        } else {
            _sharedTV.setText(R.string.whyYouNoLinkToApp);
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
        _sharedTV.setText(jsonObject.toString());
        Log.i("Info", "Risk Assessment loaded!");

        return jsonObject;
    }

    void parseRiskAssessment(JSONObject riskAssessment){
        try {
            Log.i("parseRiskAssessment", "Parsing!");
            String appName = riskAssessment.getString("app_name");

            // Get everything in the outer risk_factors JSON object
            JSONObject riskFactorsOuter = riskAssessment.getJSONObject("risk_factors");
            Log.i("riskFactorsOuter", riskFactorsOuter.toString());

            // This array contains two dictionaries of dictionaries
            JSONArray riskFactorsArray = riskFactorsOuter.getJSONArray("risk_factors");

            JSONObject knownMalware = riskFactorsArray.getJSONObject(0);
            String KMpresent = knownMalware.getString("present");
            String KMweight = knownMalware.getString("weight");

            JSONObject requestsRoot = riskFactorsArray.getJSONObject(1);
            String RRpresent = knownMalware.getString("present");
            String RRweight = knownMalware.getString("weight");

            String totalWeight = riskFactorsOuter.getString("total_weight");
            String weightRatio = riskFactorsOuter.getString("weight_ratio");
            String totalPointsContributed = riskFactorsOuter.getString("total_points_contributed");

            // Now get dangerous_permissions and its contents
            JSONObject dangerousPermissions = riskAssessment.getJSONObject("dangerous_permissions");
            JSONArray dangerousArray = dangerousPermissions.getJSONArray("dangerous_permissions");
            String dangerousLocation = dangerousArray.getJSONObject(0).getString("location");
            String totalPtsDangerous = dangerousPermissions.getString("total_points_contributed");

            String overallScore = riskAssessment.getString("overall_score");
            String rating = riskAssessment.getString("rating");

        } catch (JSONException e) {
            e.printStackTrace();
        }
    }

}
