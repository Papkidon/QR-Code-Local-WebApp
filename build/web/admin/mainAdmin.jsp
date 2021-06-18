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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
        <title>Dni otwarte</title>
    </head>

    <%

        if (MySQLConnUtils.checkEmailIfAdmin(request, session, response) == 0) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        Connection conn = MySQLConnUtils.getMySQLConnection();

        if (DBQuery.checkEmailQuery(conn, session.getAttribute("AdminEmail").toString()) == 0) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

    %>

    <p><%= session.getAttribute("AdminEmail").toString()%></p>

    <h1>Administrator</h1>
    <table>
        <tbody>
        <td>
            <p class="link1"><a href="${pageContext.request.contextPath}/lecturesAdmin">Pokaż wykłady |</a></p>
        </td>

        <td>
            <p class="link1"><a href="${pageContext.request.contextPath}/insertLectureAdmin">Dodaj wykład |</a></p>
        </td>

        <td>
            <p class="link1"><a href="${pageContext.request.contextPath}/deleteLectureAdmin">Usuń wykład</a></p>
        </td>
    </tbody>
</table>

<table>
    <tbody>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/showLeaderAdmin">Pokaż wykładowców |</a></p>
    </td>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/insertLeaderAdmin">Dodaj wykładowcę |</a></p>
    </td>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/deleteLeaderAdmin">Usuń wykładowcę</a></p>
    </td>
</tbody>
</table>

<table>
    <tbody>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/userDataAdmin">Pokaż użytkowników |</a></p>
    </td>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/insertUserAdmin">Dodaj użytkownika |</a></p>
    </td>
    <td>
        <p class="link1"><a href="${pageContext.request.contextPath}/deleteUserAdmin">Usuń użytkownika</a></p>
    </td>
</tbody>
</table>

<h2><p class="link2"><a href="${pageContext.request.contextPath}/logout">Wyloguj się</a></p></h2>

</html>
