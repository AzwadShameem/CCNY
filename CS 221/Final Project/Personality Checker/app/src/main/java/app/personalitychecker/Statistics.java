package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.TextView;

import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.io.File;
import java.util.ArrayList;

public class Statistics extends AppCompatActivity {
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        //gets animations//
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        Animation topAnim = AnimationUtils.loadAnimation(this, R.anim.top_animation);
        Animation rightAnim = AnimationUtils.loadAnimation(this, R.anim.right_animation);
        Animation leftAnim = AnimationUtils.loadAnimation(this, R.anim.left_animation);
        Animation bottom_btn_Anim = AnimationUtils.loadAnimation(this, R.anim.bottom_btn_animation);
        setContentView(R.layout.activity_statistics);

        //gets on screen items from activity//
        BarChart leadershipResultsGraph = findViewById(R.id.leadershipResultsGraph);
        BarChart confidenceResultsGraph = findViewById(R.id.confidenceResultsGraph);
        BarChart integrityResultsGraph = findViewById(R.id.integrityResultsGraph);
        BarChart extremeSituationsResultsGraph = findViewById(R.id.extremeSituationsResultsGraph);
        TextView txtLeadership = findViewById(R.id.txtLeadership);
        TextView txtConfidence = findViewById(R.id.txtConfidence);
        TextView txtIntegrity = findViewById(R.id.txtIntegrity);
        TextView txtExtremeSituations = findViewById(R.id.txtExtremeSituations);
        Button btnHome = findViewById(R.id.btnHome);
        btnHome.setText("Home");

        //gets results data//
        FileUtility databaseManager = new FileUtility();
        Results resultsDatabase = new Results();
        databaseManager.setResults(new File(getCacheDir(), "results.txt"), resultsDatabase);

        // creates graph and designs it //
        graphDesign(leadershipResultsGraph);
        graphDesign(confidenceResultsGraph);
        graphDesign(integrityResultsGraph);
        graphDesign(extremeSituationsResultsGraph);

        //creates and initalize ArrayList to store data into//
        ArrayList<BarEntry> leadershipBarEntries = new ArrayList<>();
        ArrayList<BarEntry> confidenceBarEntries = new ArrayList<>();
        ArrayList<BarEntry> integrityBarEntries = new ArrayList<>();
        ArrayList<BarEntry> extremeSituationsBarEntries = new ArrayList<>();
        for (int x = 0, i = (resultsDatabase.getSizeLeadership()-1);i > -1;i--, x++) { leadershipBarEntries.add(new BarEntry(x, resultsDatabase.getLeadership(i))); }
        for (int x = 0, i = (resultsDatabase.getSizeConfidence()-1);i > -1;i--, x++) { confidenceBarEntries.add(new BarEntry(x, resultsDatabase.getConfidence(i))); }
        for (int x = 0, i = (resultsDatabase.getSizeIntegrity()-1);i > -1;i--, x++) { integrityBarEntries.add(new BarEntry(x, resultsDatabase.getIntegrity(i))); }
        for (int x = 0, i = (resultsDatabase.getSizeExtra()-1);i > -1;i--, x++) { extremeSituationsBarEntries.add(new BarEntry(x, resultsDatabase.getExtra(i))); }

        //draws data onto the bar graph//
        graphBuild(leadershipBarEntries, leadershipResultsGraph);
        graphBuild(confidenceBarEntries, confidenceResultsGraph);
        graphBuild(integrityBarEntries, integrityResultsGraph);
        graphBuild(extremeSituationsBarEntries, extremeSituationsResultsGraph);

        //writes recent results to screen//
        if (resultsDatabase.getSizeLeadership() == 0) {
            txtLeadership.setText("Leadership Quiz was never completed");
        } else {
            txtLeadership.setText("Latest Leadership Quiz Result: " + (resultsDatabase.getLeadership(resultsDatabase.getSizeLeadership() - 1) / (double) 40) * 100 + "%");
        }

        if (resultsDatabase.getSizeConfidence() == 0) {
            txtConfidence.setText("Confidence Quiz was never completed");
        } else {
            txtConfidence.setText("Latest Confidence Quiz Result: " + (resultsDatabase.getConfidence(resultsDatabase.getSizeConfidence() - 1) / (double) 40) * 100 + "%");
        }

        if (resultsDatabase.getSizeIntegrity() == 0) {
            txtIntegrity.setText("Integrity Quiz was never completed");
        } else {
            txtIntegrity.setText("Latest Integrity Quiz Result: " + (resultsDatabase.getIntegrity(resultsDatabase.getSizeIntegrity() - 1) / (double) 40) * 100 + "%");
        }

        if (resultsDatabase.getSizeExtra() == 0) {
            txtExtremeSituations.setText("Extreme Situations Quiz was never completed");
        } else {
            txtExtremeSituations.setText("Latest Extreme Situations Quiz Result: " + (resultsDatabase.getExtra(resultsDatabase.getSizeExtra() - 1) / (double) 40) * 100 + "%");
        }

        //sets animation//
        leadershipResultsGraph.setAnimation(topAnim);
        txtLeadership.setAnimation(topAnim);
        confidenceResultsGraph.setAnimation(rightAnim);
        txtConfidence.setAnimation(rightAnim);
        extremeSituationsResultsGraph.setAnimation(bottom_btn_Anim);
        txtExtremeSituations.setAnimation(bottom_btn_Anim);
        integrityResultsGraph.setAnimation(leftAnim);
        txtIntegrity.setAnimation(leftAnim);
        //btnHome.setAnimation(bottom_btn_Anim);

        btnHome.setOnClickListener(v -> setOnClickBtnHome());
    }
    private void setOnClickBtnHome() { startActivity(new Intent(this, Categories.class)); }

    //designs graph details//
    private void graphDesign(BarChart chart) {
        chart.setDrawBarShadow(true);
        chart.setDrawValueAboveBar(true);
        chart.setMaxVisibleValueCount(50);
        chart.setDrawGridBackground(false);
        chart.getDescription().setEnabled(false);
    }

    //draws data onto the graph//
    private void graphBuild(ArrayList<BarEntry> entries, BarChart chart) {
        BarDataSet set = new BarDataSet(entries, "");
        set.setColors(ColorTemplate.JOYFUL_COLORS);
        BarData data = new BarData(set);
        data.setBarWidth(0.9f);
        chart.setData(data);
    }
}