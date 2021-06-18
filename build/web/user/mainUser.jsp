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
                ResultSet rs2 = mainUser.checkQuestionnaire(email);
                
                if(rs2.next()){
                    response.sendRedirect(request.getContextPath() + "/finishPage");
                }
            %>

            <h1>Witaj na dniach otwartych w naszej szkole!</h1>
            <table>
                <tbody>
                    <tr>
                        <td>                         
                            <p class="link1"><a href="${pageContext.request.contextPath}/lectures">Wykłady</a></p>
                        </td>
                        <td>
                            <p class="link1"><a href="${pageContext.request.contextPath}/visitedHalls"> | Odwiedzone sale</a></p>
                        </td>
                        <% while (rs.next()) {
                                if (rs.getInt("h100") == 1 & rs.getInt("h101") == 1 & rs.getInt("h102") == 1 & rs.getInt("h200") == 1 & rs.getInt("h201") == 1 & rs.getInt("h202") == 1 & rs.getInt("h300") == 1) {
                        %>
                        <td>
                            <p class="link1"><a href="${pageContext.request.contextPath}/postQuestionnaire"> | Ankieta końcowa</a></p>
                        </td>
                        <% }
                            }%>
                    </tr>
                </tbody>
            </table>

            <center> <p class="link2"><a href="${pageContext.request.contextPath}/logout">Wyloguj się</a></p> </center>

        </div>
    </body>
</html>
