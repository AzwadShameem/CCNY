package Assignment_2;

import java.sql.*;

public class Persons implements SQLFamilyRelations {
    private int id;
    private String type;
    private String name;
    private String gender;

    public Persons() {}

    public Persons(int id, String type, String name, String gender) {
        this.id = id;
        this.type = type;
        this.name = name;
        this.gender = gender;
    }

    public Persons(Connection connection, int id) {
        ResultSet personData;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PERSONS WHERE Id = " + id);
            personData = statement.executeQuery();
            personData.next();
            this.id = id;
            this.name = personData.getString("Name");
            this.gender = personData.getString("SEX");
        } catch(SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public Persons(Connection connection, String name) {
        ResultSet personData;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM PERSONS WHERE Name = " + name);
            personData = statement.executeQuery();
            personData.next();
            this.id = personData.getInt("id");
            this.name = personData.getString("Name");
            this.gender = personData.getString("SEX");
        } catch(SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }

    public int getId() { return this.id; }
    public String getName() { return this.name; }
    public String getGender() { return this.gender; }
    public String getType() { return this.type; }

    @Override
    public String toString() { return "Name: " + getName() + " id: " + String.format("%d", getId()) + " Sex: " + getGender(); }

    public Persons getRecord(Connection connection, int id) { return new Persons(connection, id); }

    public Persons getRecord(Connection connection, String name) { return new Persons(connection, name); }

    public void setRecord(Connection connection, int id, String name, String gender) {
        String query = String.format("INSERT INTO PERSONS VALUES (%d, '%s', '%s');", id, name, gender);
        try {
            Statement statement = connection.createStatement();
            statement.execute(query);
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
    }
}