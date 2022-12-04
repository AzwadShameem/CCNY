package app.personalitychecker;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class FileUtility {
    /**reads assets and then stores the quiz into the quiz class */
    public void readAssets(InputStreamReader assets, Quiz quiz) {
        BufferedReader questionsReader = null;
        try {
            questionsReader = new BufferedReader(assets);
            if (questionsReader != null) {
                String line = questionsReader.readLine();
                while ((line = questionsReader.readLine()) != null) {
                    String[] split = line.split("#");
                    quiz.setQuiz(split[0], Integer.parseInt(split[1]), split[2], Integer.parseInt(split[3]), split[4], Integer.parseInt(split[5]), split[6], Integer.parseInt(split[7]), split[8]);
                }
            } else {
                System.err.println("Error: BufferReader failed to read file in assets folder");
            }
            questionsReader.close();
        } catch (IOException e) {
            System.err.println("Error: Failed to read line during execution");
        }
    }

    /**reads the results the results and returns a string of the results*/
    private String readResults(File f) {
        String fileResult = new String();
        if (f.exists()) {
            BufferedReader resultsReader = null;
            try {
                resultsReader = new BufferedReader(new FileReader(f));
                String line;
                while ((line = resultsReader.readLine()) != null) {
                    fileResult += line;
                }
                resultsReader.close();
            } catch (IOException e) {
                System.err.println("Error: FileUtility - Reading from existing results.txt file");
            }
        } else { return ""; }
        return fileResult;
    }

    /**writes new results into the results file*/
    public void saveResults(File f, String section, int totalScore) {
        // Reads previous records in the file //
        String fileResult = readResults(f);
        BufferedWriter bw = null;
        try {
            bw = new BufferedWriter(new FileWriter(f));
            if (bw != null) {
                bw.write(String.format("%s%s%s%d%s", fileResult, section, "@", totalScore, "#"));
            } else { System.err.println("Error: File Utility - result.txt was null and not found"); }
            bw.flush();
            bw.close();
        } catch (IOException e) {
            System.err.println("Error: File Utility - Could not write to file");
        }
    }

    /**sets results into the results class*/
    public void setResults(File f, Results r) {
        String results = readResults(f);
        String[] split = results.split("#");
        for (String i: split) {
            if (i.split("@")[0].equals("leadership")) { r.setLeadership(Integer.valueOf(i.split("@")[1]));}
            if (i.split("@")[0].equals("confidence")) { r.setConfidence(Integer.valueOf(i.split("@")[1]));}
            if (i.split("@")[0].equals("integrity")) { r.setIntegrity(Integer.valueOf(i.split("@")[1]));}
            if (i.split("@")[0].equals("extra")) { r.setExtra(Integer.valueOf(i.split("@")[1]));}
        }
    }
}