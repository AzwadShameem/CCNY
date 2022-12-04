package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

// free open license repository on github loaded using gradle repository and dependencies //
import com.github.mikephil.charting.charts.BarChart;
import com.github.mikephil.charting.data.BarData;
import com.github.mikephil.charting.data.BarDataSet;
import com.github.mikephil.charting.data.BarEntry;
import com.github.mikephil.charting.utils.ColorTemplate;

import java.io.File;
import java.util.ArrayList;

public class IntegrityStatistics extends AppCompatActivity {
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_section_statistics);

        // Registers all on screen elements //
        TextView txtIntegrityScore = findViewById(R.id.txtScore);
        TextView txtIntegrityFeedback = findViewById(R.id.txtFeedback);
        Button btnIntegrityToHome = findViewById(R.id.btnHome);
        BarChart integrityResultsGraph = findViewById(R.id.leadershipResultsGraph);
        btnIntegrityToHome.setText("Home");

        // Loads all the results from file //
        FileUtility databaseManager = new FileUtility();
        Results integrityResultsDatabase = new Results();
        databaseManager.setResults(new File(getCacheDir(), "results.txt"), integrityResultsDatabase);

        integrityResultsGraph.setDrawBarShadow(true);
        integrityResultsGraph.setDrawValueAboveBar(true);
        integrityResultsGraph.setMaxVisibleValueCount(50);
        integrityResultsGraph.setDrawGridBackground(true);
        integrityResultsGraph.getDescription().setEnabled(false);

        ArrayList<BarEntry> barEntries = new ArrayList<>();
        for (int x = 0, i = (integrityResultsDatabase.getSizeIntegrity()-1);i > -1;i--, x++) {
            barEntries.add(new BarEntry(x, integrityResultsDatabase.getIntegrity(i)));
        }

        BarDataSet barDataSet = new BarDataSet(barEntries, "");
        barDataSet.setColors(ColorTemplate.JOYFUL_COLORS);

        BarData data = new BarData(barDataSet);
        data.setBarWidth(0.9f);
        integrityResultsGraph.setData(data);

        // Assumed that the ArrayList below has one element, since this page cannot be visited without finishing a integrity quiz //
        txtIntegrityScore.setText("Latest Quiz Result: " + ((integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity() - 1)) / (double) 40) * 100 + "%");
        if (integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity()-1) >= 34) {
            txtIntegrityFeedback.setText("Your pretty integral! We need more people like you in this world! Although we appreciate your integrity, being this honest can be a double-edge sword, depending on how you use it it may be a curse or a blessing. Being as integral as you are, you can create great relationships with others but due to the same integrity it can also bring you many hardships. Don't be afraid to lie once in a awhile to save your skin.");
        } else if (integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity()-1) >= 28) {
            txtIntegrityFeedback.setText("Your integrity is at a suitable level! You are honest most of the time but you don't shy away from telling a white lie to protect yourself. You should try your best to stay at this level of integrity.");
        } else if (integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity()-1) == 20) {
            txtIntegrityFeedback.setText("Your level of integrity is exactly even. Most people at your level of integrity are always deciding whether to tell the truth or lie. People at this stage should choose their words carefully because depending on their choices they can change very easily.");
        } else if (integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity()-1) >= 16) {
            txtIntegrityFeedback.setText("Your level of integrity is average. Most people in the world have this level of integrity. At this level it is most suitable to improve yourself to whatever level of integrity you desire.");
        } else if (integrityResultsDatabase.getIntegrity(integrityResultsDatabase.getSizeIntegrity()-1) >= 10) {
            txtIntegrityFeedback.setText("Wow, your level of integrity is low! You should try focusing on your morals and being honest. Increasing your integrity will help you to create real relationships in the future.");
        } else {
            txtIntegrityFeedback.setText("Want to retake the test? Usually people never get this result. Regardless you should find some way to boost your integrity!");
        }

        btnIntegrityToHome.setOnClickListener(v -> btnHome());
    }
    private void btnHome() {
        startActivity(new Intent(this, Categories.class));
    }
}