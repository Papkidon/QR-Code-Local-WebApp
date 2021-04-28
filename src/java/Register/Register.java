/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Register;

import Connection.MySQLConnUtils;
import java.sql.*;

/**
 *
 * @author Pawel
 */
public class Register {
    
            Connection connection = null;
            PreparedStatement checkReg = null;
            ResultSet resultSet = null;

            public Register() {

                try {
                    connection = MySQLConnUtils.getMySQLConnection();

                    checkReg = connection.prepareStatement("SELECT * FROM users WHERE email = ?");
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                }
            }

            public ResultSet checkRegister(String mail) {
                try {
                    checkReg.setString(1, mail);
                    resultSet = checkReg.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                return resultSet;
            }

        }