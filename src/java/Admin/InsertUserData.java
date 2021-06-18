/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */
public class InsertUserData {

    Connection connection = null;
    PreparedStatement insertUser = null;
    PreparedStatement insertVisited = null;
    ResultSet resultSet = null;

    public InsertUserData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertUser = connection.prepareStatement(
                    "INSERT INTO users (email, password, school, city, profile, type, verified) VALUES (?, ?, ?, ?, ?, ?, ?)");
            insertVisited = connection.prepareStatement(
                    "INSERT INTO visited (email) values (default)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setUser(String email, String password, String school, String city, String profile, String type, int verified) {

        int result = 0;

        try {
            insertUser.setString(1, email);
            insertUser.setString(2, password);
            insertUser.setString(3, school);
            insertUser.setString(4, city);
            insertUser.setString(5, profile);
            insertUser.setString(6, type);
            insertUser.setInt(7, verified);

            result = insertUser.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public int setVisited() {
        int result = 0;

        try {
            result = insertVisited.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
