/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBUtils;

import java.sql.*;
import java.util.*;
import Connection.*;

/**
 *
 * @author Pawel
 */
public class DBQuery {

    public static ResultSet loginQuery(Connection con, String email, String password) throws SQLException {
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
        return rs;
    }

    public static int registerQuery1(Connection con, String email, String password, String city, String school, String profile) throws SQLException {
        Statement st = con.createStatement();
        int i = st.executeUpdate("insert into users(email,password,city,school,profile,type,verified)values('" + email + "','" + password + "','" + city + "','" + school + "','" + profile + "', 'user', 1)");
        return i;
    }

    public static int registerQuery2(Connection con, String email) throws SQLException {
        Statement st = con.createStatement();
        int i = st.executeUpdate("insert into visited (email) values ('" + email + "')");
        return i;
    }

    public static int checkEmailQuery(Connection con, String email) throws SQLException {
        PreparedStatement st = null;
        ResultSet rs = null;
        st = con.prepareStatement("SELECT type FROM users WHERE email = ?");
        st.setString(1, email);
        rs = st.executeQuery();
        int i = -1;

        while (rs.next()) {
            if (rs.getString("type").equals("admin")) {
                i = 1;
            } else {
                i = 0;
            }
        }
        return i;
    }
}
