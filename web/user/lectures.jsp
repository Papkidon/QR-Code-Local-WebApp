<%-- 
    Document   : lectures
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*, java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="../css/bg_gradient.css"/>
        <script type="text/javascript" src="../js/js.js"></script>
    </head>
    <body>
        <div id="mydiv">
            
            <%= session.getAttribute("Email").toString()%>

            <h1>Wykłady</h1>
            <%!
                public class Children {

                    String URL = "jdbc:mysql://localhost:3306/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement selectChildren = null;
                    PreparedStatement checkUser = null;
                    PreparedStatement findUser = null;
                    ResultSet resultSet = null;

                    public Children() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectChildren = connection.prepareStatement(
                                    "SELECT id, leader_id, topic, date, t_start, t_stop, hall FROM lectures");
                            checkUser = connection.prepareStatement(
                                    "SELECT user_id, lecture_id, mail FROM signed WHERE user_id = ? AND lecture_id = ? AND mail = ?");
                            findUser = connection.prepareStatement(
                                    "SELECT ID FROM users WHERE email = ?");
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
                }
            %>
            <%
                Children children = new Children();
                ResultSet childrens = children.getChildren();

                // Declare and define user_id, lecture_id, email
                int user_id = 0;
                String mail = session.getAttribute("Email").toString();
                ResultSet rs = children.getUserID(mail);

                while (rs.next()) {
                    user_id = rs.getInt("ID");
                }


            %>
            <table class="myTable">
                <tbody>
                    <tr>
                        <th>Temat</th>
                        <th>Sala</th>
                        <th>Data wykładu</th>
                        <th>Godzina rozpoczecia</th>
                        <th>Godzina zakonczenia</th>
                        <th>Rejestracja/<br>rezygnacja</th>
                    </tr>
                    <% while (childrens.next()) {%>
                    <tr>
                        <td><%= childrens.getString("topic")%></td>
                        <td><%= childrens.getInt("hall")%></td>
                        <td><%= childrens.getDate("date")%></td>
                        <td><%= childrens.getString("t_start")%></td>
                        <td><%= childrens.getString("t_stop")%></td>

                        <% int lecture_id = childrens.getInt("id"); %>
                        <% ResultSet rsc = children.checkUser(user_id, lecture_id, mail); %>

                        <% if (!rsc.next()) {%>
                        <td> <a href="registerLecture.jsp?id=<%=childrens.getInt("id")%>" > Rejestracja </a> </td>
                        <% } else {%>
                        <td> <a href="resignLecture.jsp?id=<%=childrens.getInt("id")%>" > Zrezygnuj </a> </td>
                        <% }
                            }%>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
