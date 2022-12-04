package app.personalitychecker;

import androidx.appcompat.app.AppCompatActivity;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.WindowManager;
import android.view.animation.Animation;
import android.view.animation.AnimationUtils;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @SuppressLint("SetTextI18n")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN, WindowManager.LayoutParams.FLAG_FULLSCREEN);
        getSupportActionBar().hide();
        setContentView(R.layout.activity_main);

        // loads animations and screen items //
        Animation topAnim = AnimationUtils.loadAnimation(this, R.anim.top_animation);
        Animation bottomAnim = AnimationUtils.loadAnimation(this, R.anim.bottom_animation);
        Animation btnBottomAnim = AnimationUtils.loadAnimation(this, R.anim.bottom_btn_animation);
        ImageView imgTopAnimation = findViewById(R.id.imgTopAnimation);
        TextView txtMiddle = findViewById(R.id.txtMiddle);
        Button btnStart = findViewById(R.id.btnStart);
        imgTopAnimation.setImageResource(R.drawable.logo);

        // sets text and animates //
        txtMiddle.setText("Personality Checker");
        btnStart .setText("Start");
        imgTopAnimation.setAnimation(topAnim);
        txtMiddle.setAnimation(bottomAnim);
        btnStart.setAnimation(btnBottomAnim);

        // on click start goes to pick categories //
        btnStart.setOnClickListener(v -> start());
    }

    // goes to categories page //
    private void start() {
        startActivity(new Intent(this, Categories.class));
    }
}