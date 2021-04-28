<%-- 
    Document   : mainAdmin
    Created on : 2021-03-06, 16:05:52
    Author     : Paweł
--%>

<%@page import="DBUtils.DBQuery"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="Admin.MainAdmin" %>
<%@page import="Connection.MySQLConnUtils" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
    </head>
    <body>

        <%

            if (MySQLConnUtils.checkEmailNotNull(request, session, response) == 0) {
                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }

            Connection conn = MySQLConnUtils.getMySQLConnection();

            if (DBQuery.checkEmailQuery(conn, session.getAttribute("Email").toString()) == 0) {
                response.sendRedirect(request.getContextPath() + "/index");
                return;
            }

        %>

        <div id="mydiv">

            <%= session.getAttribute("Email").toString()%>

            <h1>Administrator</h1>
            <table>
                <tbody>
                <td>
                    <form action="${pageContext.request.contextPath}/lecturesAdmin">
                        <input type="submit" value="Pokaż wykłady" />
                    </form>
                </td>

                <td>
                    <form action="${pageContext.request.contextPath}/insertLectureAdmin">
                        <input type="submit" value="Dodaj wykład" />
                    </form>
                </td>

                <td>
                    <form action="${pageContext.request.contextPath}/deleteLectureAdmin">
                        <input type="submit" value="Usuń wykład" />
                    </form>
                </td>
                </tbody>
            </table>

            <table>
                <tbody>
                <td>
                    <form action="${pageContext.request.contextPath}/showLeaderAdmin">
                        <input type="submit" value="Pokaż wykładowców"/>
                    </form>
                </td>
                <td>
                    <form action="insertLeaderData.jsp">
                        <input type="submit" value="Dodaj wykładowcę" />
                    </form>
                </td>
                <td>
                    <form action="deleteLeaderData.jsp">
                        <button><input type="submit" value="Usuń wykładowcę" /></button>
                    </form>
                </td>
                </tbody>
            </table>

            <table>
                <tbody>
                <td>
                    <form action="${pageContext.request.contextPath}/userDataAdmin">
                        <input type="submit" value="Pokaz uzytkownikow" />
                    </form>
                </td>
                <td>
                    <form action="insertUserData.jsp">
                        <input type="submit" value="Dodaj uzytkownika" />
                    </form>
                </td>
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
