package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;
import android.widget.Toast;

// free open license repository on github loaded using gradle repository and dependencies //
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.io.File;
import java.util.ArrayList;

public class ConfidenceStatistics extends AppCompatActivity {
    @Override
    public void onBackPressed() { Toast.makeText(getApplicationContext(), "Back is disabled", Toast.LENGTH_SHORT).show(); }

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_section_statistics);

        // Registers all on screen elements //
        TextView txtConfidenceScore = findViewById(R.id.txtScore);
        TextView txtConfidenceFeedback = findViewById(R.id.txtFeedback);
        Button btnConfidenceToHome = findViewById(R.id.btnHome);
        BarChart confidenceResultsGraph = findViewById(R.id.leadershipResultsGraph);
        btnConfidenceToHome.setText("Home");

        // Loads all the results from file //
        FileUtility databaseManager = new FileUtility();
        Results confidenceResultsDatabase = new Results();
        databaseManager.setResults(new File(getCacheDir(), "results.txt"), confidenceResultsDatabase);

        confidenceResultsGraph.setDrawBarShadow(true);
        confidenceResultsGraph.setDrawValueAboveBar(true);
        confidenceResultsGraph.setMaxVisibleValueCount(50);
        confidenceResultsGraph.setDrawGridBackground(true);
        confidenceResultsGraph.getDescription().setEnabled(false);

        ArrayList<BarEntry> barEntries = new ArrayList<>();
        for (int x = 0, i = (confidenceResultsDatabase.getSizeConfidence()-1);i > -1;i--, x++) {
            barEntries.add(new BarEntry(x, confidenceResultsDatabase.getConfidence(i)));
        }

        BarDataSet barDataSet = new BarDataSet(barEntries, "");
        barDataSet.setColors(ColorTemplate.JOYFUL_COLORS);

        BarData data = new BarData(barDataSet);
        data.setBarWidth(0.9f);
        confidenceResultsGraph.setData(data);

        // Assumed that the ArrayList below has one element, since this page cannot be visited without finishing a confidence quiz //
        txtConfidenceScore.setText("Latest Quiz Result: " + (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence() - 1) / (double) 40) * 100 + "%");
        if (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence()-1) >= 34) {
            txtConfidenceFeedback.setText("Your pretty confident! Your confidence can be a double-edge sword, depending on how you use it it may be a curse or a blessing. So keep your confidence in check or you may seem conceited to your peers, but on the other hand you can use it as a tool for success. So make sure to learn how to control your confidence.");
        } else if (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence()-1) >= 28) {
            txtConfidenceFeedback.setText("Your confidence is at the most suitable level! You have a good amount of confidence for success but not too much either. Use that confidence to bring you success.");
        } else if (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence()-1) == 20) {
            txtConfidenceFeedback.setText("Your confidence level is exactly even. Most people at your confidence level are usually indecisive, however some can also either be extremely critical or passive. Although the negatives, this confidence level is ideal for people who want to change themselves into either more or less confident.");
        } else if (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence()-1) >= 16) {
            txtConfidenceFeedback.setText("Your confidence level is average. Most people in the world have this level of confidence. At this level it is most suitable to improve yourself to whatever level of confidence you desire.");
        } else if (confidenceResultsDatabase.getConfidence(confidenceResultsDatabase.getSizeConfidence()-1) >= 10) {
            txtConfidenceFeedback.setText("Wow, your confidence level is low! You should try motivating yourself once in awhile. Boosting your confidence can be beneficial for you in the future.");
        } else {
            txtConfidenceFeedback.setText("Want to retake the test? Usually people never get this result. Regardless you should find some way to boost your confidence!");
        }


        btnConfidenceToHome.setOnClickListener(v -> onClickBtnHome());
    }
    private void onClickBtnHome() {
        startActivity(new Intent(this, Categories.class));
    }
}