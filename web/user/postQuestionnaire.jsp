<%-- 
    Document   : insertLectureData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="../css/bg_gradient.css" />
    </head>
    <body onload="displayResults()">

        <%
            String ml = (String)session.getAttribute("Email");
            if (ml == null) {
                response.sendRedirect("../index.jsp");
                return;
            }
        %>

        <div id="mydiv">

            <h1>Wprowadz dane</h1>
            <%!
                public class Questionnaire {

                    String URL = "jdbc:mysql://localhost:3307/childreg";
                    String USERNAME = "user";
                    String PASSWORD = "haslo";

                    Connection connection = null;
                    PreparedStatement insertChildren = null;
                    PreparedStatement findId = null;
                    PreparedStatement getLectures = null;
                    PreparedStatement downloadLectures = null;
                    ResultSet resultSet = null;
                    ResultSet lecturesSet = null;

                    public Questionnaire() {

                        try {
                            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                            insertChildren = connection.prepareStatement(
                                    "INSERT INTO lectures (leader_id, topic, date, t_start, t_stop, hall) VALUES (?, ?, ?, ?, ?, ?)");
                            findId = connection.prepareStatement(
                                    "SELECT ID FROM users WHERE email = ?");
                            getLectures = connection.prepareStatement(
                                    "SELECT lecture_id FROM signed WHERE user_id = ?");
                            downloadLectures = connection.prepareStatement(
                                    "SELECT id, topic, mail FROM lectures INNER JOIN signed ON lectures.id = signed.lecture_id WHERE mail = ?");
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }

                    public int setQuestionnaire(int user_id, String email, String best_lectures, int intention, String impression) {

                        int result = 0;

                        try {
                            insertChildren.setInt(1, user_id);
                            insertChildren.setString(2, email);
                            insertChildren.setString(3, best_lectures);
                            insertChildren.setInt(4, intention);
                            insertChildren.setString(5, impression);
                            result = insertChildren.executeUpdate();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return result;
                    }

                    public ResultSet getID(String email) {
                        ResultSet rs = null;

                        try {
                            findId.setString(1, email);
                            rs = findId.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return rs;
                    }

                    public ResultSet getLectures(String mail) {
                        ResultSet rs = null;

                        try {
                            downloadLectures.setString(1, mail);
                            rs = downloadLectures.executeQuery();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }

                        return rs;
                    }
                }
            %>
            <%
                int result = 0;

                if (request.getParameter("submit") != null) {

                    int user_id = 0;
                    String email = session.getAttribute("Email").toString();
                    String best_lectures = new String();
                    int intention = 0;
                    String impression = new String();

                    Questionnaire questionnaire = new Questionnaire();
                    result = questionnaire.setQuestionnaire(user_id, email, best_lectures, intention, impression);

                }
            %>

            <%
                int uid = 0;
                Questionnaire qrs = new Questionnaire();
                String email1 = session.getAttribute("Email").toString();
                ResultSet rs_id = qrs.getID(email1);

                while (rs_id.next()) {
                    uid = rs_id.getInt("id");
                }

                ResultSet rs_lc = qrs.getLectures(email1);
            %>

            <form name="postForm" action="postQuestionnaire.jsp" method="POST">
                <table class="myTable">
                    <tbody>
                        <tr>
                            <td>Zaznacz wykłady, które najbardziej Ci się podobały</td>
                            <% while (rs_lc.next()) {%>
                            <td><input type="checkbox" name="lectureTopics" value="<%=rs_lc.getInt("id")%>"><%=rs_lc.getString("topic")%></td>
                                <% }%>
                        </tr>
                        <tr>
                            <td> </td>
                            <td><input type="text" name="topic" value="" size="20" /></td>
                        </tr>
                        <tr>
                            <td>Sala </td>
                            <td><input type="number" name="hall" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Data wykładu </td>
                            <td><input type="date" name="date" value ="" size="60"></td>
                        </tr>
                        <tr>
                            <td>Godzina rozpoczecia </td>
                            <td><input type="text" name="t_start" value ="" size="20"></td>
                        </tr>
                        <tr>
                            <td>Godzina zakończenia </td>
                            <td><input type="text" name="t_stop" value ="" size="20"></td>
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
                    if (document.myForm.hidden.value === 1) {
                        alert("Dane zostaly wprowadzone");
                    }
                }
                //-->
            </script>

        </div>
    </body>
</html>
