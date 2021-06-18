<%-- 
    Document   : registerLecture
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="User.RegisterLecture"%>
<%@page import="Connection.MySQLConnUtils"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejestracja</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/js.js"></script>
    </head>

    <body>
        <div id="mydiv">
            <p>Dziękujemy za udział w dniach otwartych!</p>
            <p class="link2"><a href="${pageContext.request.contextPath}/index">Powrót do strony głównej</a></p>
        </div>
    </body>
</html>
