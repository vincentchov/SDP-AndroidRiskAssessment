package com.vincentchov.android.riskassessment;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.TextView;

public class SendAppActivity extends AppCompatActivity {
    TextView _sharedTV;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_send_app);

        _sharedTV = (TextView) findViewById(R.id.sharedTV);

        // Get intent, action and MIME type
        Intent intent = getIntent();
        String action = intent.getAction();
        String type = intent.getType();

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
        } else {
            _sharedTV.setText(R.string.whyYouNoLinkToApp);
        }
    }
}
