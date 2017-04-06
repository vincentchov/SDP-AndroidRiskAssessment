package com.vincentchov.android.riskassessment;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;

import org.json.JSONException;
import org.json.JSONObject;

import java.io.IOException;

import okhttp3.Call;
import okhttp3.Callback;
import okhttp3.Headers;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.Response;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Log.i("Info","Building the OkHttpClient");

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
                    JSONObject jsonObject;
                    try {
                        jsonObject = new JSONObject(jsonData);
                        System.out.println(jsonObject.getJSONObject("score").keys());
                        Log.i("JSON output", jsonObject.toString());
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            });
        } catch (Exception e){
            e.printStackTrace();
        }
    }
}
