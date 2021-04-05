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
                public class LectureDrop {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement dropLecture = null;
                    PreparedStatement findUser = null;
                    PreparedStatement checkUser = null;

                    public LectureDrop() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            dropLecture = connection.prepareStatement(
                                    "DELETE FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
                            findUser = connection.prepareStatement(
                                    "SELECT ID FROM users WHERE email = ?");
                            checkUser = connection.prepareStatement(
                                    "SELECT user_id, lecture_id, mail FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setLecture(int user_id, int lecture_id, String mail) {

                        int result = 0;

                        try {
                            dropLecture.setInt(1, user_id);
                            dropLecture.setInt(2, lecture_id);
                            dropLecture.setString(3, mail);

                            result = dropLecture.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }

                    public ResultSet getUserID(String mail) {
                        ResultSet resultSet = null;

                        try {
                            findUser.setString(1, mail);
                            resultSet = findUser.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return resultSet;

                    }

                    public ResultSet checkUser(int user_id, int lecture_id, String mail) {
                        ResultSet resultSet = null;

                        try {
                            checkUser.setInt(1, user_id);
                            checkUser.setInt(2, lecture_id);
                            checkUser.setString(3, mail);
                            resultSet = checkUser.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return resultSet;
                    }
                }
            %>
            <%

                int result = 0;

                // Declare and define user_id, lecture_id, email
                int user_id = 0;
                String email = session.getAttribute("Email").toString();
                int lecture_id = Integer.parseInt(request.getParameter("id"));
                Lecture lecture = new Lecture();
                ResultSet rs = lecture.getUserID(email);

                while (rs.next()) {
                    user_id = rs.getInt("ID");
                }

                // Check if user is already signed to selected lecture
                ResultSet rsc = lecture.checkUser(user_id, lecture_id, email);

                // If is not signed, then assign this person to selected lecture
                if (!rsc.next()) {

                    result = lecture.setLecture(user_id, lecture_id, email);

                    if (result == 1) {
                        out.println("Zarejestrowales sie na wykład \"" +  "");
                    }
                } else {
                    out.println("Jestes juz zarejestrowany na ten wykład");
                }
            %>

        </div>
            
            <%= email %>
    </body>
</html>