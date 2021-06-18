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
public class InsertLeaderData {

    Connection connection = null;
    PreparedStatement insertLeader = null;
    ResultSet resultSet = null;

    public InsertLeaderData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertLeader = connection.prepareStatement(
                    "INSERT INTO leaders (name, lastName, degree) VALUES (?, ?, ?)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setLeader(String name, String lastName, String degree) {

        int result = 0;

        try {
            insertLeader.setString(1, name);
            insertLeader.setString(2, lastName);
            insertLeader.setString(3, degree);
            result = insertLeader.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
