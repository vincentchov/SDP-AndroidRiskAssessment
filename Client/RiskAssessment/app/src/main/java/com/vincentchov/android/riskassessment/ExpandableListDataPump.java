package com.vincentchov.android.riskassessment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public class ExpandableListDataPump {
    private static HashMap<String, List<String>> mExpandableListDetail;

    public static HashMap<String, List<String>> getData() {
        mExpandableListDetail = new HashMap<String, List<String>>();
        // AppID
        String appID = "com.google.earth";

        // App name
        String appName = "Google Earth";

        String overallScore = "5";

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
        riskFactors.add("Total points contributed: 4");

        // Threats
        List<String> threats = new ArrayList<String>();
        threats.add("This application contains at least one system-level or developer-defined permission. These types of permissions can exhibit behavior that is not typical of any other permission, and cannot be detected by our algorithm. Most often, these permissions are used for harmless purposes, but they are liable to do anything with the information they are provided.");

        mExpandableListDetail.put("Dangerous permissions", dangerous_permissions);
        mExpandableListDetail.put("Risk Factors", riskFactors);
        mExpandableListDetail.put("Threats", threats);
        return mExpandableListDetail;
    }
}