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

    <body>
        <div id="mydiv">

            <%!
                public class SetVisited {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement setHall = null;
                    PreparedStatement checkHall = null;
                    String h_id = new String();
                    ResultSet rs;

                    public SetVisited() {

                        try {

                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        } catch (SQLException e) {
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
            %>
            <%
                int result = 0;

                String val = request.getParameter("val");
                String h_id = val.substring(0, 4);
                String email = val.substring(val.lastIndexOf(" ") + 1);

                SetVisited visit = new SetVisited();
                ResultSet rs1 = visit.checkVisited(h_id, email);

                if (!rs1.next()) {

                    result = visit.setVisited(h_id, email);

                    if (result == 1) {
                        out.println("Sala " + h_id.substring(1, 4) + " dla emailu " + email + " zaznaczona jako odwiedzona.");
                    } else {
                        out.println("Nie udało się oznaczyć sali " + h_id + " jako odwiedzonej.");
                    }
                } else {
                    out.println("Sala " + h_id.substring(1, 4) + " jest juz zaznaczona jako odwiedzona.");
                }

            %>

        </div>
    </body>
</html>
