<%-- 
    Document   : insertUserData
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

            <h1>Dodaj użytkownika</h1>
            <%!
                public class Children {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement insertChildren = null;
                    PreparedStatement insertVisited = null;
                    ResultSet resultSet = null;

                    public Children() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            insertChildren = connection.prepareStatement(
                                    "INSERT INTO users (email, password, school, city, profile, type, verified) VALUES (?, ?, ?, ?, ?, ?, ?)");
                            insertVisited = connection.prepareStatement(
                                    "INSERT INTO visited (id) values (default)");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setChildren(String email, String password, String school, String city, String profile, String type, int verified) {

                        int result = 0;

                        try {
                            insertChildren.setString(1, email);
                            insertChildren.setString(2, password);
                            insertChildren.setString(3, school);
                            insertChildren.setString(4, city);
                            insertChildren.setString(5, profile);
                            insertChildren.setString(6, type);
                            insertChildren.setInt(7, verified);

                            result = insertChildren.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }

                    public int setVisited() {
                        int result = 0;

                        try {
                            result = insertVisited.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }
                }
            %>
            <%
                int result1 = 0;
                int result2 = 0;

                if (request.getParameter("submit") != null) {

                    String email = new String();
                    String password = new String();
                    String school = new String();
                    String city = new String();
                    String profile = new String();
                    String type = new String();
                    int verified = 0;

                    if (request.getParameter("email") != null) {
                        email = request.getParameter("email");
                    }

                    if (request.getParameter("password") != null) {
                        password = request.getParameter("password");
                    }

                    if (request.getParameter("school") != null) {
                        school = request.getParameter("school");
                    }

                    if (request.getParameter("city") != null) {
                        city = request.getParameter("city");
                    }

                    if (request.getParameter("profile") != null) {
                        profile = request.getParameter("profile");
                    }

                    if (request.getParameter("type") != null) {
                        type = request.getParameter("type");
                    }

                    if (request.getParameter("verified") != null) {
                        verified = Integer.parseInt(request.getParameter("verified"));
                    }
                    Children children = new Children();
                    result1 = children.setChildren(email, password, school, city, profile, type, verified);
                    result2 = children.setVisited();

                }
            %>

            <form name="myForm" action="insertUserData.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>E-Mail </td>
                            <td><input type="email" name="email" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Hasło </td>
                            <td><input type="password" name="password" value="" size="50" /></td>
                        </tr>

                        <tr>
                            <td>Szkoła </td>
                            <td><input type="text" name="school" value="" size="50" /></td>
                        </tr>

                        <tr>
                            <td>Miejscowość </td>
                            <td><input type="text" name="city" value="" size="50" /></td>
                        </tr>

                        <tr>
                            <td>Profil </td>
                            <td><input type="password" name="profile" value="" size="50" /></td>
                        </tr>

                        <tr>
                            <td>Typ </td>
                            <td><select name="type">
                                    <option>user</option>
                                    <option>admin</option>
                                </select></td>
                        </tr>

                        <tr>
                            <td>Weryfikacja</td>
                            <td><input type="checkbox" name="verified" value="1"/> </td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" name="hidden" value="<%= result1%>" />
                <input type="hidden" name="hidden2" value="<%= result2%>" />

                <input type="submit" value="Potwierdź" name="submit" />
                <input type="reset" value="Resetuj" name="reset" />
            </form>

            <script language="JavaScript">
                <!--
                function displayResults()
                {
                    if (document.myForm.hidden.value == 1 && document.myForm.hidden2.value == 1) {
                        alert("Dane zostaly wprowadzone");
                    }
                }
                //-->
            </script>
        </div>
    </body>
</html>
