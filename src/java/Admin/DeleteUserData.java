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
public class DeleteUserData {

    Connection connection = null;
    PreparedStatement selectLectures = null;
    PreparedStatement deleteLecture = null;
    ResultSet resultSet = null;

    public DeleteUserData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectLectures = connection.prepareStatement("SELECT ID, email, password, school, city, profile, type, verified FROM users");

            deleteLecture = connection.prepareStatement("DELETE FROM users WHERE ID = ?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getUsers() {
        try {
            resultSet = selectLectures.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    public int deleteUser(Integer id) {
        int result = 0;

        try {
            deleteLecture.setInt(1, id);
            result = deleteLecture.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }
}
