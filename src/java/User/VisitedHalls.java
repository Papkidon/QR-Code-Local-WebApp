/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;

import java.sql.*;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */

public class VisitedHalls {

    Connection connection = null;
    PreparedStatement findHalls = null;
    ResultSet rs;

    public VisitedHalls() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            findHalls = connection.prepareStatement(
                    "SELECT * FROM visited WHERE email = ?");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet findVisited(String email) {

        try {
            findHalls.setString(1, email);
            rs = findHalls.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }
}
