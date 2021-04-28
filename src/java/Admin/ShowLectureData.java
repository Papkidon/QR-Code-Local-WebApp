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

public class ShowLectureData {

    Connection connection = null;
    PreparedStatement selectLectures = null;
    ResultSet resultSet = null;

    public ShowLectureData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            selectLectures = connection.prepareStatement(
                    "SELECT id, leader_id, topic, date, t_start, t_stop, hall FROM lectures");
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
}
