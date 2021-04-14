<%-- 
    Document   : insertChildrenData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="../css/bg_gradient.css" />
    </head>

    <body onload="displayResults()">
        <div id="mydiv">
            <%!
                public class Children {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement insertChildren = null;
                    ResultSet resultSet = null;

                    public Children() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            insertChildren = connection.prepareStatement(
                                    "UPDATE users SET verified=1 WHERE email=?");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setChildren(String email) {

                        int result = 0;

                        try {
                            insertChildren.setString(1, email);
                            result = insertChildren.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }
                }
            %>
            <%
                int result = 0;

                HttpSession ses = request.getSession();
                String email = ses.getAttribute("Email").toString();

                Children children = new Children();
                result = children.setChildren(email);
            %>

            <% if (result == 1) {%>
            <h1>Konto <% out.println(email); %> zostało potwierdzone.</h1>
            <p>Możesz już <a href="../index.jsp">się zalogować.</a></p>
            <% }%>

        </div>
    </body>
</html>
