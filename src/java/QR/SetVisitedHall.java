/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package QR;

import java.sql.*;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */

public class SetVisitedHall {

    Connection connection = null;
    PreparedStatement setHall = null;
    PreparedStatement checkHall = null;
    String h_id = new String();
    ResultSet rs;

    public SetVisitedHall() {

        try {

            connection = MySQLConnUtils.getMySQLConnection();

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setVisited(String hall, String email) {

        int result = 0;

        if (hall.equals("h100")) {
            h_id = "h100";
        } else if (hall.equals("h101")) {
            h_id = "h101";
        } else if (hall.equals("h102")) {
            h_id = "h102";
        } else if (hall.equals("h200")) {
            h_id = "h200";
        } else if (hall.equals("h201")) {
            h_id = "h201";
        } else if (hall.equals("h202")) {
            h_id = "h202";
        } else if (hall.equals("h300")) {
            h_id = "h300";
        } else {
            h_id = "Bad";
        }

        try {
            setHall = connection.prepareStatement(
                    "UPDATE visited SET " + h_id + " = 1 WHERE email = ?");
            setHall.setString(1, email);
            result = setHall.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

    public ResultSet checkVisited(String hall, String email) {

        if (hall.equals("h100")) {
            h_id = "h100";
        } else if (hall.equals("h101")) {
            h_id = "h101";
        } else if (hall.equals("h102")) {
            h_id = "h102";
        } else if (hall.equals("h200")) {
            h_id = "h200";
        } else if (hall.equals("h201")) {
            h_id = "h201";
        } else if (hall.equals("h202")) {
            h_id = "h202";
        } else if (hall.equals("h300")) {
            h_id = "h300";
        } else {
            h_id = "Bad";
        }

        try {
            checkHall = connection.prepareStatement(
                    "SELECT * FROM visited WHERE " + h_id + " = 1 AND email = ?");

            checkHall.setString(1, email);
            rs = checkHall.executeQuery();

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }
}
