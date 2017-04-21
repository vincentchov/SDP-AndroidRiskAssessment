package com.vincentchov.android.riskassessment;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ArrayAdapter;
import android.widget.ExpandableListAdapter;
import android.widget.ExpandableListView;
import android.widget.ListView;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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

        generalListView = (ListView) findViewById(R.id.generalListView);
        generalInfoList = new ArrayList<String>();
        generalInfoList.add(String.format("App ID: %s", "com.google.earth"));
        generalInfoList.add(String.format("App Name: %s", "Google Earth"));
        generalInfoList.add(String.format("Overall Score: %s", "5"));
        generalListViewAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1, generalInfoList);
        generalListView.setAdapter(generalListViewAdapter);

        expandableListView = (ExpandableListView) findViewById(R.id.expandableListView);
        expandableListDetail = ExpandableListDataPump.getData();
        expandableListTitle = new ArrayList<String>(expandableListDetail.keySet());
        expandableListAdapter = new CustomExpandableListAdapter(this, expandableListTitle, expandableListDetail);
        expandableListView.setAdapter(expandableListAdapter);
    }
}
