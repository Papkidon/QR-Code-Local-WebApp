<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="User.Questionnaire"%>
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
            <form name="postForm" action="${pageContext.request.contextPath}/setQuestionnaire" method="POST">
                <table class="myTable">
                    <tbody>
                        <tr>
                            <td>Zaznacz wykłady, które najbardziej Ci się podobały</td>
                            <% while (rs_lc.next()) {%>
                            <td><input type="checkbox" name="lectureTopics" value="<%=rs_lc.getString("topic")%>"><%=rs_lc.getString("topic")%></td>
                                <% }%>
                        </tr>
                        <tr>
                            <td>Czy bierzesz naszą szkołę pod uwagę?</td>
                            <td>
                                <select name="intention">
                                    <option id="1" value="1">Tak</option>
                                    <option id="0" value="0">Nie</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>Jaką specjalizacją się interesujesz?</td>
                            <td>
                                <select name="spec">
                                    <option id="matfiz" value="matfiz">Matematyka-fizyka</option>
                                    <option id="biochem" value="biochem">Biologia-chemia</option>
                                    <option id="human" value="human">Humanistyczna</option>
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
