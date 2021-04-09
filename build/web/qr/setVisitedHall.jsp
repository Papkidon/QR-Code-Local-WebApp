<%-- 
    Document   : insertLeaderData
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

            <h1>Wprowadź wykładowcę</h1>
            <%!
                public class SetVisited {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement setHall = null;
                    ResultSet resultSet = null;

                    public SetVisited() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            setHall = connection.prepareStatement(
                                    "INSERT INTO visited (?) VALUES (1) WHERE email = '?'");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setVisited(int hall, String email) {

                        int result = 0;

                        try {
                            setHall.setInt(1, hall);
                            setHall.setString(2, email);
                            result = setHall.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }
                }
            %>
            <%
                int result = 0;

                    int h_id = 0;
                    String email = new String();

                    if (request.getParameter("h_id") != null) {
                        h_id = Integer.parseInt(request.getParameter("h_id"));
                    }

                    if (request.getParameter("email") != null) {
                        email = request.getParameter("email");
                    }

                    SetVisited children = new SetVisited();
                    result = children.setVisited(h_id, email);
                    
                    if(result == 1){
                        out.println("Sala zaznaczona jako odwiedzona.");
                    } else {
                        out.println("Nie udało się oznaczyć sali jako odwiedzonej.");
                    }

            %>
            
        </div>
    </body>
</html>
