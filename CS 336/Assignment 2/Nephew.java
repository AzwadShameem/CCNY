package Assignment_2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Nephew extends Child {
    private final String type = "Nephew";
    private Persons person;
    private List<Persons> nephews = new ArrayList<>();

    public Nephew(Connection connection, Persons person) {
        this.person = person;
        try {
            ResultSet results = SQLFamilyRelations.getNephews(connection, person);
            while (results.next()) {
                nephews.add(new Persons(results.getInt("id"), type, results.getString("Name"), results.getString("Sex")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Persons> getNephews() { return this.nephews; }

    @Override
    public String toString() {
        String output = String.format("The Nephews of %s:\n", this.person.getName());
        for (Persons P : getNephews())
            output += P.toString() + "\n";
        return output;
    }

    public void print() { System.out.println(this.toString()); }
}