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

public class Lectures {

    Connection connection = null;
    PreparedStatement selectLectures = null;
    PreparedStatement checkUser = null;
    PreparedStatement findUser = null;
    PreparedStatement findLeader = null;
    ResultSet resultSet = null;
    ResultSet resultSet2 = null;

    public Lectures() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectLectures = connection.prepareStatement(
                    "SELECT id, leader_id, topic, date, t_start, t_stop, hall FROM lectures");
            checkUser = connection.prepareStatement(
                    "SELECT user_id, lecture_id, mail FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
            findUser = connection.prepareStatement(
                    "SELECT ID FROM users WHERE email = ?");
            findLeader = connection.prepareStatement(
                    "SELECT name, lastName, degree FROM leaders WHERE id = ?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ResultSet getLectures() {

        try {
            resultSet = selectLectures.executeQuery();
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

    public ResultSet getLeader(int id) {
        ResultSet rs = null;

        return rs;
    }
}
