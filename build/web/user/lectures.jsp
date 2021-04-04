<%-- 
    Document   : lectures
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*, java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="../css/bg_gradient.css"/>
    </head>
    <body>
        <div id="mydiv">
            <h1>Wykłady</h1>
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
                                    "SELECT id, leader_id, topic, date, t_start, t_stop, hall FROM lectures");
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
                int i = 0;
            %>
            <table class="myTable">
                <tbody>
                    <tr>
                        <th>Temat</th>
                        <th>Sala</th>
                        <th>Data wykładu</th>
                        <th>Godzina rozpoczecia</th>
                        <th>Godzina zakonczenia</th>
                        <th>Zarejestruj się</th>
                    </tr>
                    <% while (childrens.next()) {%>
                    <tr>
                        <td><%= childrens.getString("topic")%></td>
                        <td><%= childrens.getInt("hall")%></td>
                        <td><%= childrens.getDate("date")%></td>
                        <td><%= childrens.getString("t_start")%></td>
                        <td><%= childrens.getString("t_stop")%></td>
                        
                        <% i = childrens.getInt("ID"); %>

                        <td> <a href=<%= "\"registerLecture.jsp?Id=" + childrens.getInt("ID") + childrens.getInt("id") + "\"" %> >Rejestracja </a> </td>
                    <% }%>
                    </tr>
                    </tbody>
            </table>

        </div>
                    
                    <%= session.getAttribute("Email") %>
</body>
</html>
