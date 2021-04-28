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

public class ResignLecture {

    Connection connection = null;
    PreparedStatement dropLecture = null;
    PreparedStatement findUser = null;
    PreparedStatement checkUser = null;

    public ResignLecture() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            dropLecture = connection.prepareStatement(
                    "DELETE FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
            findUser = connection.prepareStatement(
                    "SELECT ID FROM users WHERE email = ?");
            checkUser = connection.prepareStatement(
                    "SELECT user_id, lecture_id, mail FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int dropLecture(int user_id, int lecture_id, String mail) {

        int result = 0;

        try {
            dropLecture.setInt(1, user_id);
            dropLecture.setInt(2, lecture_id);
            dropLecture.setString(3, mail);

            result = dropLecture.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public ResultSet getUserID(String mail) {
        ResultSet resultSet = null;

        try {
            findUser.setString(1, mail);
            resultSet = findUser.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return resultSet;

    }

    public ResultSet checkUser(int user_id, int lecture_id, String mail) {
        ResultSet resultSet = null;

        try {
            checkUser.setInt(1, user_id);
            checkUser.setInt(2, lecture_id);
            checkUser.setString(3, mail);
            resultSet = checkUser.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }
}
