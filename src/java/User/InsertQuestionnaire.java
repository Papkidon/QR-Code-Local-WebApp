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

public class InsertQuestionnaire {

    Connection connection = null;
    PreparedStatement insertQuestionnaire = null;

    public InsertQuestionnaire() {

        try {
            connection = MySQLConnUtils.getMySQLConnection();

            insertQuestionnaire = connection.prepareStatement(
                    "INSERT INTO questionnaire (user_id, email, best_lectures, intention, specialty) VALUES (?, ?, ?, ?, ?)");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public int setQuestionnaire(int user_id, String mail, String best_lectures, int intention, String specialty) {

        int result = 0;

        try {
            insertQuestionnaire.setInt(1, user_id);
            insertQuestionnaire.setString(2, mail);
            insertQuestionnaire.setString(3, best_lectures);
            insertQuestionnaire.setInt(4, intention);
            insertQuestionnaire.setString(5, specialty);

            result = insertQuestionnaire.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return result;
    }

}
