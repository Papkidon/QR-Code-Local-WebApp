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

public class InsertLectureData {

    Connection connection = null;
    PreparedStatement insertLecture = null;
    ResultSet resultSet = null;

    public InsertLectureData() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertLecture = connection.prepareStatement(
                    "INSERT INTO lectures (leader_id, topic, date, t_start, t_stop, hall) VALUES (?, ?, ?, ?, ?, ?)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setLecture(int leaderId, String topic, Timestamp date, String t_start, String t_stop, int hall) {

        int result = 0;

        try {
            insertLecture.setInt(1, leaderId);
            insertLecture.setString(2, topic);
            insertLecture.setTimestamp(3, date);
            insertLecture.setString(4, t_start);
            insertLecture.setString(5, t_stop);
            insertLecture.setInt(6, hall);
            result = insertLecture.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
