package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.TextView;

public class Categories extends AppCompatActivity {
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_categories);

        // loads and sets screen //
        Button btnConfidence = findViewById(R.id.btnConfidence);
        Button btnLeadership = findViewById(R.id.btnLeadership);
        Button btnIntegrity = findViewById(R.id.btnIntegrity);
        Button btnStats = findViewById(R.id.btnStats);
        Button btnExtra = findViewById(R.id.btnExtra);
        btnLeadership.setText(" Leadership Section ");
        btnConfidence.setText(" Confidence section ");
        btnIntegrity.setText(" Integrity Section ");
        btnExtra.setText(" Extreme Situations Section");
        btnStats.setText(" Statistics Page ");

        // buttons to connect to next activity //
        btnLeadership.setOnClickListener(v -> onClickBtnLeadership());

        btnConfidence.setOnClickListener(v -> onClickBtnConfidence());

        btnIntegrity.setOnClickListener(v -> onClickBtnIntegrity());

        btnStats.setOnClickListener(v -> onClickBtnStats());

        btnExtra.setOnClickListener(v -> onClickBtnExtra());
    }

    // intent to move to new activity //
    private void onClickBtnLeadership() { startActivity(new Intent(this, Leadership.class));}

    private void onClickBtnConfidence() { startActivity(new Intent(this, Confidence.class));}

    private void onClickBtnIntegrity() { startActivity(new Intent(this, Integrity.class));}

    private void onClickBtnStats() { startActivity(new Intent(this, Statistics.class));}

    private void onClickBtnExtra() { startActivity(new Intent(this, ExtremeSituations.class));}
}