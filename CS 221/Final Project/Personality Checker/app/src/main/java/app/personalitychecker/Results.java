package app.personalitychecker;

import java.util.ArrayList;

public class Results {
    private ArrayList<Integer> confidence;
    private ArrayList<Integer> leadership;
    private ArrayList<Integer> integrity;
    private ArrayList<Integer> extra;

    /**initialize ArrayLists*/
    public Results() {
        confidence = new ArrayList<Integer>();
        leadership = new ArrayList<Integer>();
        integrity = new ArrayList<Integer>();
        extra = new ArrayList<Integer>();
    }

    // setters and getter functions //
    public ArrayList<Integer> getConfidence() {
        return confidence;
    }

    public ArrayList<Integer> getIntegrity() { return integrity; }

    public ArrayList<Integer> getLeadership() {
        return leadership;
    }

    public ArrayList<Integer> getExtra() {
        return extra;
    }

    public void setConfidence(int entry) {
        confidence.add(entry);
    }

    public void setLeadership(int entry) {
        leadership.add(entry);
    }

    public void setIntegrity(int entry) {
        integrity.add(entry);
    }

    public void setExtra(int entry) {
        extra.add(entry);
    }

    public Integer getConfidence(int entry) { return confidence.get(entry); }

    public Integer getLeadership(int entry) {
        return leadership.get(entry);
    }

    public Integer getIntegrity(int entry) {
        return integrity.get(entry);
    }

    public Integer getExtra(int entry) {
        return extra.get(entry);
    }

    public int getSizeConfidence() {
        return confidence.size();
    }

    public int getSizeLeadership() {
        return leadership.size();
    }

    public int getSizeIntegrity() {
        return integrity.size();
    }

    public int getSizeExtra() {
        return extra.size();
    }
}
