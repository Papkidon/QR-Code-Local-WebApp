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

public class RegisterLecture {

    Connection connection = null;
    PreparedStatement insertLecture = null;
    PreparedStatement findUser = null;
    PreparedStatement checkUser = null;

    public RegisterLecture() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertLecture = connection.prepareStatement(
                    "INSERT INTO signed (user_id, lecture_id, mail) VALUES (?, ?, ?)");
            findUser = connection.prepareStatement(
                    "SELECT ID FROM users WHERE email = ?");
            checkUser = connection.prepareStatement(
                    "SELECT user_id, lecture_id, mail FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setLecture(int user_id, int lecture_id, String mail) {

        int result = 0;

        try {
            insertLecture.setInt(1, user_id);
            insertLecture.setInt(2, lecture_id);
            insertLecture.setString(3, mail);

            result = insertLecture.executeUpdate();
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
