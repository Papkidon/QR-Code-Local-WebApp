<%-- 
    Document   : registerLecture
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
        <title>Rejestracja</title>
        <link rel="stylesheet" href="../css/bg_gradient.css" />
    </head>

    <body onload="displayResults()">
        <div id="mydiv">

            <h1>Rejestracja</h1>
            <%!
                public class Lecture {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement insertLecture = null;
                    PreparedStatement findUser = null;
                    ResultSet resultSet = null;

                    public Lecture() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            insertLecture = connection.prepareStatement(
                                    "INSERT INTO signed (user_id, lecture_id, mail) VALUES (?, ?, ?)");
                            findUser = connection.prepareStatement(
                                    "SELECT ID FROM users WHERE email = '?'");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setLecture(int user_id, int lecture_id, String mail) {

                        int result = 0;

                        try {
                            insertLecture.setInt(1, user_id);
                            insertLecture.setInt(2, lecture_id);
                            insertLecture.setString(3, mail);

                            result = insertLecture.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }

                    public ResultSet getUserID(String mail) {
                        try {
                            findUser.setString(1, mail);
                            resultSet = findUser.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return resultSet;

                    }
                }
            %>
            <%
                int result = 0;

                int user_id = new Integer(0);
                String email = session.getAttribute("Email").toString();
                int lecture_id = Integer.parseInt(request.getParameter("L_ID"));
                Lecture lecture = new Lecture();
                ResultSet rs = lecture.getUserID(email);

                if (rs.next()) {
                    user_id = rs.getInt("ID");
                }

                if (!email.isEmpty()) {
                    result = lecture.setLecture(user_id, lecture_id, email);
                }
            %>

            <% if (result == 1) { %>
            Zarejestrowales sie na wyklad
            <% }%>

        </div>
    </body>
</html>
