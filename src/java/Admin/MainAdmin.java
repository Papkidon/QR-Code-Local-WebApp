/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Admin;

import java.sql.*;

/**
 *
 * @author Pawel
 */
public class MainAdmin {

    public static ResultSet checkAdmin(Connection con, String email) {
        PreparedStatement st = null;
        ResultSet rs = null;

        try {
            st = con.prepareStatement("SELECT type FROM users WHERE email = ?");
            st.setString(1, email);
            rs = st.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        } 
        
        return rs;
    }

}
