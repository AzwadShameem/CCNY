package Assignment_2;
import java.sql.*;
import java.util.Properties;

interface SQLFamilyRelations {
    static Connection getConnection(String username, String password) {
        Properties connectionProperties = new Properties();
        connectionProperties.put("user", username);
        connectionProperties.put("password", password);
        Connection connection = null;
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/Family-Relations", connectionProperties);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return connection;
    }

    static ResultSet getChildren(Connection connection, Persons spouse1, Persons spouse2) throws SQLException {
        String sqlStatement = String.format("SELECT * FROM Persons WHERE Id IN (SELECT pid FROM Family WHERE fid = %s AND mid = %s OR " + "fid = %s " +
                "AND mid = %s)", spouse1.getId(), spouse2.getId(), spouse2.getId(), spouse1.getId());
        return getResultSet(connection, sqlStatement);
    }

    static ResultSet getChildren(Connection connection, Persons parent) throws SQLException {
        String sqlStatement = String.format("SELECT * FROM Persons WHERE id IN (SELECT pid FROM FAMILY WHERE fid = %s  OR mid = %s);", parent.getId(), parent.getId());
        return getResultSet(connection, sqlStatement);
    }

    static ResultSet getGrandparents(Connection connection, Persons person) {
        int id = person.getId();
        String stringID = String.format("%d", id);
        String sqlStatement = String.format("SELECT Id AS 'Given Person',\n" +
                "    (SELECT Id FROM Persons WHERE Id IN\n" +
                "        (SELECT fId FROM Family F2 WHERE F2.pId IN\n" +
                "            (SELECT fId FROM Family F1 WHERE F1.pId = " + stringID +"))) AS 'Paternal Grandfather',\n" +
                "    (SELECT Id FROM Persons WHERE Id IN\n" +
                "        (SELECT mId FROM Family F2 WHERE F2.pId IN\n" +
                "            (SELECT fId FROM Family F1 WHERE F1.pId = " + stringID + "))) AS 'Paternal Grandmother',\n" +
                "    (SELECT Id FROM Persons WHERE Id IN\n" +
                "        (SELECT fId FROM Family F2 WHERE F2.pId IN\n" +
                "            (SELECT mId FROM Family F1 WHERE F1.pId = " + stringID + "))) AS 'Maternal Grandfather',\n" +
                "    (SELECT Id FROM Persons WHERE Id IN\n" +
                "        (SELECT mId FROM Family F2 WHERE F2.pId IN\n" +
                "            (SELECT mId FROM Family F1 WHERE F1.pId = " + stringID + "))) AS 'Maternal Grandmother'\n" +
                "From Persons WHERE Id = " + stringID + ";");
        return getResultSet(connection, sqlStatement);
    }

    static ResultSet getNephews(Connection connection, Persons person) {
        int id = person.getId();
        String sqlStatement = "WITH V AS (SELECT A.pId FROM (SELECT * FROM FAMILY F1 WHERE F1.pid <> " + id + ") A, " +
                "(SELECT F2.fid, F2.mid FROM FAMILY F2 WHERE F2.pid = " + id + ") B WHERE A.fid = B.fid OR A.mid = B.mid) " +
                "SELECT * FROM PERSONS WHERE Sex = 'M' AND Id IN (SELECT F.pid FROM FAMILY F WHERE F.fid IN (SELECT pid FROM V) OR F.mid IN (SELECT pid FROM V))";
        return getResultSet(connection, sqlStatement);
    }

    static ResultSet getBrotherInLaw(Connection connection, Persons person) throws SQLException {
        String sqlStatement = "SELECT bid FROM BROTHERINLAW WHERE pid = " + person.getId();
        return getResultSet(connection, sqlStatement);
    }

    static ResultSet getResultSet(Connection connection, String sqlStatement) {
        ResultSet resultSet = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(sqlStatement);
            resultSet = preparedStatement.executeQuery();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            e.printStackTrace();
        }
        return resultSet;
    }

    static void main(String[] args)  {
        // Establish Connection
        Connection connection = getConnection("root", "root");
        // Testing Person Class
        Persons me = new Persons(connection, 1);
        // Testing Person's getXAttributes
        System.out.println("Name: " + me.getName() + " ID: " + String.format("%d", me.getId()) + " gender: " + me.getGender());
        // Testing Person's toString()
        System.out.println(me.toString());
        // Testing setRecord and getRecord
        Persons test = new Persons();
        int personID = 999;
        test.setRecord(connection, personID, "added person", "M");
        test = test.getRecord(connection, personID);
        System.out.println(test.toString());
        System.out.println("\n--------------------------------------------------------------------------------------------------\n");
        // Testing Child
        Persons father = new Persons(connection, 10), mother = new Persons(connection, 11);
        Child child = new Child(connection, father, mother);
        child.print();
        // Testing Child with only one parent
        System.out.println();
        Persons aunt = new Persons(connection, 13);
        Child child1 = new Child(connection, aunt);
        child1.print();
        System.out.println("\n--------------------------------------------------------------------------------------------------\n");
        // Testing Nephew
        Nephew nephew = new Nephew(connection, father);
        nephew.print();
        Persons uncle = new Persons(connection, 12);
        Nephew nephew1 = new Nephew(connection, uncle);
        nephew1.print();
        System.out.println("\n--------------------------------------------------------------------------------------------------\n");
        // Testing Brotherinlaw
        BrotherInLaw brotherInLaw = new BrotherInLaw(connection, father);
        brotherInLaw.print();
        Persons aunt2 = new Persons(connection, 15);
        BrotherInLaw brotherInLaw1 = new BrotherInLaw(connection, aunt2);
        brotherInLaw1.print();
        System.out.println("\n--------------------------------------------------------------------------------------------------\n");
        // Testing GrandParents
        Grandparent grandparent = new Grandparent(connection, me);
        grandparent.print();
        Persons cousin1 = new Persons(connection, 4);
        Grandparent grandparent1 = new Grandparent(connection, cousin1);
        grandparent1.print();
    }
}