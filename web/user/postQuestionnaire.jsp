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
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />

    </head>
    <body>

        <%
            if (session.getAttribute("Email") == null) {
                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }
        %>

        <div id="mydiv">

            <h1>Ankieta końcowa</h1>
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
            <form name="postForm" action="${pageContext.request.contextPath}/postQuestionnaire" method="POST">
                <table class="myTable">
                    <tbody>
                        <tr>
                            <td>Zaznacz wykłady, które najbardziej Ci się podobały</td>
                            <% while (rs_lc.next()) {%>
                            <td><input type="checkbox" name="lectureTopics" value="<%=rs_lc.getInt("id")%>"><%=rs_lc.getString("topic")%></td>
                                <% }%>
                        </tr>
                        <tr>
                            <td>Czy podobały Ci się dni otwarte?</td>
                            <td><input type="radio" id="howItWas1" name="hiw" value="1"><label for="howItWas1">Tak</label></td>
                            <td><input type="radio" id="howItWas2" name="hiw" value="0"><label for="howItWas2">Nie</label></td>
                        </tr>
                        <tr>
                            <td>Jaką specjalizacją się interesujesz?</td>
                            <td>
                                <select id="spec">
                                    <option value="matfiz">Matematyka-fizyka</option>
                                    <option value="biochem">Biologia-chemia</option>
                                    <option value="human">Humanistyczna</option>
                                </select>
                        </tr>
                    </tbody>
                </table>

                <input type="submit" value="Potwierdź" name="submit" />
                <input type="reset" value="Resetuj" name="reset" />
            </form>

        </div>
    </body>
</html>
