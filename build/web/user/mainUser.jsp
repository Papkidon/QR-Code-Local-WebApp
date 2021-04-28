<%-- 
    Document   : mainUser
    Created on : 2021-03-06, 16:05:52
    Author     : Paweł
--%>

<%@page import="Connection.MySQLConnUtils"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="User.MainUser" %>

<!DOCTYPE html>
<html>
    <head>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
    </head>
    <body>

        <%

            if (MySQLConnUtils.checkEmailNotNull(request, session, response) == 0) {
                return;
            }

        %>

        <div id="mydiv">

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
                            <form action="${pageContext.request.contextPath}/lectures">
                                <input type="submit" value="Pokaż wykłady" />
                            </form>
                        </td>
                        <td>
                            <form action="${pageContext.request.contextPath}/visitedHalls">
                                <input type="submit" value="Odwiedzone sale" />
                            </form>
                        </td>
                        <% while (rs.next()) {
                                if (rs.getInt("h100") == 1 & rs.getInt("h101") == 1 & rs.getInt("h102") == 1 & rs.getInt("h200") == 1 & rs.getInt("h201") == 1 & rs.getInt("h202") == 1 & rs.getInt("h300") == 1) {
                        %>
                        <td>
                            <form action="${pageContext.request.contextPath}/postQuestionnaire">
                                <input type="submit" value="Ankieta końcowa" />
                            </form>
                        </td>
                        <% }
                            }%>
                    </tr>
                </tbody>
            </table>

            <center> <form action="${pageContext.request.contextPath}/logout" method="POST">
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
