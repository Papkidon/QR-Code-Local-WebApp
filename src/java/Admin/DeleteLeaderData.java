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
public class DeleteLeaderData {

    Connection connection = null;
    PreparedStatement selectChildren = null;
    PreparedStatement deleteChildren = null;
    ResultSet resultSet = null;

    public DeleteLeaderData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectChildren = connection.prepareStatement("SELECT id, name, lastName, degree FROM leaders");

            deleteChildren = connection.prepareStatement("DELETE FROM leaders WHERE id = ?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getLeader() {
        try {
            resultSet = selectChildren.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public int deleteLeader(Integer id) {
        int result = 0;

        try {
            deleteChildren.setInt(1, id);
            result = deleteChildren.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
