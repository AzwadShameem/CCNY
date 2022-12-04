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

public class ExtremeSituationsStatistics extends AppCompatActivity {
    @Override
    public void onBackPressed() { Toast.makeText(getApplicationContext(), "Back is disabled", Toast.LENGTH_SHORT).show(); }

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_section_statistics);

        // Registers all on screen elements //
        TextView txtExtremeScore = findViewById(R.id.txtScore);
        TextView txtExtremeFeedback = findViewById(R.id.txtFeedback);
        Button btnExtremeToHome = findViewById(R.id.btnHome);
        BarChart extremeResultsGraph = findViewById(R.id.leadershipResultsGraph);
        btnExtremeToHome.setText("Home");

        // Loads all the results from file //
        FileUtility databaseManager = new FileUtility();
        Results extremeResultsDatabase = new Results();
        databaseManager.setResults(new File(getCacheDir(), "results.txt"), extremeResultsDatabase);

        // adjusts bar graph //
        extremeResultsGraph.setDrawBarShadow(true);
        extremeResultsGraph.setDrawValueAboveBar(true);
        extremeResultsGraph.setMaxVisibleValueCount(50);
        extremeResultsGraph.setDrawGridBackground(true);
        extremeResultsGraph.getDescription().setEnabled(false);

        ArrayList<BarEntry> barEntries = new ArrayList<>();
        for (int x = 0, i = (extremeResultsDatabase.getSizeExtra()-1);i > -1;i--, x++) {
            barEntries.add(new BarEntry(x, extremeResultsDatabase.getExtra(i)));
        }

        BarDataSet barDataSet = new BarDataSet(barEntries, "");
        barDataSet.setColors(ColorTemplate.JOYFUL_COLORS);

        BarData data = new BarData(barDataSet);
        data.setBarWidth(0.9f);
        extremeResultsGraph.setData(data);

        // Assumed that the ArrayList below has one element, since this page cannot be visited without finishing a extreme quiz //
        txtExtremeScore.setText("Latest Quiz Result: " + (extremeResultsDatabase.getLeadership(extremeResultsDatabase.getSizeLeadership() - 1) / (double) 40) * 100 + "%");
        if (extremeResultsDatabase.getExtra(extremeResultsDatabase.getSizeExtra()-1) >= 34) {
            txtExtremeFeedback.setText("Wow you will do great in dangerous situations");
        } else if (extremeResultsDatabase.getExtra(extremeResultsDatabase.getSizeExtra()-1) >= 28) {
            txtExtremeFeedback.setText("You will be able to survive most dangerous situations");
        } else if (extremeResultsDatabase.getExtra(extremeResultsDatabase.getSizeExtra()-1) == 20) {
            txtExtremeFeedback.setText("You will survive exactly 50% of the dangerous situations");
        } else if (extremeResultsDatabase.getExtra(extremeResultsDatabase.getSizeExtra()-1) >= 16) {
            txtExtremeFeedback.setText("You will not be able to survive most dangerous situations");
        } else if (extremeResultsDatabase.getExtra(extremeResultsDatabase.getSizeExtra()-1) >= 10) {
            txtExtremeFeedback.setText("You will struggle with dangerous situations");
        } else {
            txtExtremeFeedback.setText("Want to retake the test?");
        }


        btnExtremeToHome.setOnClickListener(v -> onClickBtnHome());
    }
    private void onClickBtnHome() {
        startActivity(new Intent(this, Categories.class));
    }
}