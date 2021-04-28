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

public class ShowLeaderData {

    Connection connection = null;
    PreparedStatement selectLeaders = null;
    ResultSet resultSet = null;

    public ShowLeaderData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectLeaders = connection.prepareStatement(
                    "SELECT id, name, lastName, degree FROM leaders");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getLeaders() {

        try {
            resultSet = selectLeaders.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }
}
