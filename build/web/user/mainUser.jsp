<%-- 
    Document   : mainUser
    Created on : 2021-03-06, 16:05:52
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bg_gradient.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
    </head>
    <body>

        <div id="mydiv">

            <%!
                public class MainUser {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement selectChildren = null;
                    ResultSet resultSet;

                    public MainUser() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectChildren = connection.prepareStatement(
                                    "SELECT * FROM visited WHERE email = ?");
                        } catch (SQLException e) {
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

                }
            %>

            <%= session.getAttribute("Email").toString()%>

            <%
                String email = session.getAttribute("Email").toString();
                MainUser mainUser = new MainUser();
                ResultSet rs = mainUser.checkHalls(email);
            %>

            <h1>Witaj na dniach otwartych w naszej szkole!</h1>
            <table class="myTable">
                <tbody>
                    <tr>
                        <td>
                            <form action="lectures.jsp">
                                <input type="submit" value="Pokaż wykłady" />
                            </form>
                        </td>
                        <td>
                            <form action="visitedHalls.jsp">
                                <input type="submit" value="Odwiedzone sale" />
                            </form>
                        </td>
                        <% while (rs.next()) {
                                if (rs.getInt("h100") == 1 & rs.getInt("h101") == 1 & rs.getInt("h102") == 1 & rs.getInt("h200") == 1 & rs.getInt("h201") == 1 & rs.getInt("h202") == 1 & rs.getInt("h300") == 1) {
                        %>
                        <td>
                            <form action="postQuestionnaire.jsp">
                                <input type="submit" value="Ankieta końcowa" />
                            </form>
                        </td>
                        <% }
                            } %>
                    </tr>
                </tbody>
            </table>

            <center> <form action="../login/logout.jsp" method="POST">
                    <table class="myTable">
                        <tbody>
                            <tr>
                                <td>
                                    <input type="submit" value="Wyloguj się">
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </form> </center>

        </div>
    </body>
</html>
