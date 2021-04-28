<%-- 
    Document   : deleteLectureData
    Created on : 2021-03-07, 09:32:58
    Author     : Paweł
--%>

<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usun dane</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>
    <body onload="displayResults()">
        <div id="mydiv">

            <h1>Usuń wykład</h1>

            <%!
                public class DeleteLectureData {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement selectLectures = null;
                    PreparedStatement deleteLecture = null;
                    ResultSet resultSet = null;

                    public DeleteLectureData() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            selectLectures = connection.prepareStatement("SELECT id, leader_id, topic, date, t_start, t_stop, hall FROM lectures");

                            deleteLecture = connection.prepareStatement("DELETE FROM lectures WHERE id = ?");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public ResultSet getLectures() {
                        try {
                            resultSet = selectLectures.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return resultSet;
                    }

                    public int deleteLecture(Integer id) {
                        int result = 0;

                        try {
                            deleteLecture.setInt(1, id);
                            result = deleteLecture.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                        return result;
                    }
                }
            %>
            <%
                int result = 0;

                DeleteLectureData deldata = new DeleteLectureData();
                ResultSet lectures = deldata.getLectures();

                Integer childrenId = new Integer(0);

                if (request.getParameter("submit") != null) {
                    childrenId = Integer.parseInt(request.getParameter("iducznia"));
                    result = deldata.deleteLecture(childrenId);
                }
            %>

            <form name="myForm" action="${pageContext.request.contextPath}/deleteLectureAdmin" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID Ucznia </td>
                            <td><select name="iducznia">
                                    <% while (lectures.next()) {%>
                                    <option value="<%= lectures.getInt("id")%>">[<%= lectures.getInt("id")%>] [<%= lectures.getInt("leader_id")%>] [<%= lectures.getString("topic")%>] [<%= lectures.getTimestamp("date").toString().substring(0, 10) %>] [<%= lectures.getString("t_start")%>] [<%= lectures.getString("t_stop")%>] [<%= lectures.getInt("hall")%>]</option>
                                    <% }%>
                                </select></td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" name="hidden" value="<%= result%>" />
                <input type="submit" value="Potwierdź" name="submit" />
            </form>
        </div>

        <script language="JavaScript">
            <!--
            function displayResults()
            {
                if (document.myForm.hidden.value == 1) {
                    alert("Dane zostaly usuniete");
                }
            }
            //-->
        </script>
    </body>
</html>
