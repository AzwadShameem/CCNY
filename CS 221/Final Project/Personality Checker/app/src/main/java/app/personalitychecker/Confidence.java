package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.widget.Button;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;
import android.widget.Toast;

import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.Random;

public class Confidence extends AppCompatActivity {
    @Override
    public void onBackPressed() { Toast.makeText(getApplicationContext(), "Back is disabled", Toast.LENGTH_SHORT).show(); }
    private TextView confidenceQuestionHolder, txtTimer;
    private RadioGroup confidenceRadioGroup;
    private RadioButton btnOptionOne, btnOptionTwo, btnOptionThree, btnOptionFour;
    private Button btnNext;
    private FileUtility databaseManager;
    private Quiz confidenceQuizDatabase;
    private Integer questionNumber, totalScore, q;
    private CountDownTimer timer;
    private final Random r = new Random();
    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_quiz);

        // Registers all the elements on the screen //
        txtTimer = findViewById(R.id.txtTimer);
        confidenceQuestionHolder = findViewById(R.id.questionHolder);
        confidenceRadioGroup = findViewById(R.id.radioGroupChoice);
        btnOptionOne = findViewById(R.id.btnOptionOne);
        btnOptionTwo = findViewById(R.id.btnOptionTwo);
        btnOptionThree = findViewById(R.id.btnOptionThree);
        btnOptionFour = findViewById(R.id.btnOptionFour);
        btnNext = findViewById(R.id.btnNext);

        // Initializes required storage & utility classes & variables //
        databaseManager = new FileUtility();
        confidenceQuizDatabase = new Quiz();
        totalScore = 0;
        q  = 1;

        // Loads all the quiz information from the assets folder //
        InputStreamReader assets;
        try {
            assets = new InputStreamReader(getAssets().open("confidence.txt"));
            databaseManager.readAssets(assets, confidenceQuizDatabase);
            assets.close();
        } catch (IOException e) {
            System.err.println("Error: confidence.java - Could not open confidence.txt from assets folder");
        }

        // Sets the first question to the screen//
        questionNumber = r.nextInt((confidenceQuizDatabase.getQuestionSize()/10));
        timer = new CountDownTimer(35000, 1000) {
            public void onTick(long millisUntilFinished) {
                txtTimer.setText("question: " + (q) + " | " + millisUntilFinished / 1000 +  " seconds remaining");
                setQuestion(questionNumber);
                setAnswers(questionNumber);
                btnNext.setText("Next");
            }

            public void onFinish() {
                btnNext.performClick();
            }
        }.start();

        // Sets the next questions all the way to the end of the test to the screen //
        btnNext.setOnClickListener(v -> {
            grader(questionNumber);
            questionNumber += r.nextInt((confidenceQuizDatabase.getQuestionSize()/10))+1;
            timer.cancel();
            ++q;
            if (q < 11) {
                timer = new CountDownTimer(35000, 1000) {
                    public void onTick(long millisUntilFinished) {
                        txtTimer.setText("question: " + (q) + " | " + millisUntilFinished / 1000 + " seconds remaining");
                        setQuestion(questionNumber);
                        setAnswers(questionNumber);
                        if (q == 10) {
                            btnNext.setText("Finish");
                        }
                    }

                    public void onFinish() {
                        btnNext.performClick();
                    }
                }.start();
            } else {
                databaseManager.saveResults(new File(getCacheDir(), "results.txt"), "confidence", totalScore);
                btnFinish();
            }
        });
    }

    void setQuestion(int questionNumber) {
        confidenceQuestionHolder.setText(confidenceQuizDatabase.getQuestion(questionNumber));
    }

    void setAnswers(int questionNumber) {
        btnOptionOne.setText(confidenceQuizDatabase.getAnswerOne(questionNumber));
        btnOptionTwo.setText(confidenceQuizDatabase.getAnswerTwo(questionNumber));
        btnOptionThree.setText(confidenceQuizDatabase.getAnswerThree(questionNumber));
        btnOptionFour.setText(confidenceQuizDatabase.getAnswerFour(questionNumber));
    }

    void grader(int questionNumber) {
        if (btnOptionOne.getId() == confidenceRadioGroup.getCheckedRadioButtonId()) {
            totalScore += confidenceQuizDatabase.getAnswerWeightOne(questionNumber);
        } else if (btnOptionTwo.getId() == confidenceRadioGroup.getCheckedRadioButtonId()) {
            totalScore += confidenceQuizDatabase.getAnswerWeightTwo(questionNumber);
        } else if (btnOptionThree.getId() == confidenceRadioGroup.getCheckedRadioButtonId()) {
            totalScore += confidenceQuizDatabase.getAnswerWeightThree(questionNumber);
        } else if (btnOptionFour.getId() == confidenceRadioGroup.getCheckedRadioButtonId()) {
            totalScore += confidenceQuizDatabase.getAnswerWeightFour(questionNumber);
        } else { System.err.println("Error: confidence.java - Cannot figure out which radio button has been selected"); }
    }

    private void btnFinish() {
        startActivity(new Intent(this, ConfidenceStatistics.class));
    }
}