/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import java.sql.*;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */

public class ShowUserData {

    Connection connection = null;
    PreparedStatement selectChildren = null;
    PreparedStatement selectVisited = null;
    ResultSet resultSet = null;
    ResultSet resultVisited = null;

    public ShowUserData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectChildren = connection.prepareStatement(
                    "SELECT ID, email, password, school, city, profile, type, verified FROM users");
            selectVisited = connection.prepareStatement(
                    "SELECT * FROM visited");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getUserData() {

        try {
            resultSet = selectChildren.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }

    public ResultSet getVisitedData() {
        try {
            resultVisited = selectVisited.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultVisited;
    }
}
