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
                public class Children {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement insertChildren = null;
                    ResultSet resultSet = null;

                    public Children() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            insertChildren = connection.prepareStatement(
                                    "INSERT INTO leaders (name, lastName, degree) VALUES (?, ?, ?)");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setChildren(String name, String lastName, String degree) {

                        int result = 0;

                        try {
                            insertChildren.setString(1, name);
                            insertChildren.setString(2, lastName);
                            insertChildren.setString(3, degree);
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

                if (request.getParameter("submit") != null) {

                    String name = new String();
                    String lastName = new String();
                    String degree = new String();

                    if (request.getParameter("name") != null) {
                        name = request.getParameter("name");
                    }

                    if (request.getParameter("lastName") != null) {
                        lastName = request.getParameter("lastName");
                    }

                    if (request.getParameter("degree") != null) {
                        degree = request.getParameter("degree");
                    }

                    Children children = new Children();
                    result = children.setChildren(name, lastName, degree);

                }
            %>

            <form name="myForm" action="insertLeaderData.jsp" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Imie </td>
                            <td><input type="text" name="name" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Nazwisko </td>
                            <td><input type="text" name="lastName" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Stopien </td>
                            <td><select name="degree">
                                    <option>Inzynier</option>
                                    <option>Magister</option>
                                    <option>Doktor</option>
                                    <option>Profesor</option>
                                </select></td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" name="hidden" value="<%= result%>" />

                <input type="submit" value="Potwierdź" name="submit" />
                <input type="reset" value="Resetuj" name="reset" />
            </form>

            <script language="JavaScript">
                <!--
                function displayResults()
                {
                    if (document.myForm.hidden.value == 1) {
                        alert("Dane zostaly wprowadzone");
                    }
                }
                //-->
            </script>
        </div>
    </body>
</html>
