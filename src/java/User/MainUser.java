/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package User;
import Connection.MySQLConnUtils;
import java.sql.*;

/**
 *
 * @author Pawel
 */
public class MainUser {

    private Connection connection = null;
    private PreparedStatement selectChildren = null;
    private PreparedStatement selectQuestionnaire = null;
    private ResultSet resultSet;

    public MainUser() {

        try {

            connection = MySQLConnUtils.getMySQLConnection();
            
            selectChildren = connection.prepareStatement(
                    "SELECT * FROM visited WHERE email = ?");
            selectQuestionnaire = connection.prepareStatement(
                    "SELECT user_id FROM questionnaire WHERE email = ?");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
    }

    public ResultSet checkHalls(String email) {

        try {
            selectChildren.setString(1, email);
            resultSet = selectChildren.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return resultSet;
    }
    
    public ResultSet checkQuestionnaire(String email) {
        
        try {
            selectQuestionnaire.setString(1, email);
            resultSet = selectQuestionnaire.executeQuery();
        } catch(SQLException e) {
            e.printStackTrace();
        }
        
        return resultSet;
    }

}
