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

public class LeadershipStatistics extends AppCompatActivity {
    @Override
    public void onBackPressed() { Toast.makeText(getApplicationContext(), "Back is disabled", Toast.LENGTH_SHORT).show(); }

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_section_statistics);

        // Registers all on screen elements //
        TextView txtLeadershipScore = findViewById(R.id.txtScore);
        TextView txtLeadershipFeedback = findViewById(R.id.txtFeedback);
        BarChart leadershipResultsGraph = findViewById(R.id.leadershipResultsGraph);
        Button btnLeadershipToHome = findViewById(R.id.btnHome);
        btnLeadershipToHome.setText("Home");

        // Loads all the results from file //
        FileUtility databaseManager = new FileUtility();
        Results leadershipResultsDatabase = new Results();
        databaseManager.setResults(new File(getCacheDir(), "results.txt"), leadershipResultsDatabase);

        leadershipResultsGraph.setDrawBarShadow(true);
        leadershipResultsGraph.setDrawValueAboveBar(true);
        leadershipResultsGraph.setMaxVisibleValueCount(50);
        leadershipResultsGraph.setDrawGridBackground(false);
        leadershipResultsGraph.getDescription().setEnabled(false);

        ArrayList<BarEntry> barEntries = new ArrayList<>();
        for (int x = 0, i = (leadershipResultsDatabase.getSizeLeadership()-1);i > -1;i--, x++) {
            barEntries.add(new BarEntry(x, leadershipResultsDatabase.getLeadership(i)));
        }

        BarDataSet barDataSet = new BarDataSet(barEntries, "");
        barDataSet.setColors(ColorTemplate.JOYFUL_COLORS);

        BarData data = new BarData(barDataSet);
        data.setBarWidth(0.9f);
        leadershipResultsGraph.setData(data);

        // Assumed that the ArrayList below has one element, since this page cannot be visited without finishing a leadership quiz //
        txtLeadershipScore.setText("Latest Quiz Result: " + (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership() - 1) / (double) 40) * 100 + "%");
        if (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership()-1) >= 34) {
            txtLeadershipFeedback.setText("You are a pretty good leader! Leaders have a lot of weight on their shoulders so don't be afraid of asking for help once in awhile. In any case leadership is a great tool for success.");
        } else if (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership()-1) >= 28) {
            txtLeadershipFeedback.setText("You are a good leader! You have a good amount of leadership skills. Use that talent to bring your group success. A good leader can change the entire dynamic of team so try your best to stay as a good leader.");
        } else if (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership()-1) == 20) {
            txtLeadershipFeedback.setText("You are a average leader. Most people at this level of leadership skills are too critical or too passive. Although you might be average now, that doesn't mean you can improve yourself in the future.");
        } else if (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership()-1) >= 16) {
            txtLeadershipFeedback.setText("You are an average leader. This level of leadership is normal for most people. Although you are average now, this level it is most suitable to improve yourself to whatever level you desire.");
        } else if (leadershipResultsDatabase.getLeadership(leadershipResultsDatabase.getSizeLeadership()-1) >= 10) {
            txtLeadershipFeedback.setText("Wow, your leadership skill is low! You should try improving your leadership skills, practice makes best. Boosting your leadership skills can change your capabilities drastically so don't be afriad of improving yourself.");
        } else {
            txtLeadershipFeedback.setText("Want to retake the test? Usually people never get this result. Regardless you should find some way to boost your leadership skills!");
        }

        btnLeadershipToHome.setOnClickListener(v -> btnHome());
    }
    private void btnHome() {
        startActivity(new Intent(this, Categories.class));
    }
}