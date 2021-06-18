/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

/**
 *
 * @author Pawel
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.servlet.http.*;

public class MySQLConnUtils {

    public static Connection getMySQLConnection()
            throws ClassNotFoundException, SQLException {
        // Note: Change the connection parameters accordingly.
        String hostName = "localhost";
        String dbName = "childreg";
        String userName = "root";
        String password = "usbw";

        Class.forName("com.mysql.jdbc.Driver");

        // URL Connection for MySQL:
        // Example: 
        // jdbc:mysql://localhost:3306/simplehr
        String connectionURL = "jdbc:mysql://" + hostName + ":3307/" + dbName;

        Connection conn = DriverManager.getConnection(connectionURL, userName,
                password);

        return conn;
    }

    public static int checkEmailNotNull(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

        if (session.getAttribute("Email") == null) {
            response.sendRedirect(request.getContextPath() + "/index");
            return 0;
        } else {
            return 1;
        }
    }

    public static int checkEmailIfAdmin(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {

        if (session.getAttribute("AdminEmail") == null) {
            response.sendRedirect(request.getContextPath() + "/index");
            return 0;
        } else {
            return 1;
        }
    }
}
