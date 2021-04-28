/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package UserVerify;

import java.sql.*;
import Connection.MySQLConnUtils;

/**
 *
 * @author Pawel
 */

public class VerificationSuccessfull {

    Connection connection = null;
    PreparedStatement insertVerification = null;
    ResultSet resultSet = null;

    public VerificationSuccessfull() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertVerification = connection.prepareStatement(
                    "UPDATE users SET verified=1 WHERE email=?");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setVerification(String email) {

        int result = 0;

        try {
            insertVerification.setString(1, email);
            result = insertVerification.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }
}
