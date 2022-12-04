package app.personalitychecker;

import java.util.ArrayList;
import java.util.Random;

public class Quiz {
    private ArrayList<String> questions;
    private ArrayList<String> answer_one;
    private ArrayList<String> answer_two;
    private ArrayList<String> answer_three;
    private ArrayList<String> answer_four;
    private ArrayList<Integer> weight_one;
    private ArrayList<Integer> weight_two;
    private ArrayList<Integer> weight_three;
    private ArrayList<Integer> weight_four;

    /**Initializes default ArrayList size*/
    public Quiz() {
        questions = new ArrayList<String>(21);
        this.answer_one = new ArrayList<String>(21);
        this.answer_two = new ArrayList<String>(21);
        this.answer_three = new ArrayList<String>(21);
        this.answer_four = new ArrayList<String>(21);
        this.weight_one = new ArrayList<Integer>(21);
        this.weight_two = new ArrayList<Integer>(21);
        this.weight_three = new ArrayList<Integer>(21);
        this.weight_four = new ArrayList<Integer>(21);
    }

    /**Randomizes adds the question to the ArrayList and then randomizes the answers and answer weights into the ArrayLists*/
    void setQuiz(String question, Integer weight_one, String answer_one, Integer weight_two, String answer_two, Integer weight_three, String answer_three, Integer weight_four, String answer_four) {
        questions.add(question);
        switch (new Random().nextInt(5)) {
            case 0:
                this.answer_one.add(answer_one);
                this.weight_one.add(weight_one);
                this.answer_two.add(answer_two);
                this.weight_two.add(weight_two);
                this.answer_three.add(answer_three);
                this.weight_three.add(weight_three);
                this.answer_four.add(answer_four);
                this.weight_four.add(weight_four);
                break;
            case 1:
                this.answer_one.add(answer_four);
                this.weight_one.add(weight_four);
                this.answer_two.add(answer_three);
                this.weight_two.add(weight_three);
                this.answer_three.add(answer_two);
                this.weight_three.add(weight_two);
                this.answer_four.add(answer_one);
                this.weight_four.add(weight_one);
                break;
            case 2:
                this.answer_one.add(answer_three);
                this.weight_one.add(weight_three);
                this.answer_two.add(answer_two);
                this.weight_two.add(weight_two);
                this.answer_three.add(answer_one);
                this.weight_three.add(weight_one);
                this.answer_four.add(answer_four);
                this.weight_four.add(weight_four);
                break;
            case 3:
                this.answer_one.add(answer_two);
                this.weight_one.add(weight_two);
                this.answer_two.add(answer_one);
                this.weight_two.add(weight_one);
                this.answer_three.add(answer_four);
                this.weight_three.add(weight_one);
                this.answer_four.add(answer_three);
                this.weight_four.add(weight_three);
                break;
            case 4:
                this.answer_one.add(answer_one);
                this.weight_one.add(weight_one);
                this.answer_two.add(answer_four);
                this.weight_two.add(weight_four);
                this.answer_three.add(answer_three);
                this.weight_three.add(weight_three);
                this.answer_four.add(answer_two);
                this.weight_four.add(weight_two);
                break;
        }
    }

    // getter and setter functions //
    public String getQuestion(int questionNumber) { return this.questions.get(questionNumber); }
    public String getAnswerOne(int questionNumber) { return this.answer_one.get(questionNumber); }
    public String getAnswerTwo(int questionNumber) { return this.answer_two.get(questionNumber); }
    public String getAnswerThree(int questionNumber) { return this.answer_three.get(questionNumber); }
    public String getAnswerFour(int questionNumber) { return this.answer_four.get(questionNumber); }
    public Integer getAnswerWeightOne(int questionNumber) { return this.weight_one.get(questionNumber); }
    public Integer getAnswerWeightTwo(int questionNumber) { return this.weight_two.get(questionNumber); }
    public Integer getAnswerWeightThree(int questionNumber) { return this.weight_three.get(questionNumber); }
    public Integer getAnswerWeightFour(int questionNumber) { return this.weight_four.get(questionNumber); }
    public Integer getQuestionSize() { return questions.size(); }
    public Integer getAnswerOneSize() { return answer_one.size(); }
    public Integer getAnswerTwoSize() { return answer_two.size(); }
    public Integer getAnswerThreeSize() { return answer_three.size(); }
    public Integer getAnswerFourSize() { return answer_four.size(); }
    public Integer getWeightOneSize() { return weight_one.size(); }
    public Integer getWeightTwoSize() { return weight_two.size(); }
    public Integer getWeightThreeSize() { return weight_three.size(); }
    public Integer getWeightFourSize() { return weight_four.size(); }
}