package com.vincentchov.android.riskassessment;

import android.util.Log;

import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class ExpandableListDataPump {
    public static HashMap<String, List<String>> getData() {
        HashMap<String, List<String>> expandableListDetail = new HashMap<String, List<String>>();
        // AppID
        String appID = "com.google.earth";
        List<String> app_ID = new ArrayList<String>();
        app_ID.add(appID);

        // App name
        String appName = "com.google.earth";

        String overallScore = "1";

        // Dangerous permissions
        List<String> dangerous_permissions = new ArrayList<String>();
        dangerous_permissions.add("ACCESS_COARSE_LOCATION: dangerous");
        dangerous_permissions.add("ACCESS_FINE_LOCATION: dangerous");
        dangerous_permissions.add("GET_ACCOUNTS: dangerous");

        // Total points contributed
        String totalPointsContributed = "Total points contributed: 1";
        dangerous_permissions.add(totalPointsContributed);

        // Rating
        String rating = "Rating: Low risk";

        // Risk Factors
        List<String> riskFactors = new ArrayList<String>();
        riskFactors.add("Risk factors identfied: None");
        riskFactors.add("Total points contributed: 1");

//        List<List<String>> stuff = new ArrayList<List<String>>();
//        stuff.add(dangerous_permissions);
//        expandableListDetail.put("Stuff", stuff);
//        expandableListDetail.put("AppID", app_ID);
        expandableListDetail.put("Dangerous permissions", dangerous_permissions);
        expandableListDetail.put("Risk Factors", riskFactors);
        return expandableListDetail;
    }
}