package Assignment_2;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Child extends Persons {
    private final String type = "Child";
    private Persons father = null, mother = null;
    private List<Persons> children = new ArrayList<>();

    public Child() {}

    // If only one parent is given
    public Child(Connection connection, Persons person) {
        if (person.getGender().equals("M")) { this.father = person; } else if (person.getGender().equals("F")) { this.mother = person; }
        try {
            ResultSet results = SQLFamilyRelations.getChildren(connection, person);
            while (results.next()) {
                children.add(new Persons(results.getInt("id"), type, results.getString("Name"), results.getString("Sex")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    // If both parents are given
    public Child(Connection connection, Persons father, Persons mother) {
        this.father = father;
        this.mother = mother;

        try {
            ResultSet results = SQLFamilyRelations.getChildren(connection, father, mother);
            while (results.next()) {
                children.add(new Persons(results.getInt("id"), type, results.getString("Name"), results.getString("Sex")));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public List<Persons> getChildren() { return this.children; }
    @Override
    public String toString() {
        String output;
        if (mother == null) {
            output = String.format("The Children of %s:\n",this.father.getName());
        } else if (father == null) {
            output = String.format("The Children of %s:\n",this.mother.getName());
        } else {
            output = String.format("The Children of %s and %s:\n", this.father.getName(), this.mother.getName());
        }
        for (Persons P : getChildren())
            output += P.toString() + "\n";
        return output;
    }

    public void print() { System.out.println(this.toString()); }
}