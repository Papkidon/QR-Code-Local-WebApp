<%-- 
    Document   : showLeaderData
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="../css/bg_gradient.css" />
    </head>
    <body>
        <div id="mydiv">
            <h1>Dane wykładowców</h1>
            <%!
                public class Children {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement selectChildren = null;
                    ResultSet resultSet = null;

                    public Children() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectChildren = connection.prepareStatement(
                                    "SELECT id, name, lastName, degree FROM leaders");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public ResultSet getChildren() {

                        try {
                            resultSet = selectChildren.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return resultSet;
                    }
                }
            %>
            <%
                Children children = new Children();
                ResultSet childrens = children.getChildren();
            %>
            <table border="1">
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td>Imie</td>
                        <td>Nazwisko</td>
                        <td>Stopien</td>
                    </tr>
                    <% while (childrens.next()) {%>
                    <tr>
                        <td><%= childrens.getInt("id")%></td>
                        <td><%= childrens.getString("name")%></td>
                        <td><%= childrens.getString("lastName")%></td>
                        <td><%= childrens.getString("degree")%></td>
                        <% }%>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
