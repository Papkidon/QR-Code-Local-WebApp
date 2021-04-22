<!DOCTYPE html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="css/bg_gradient.css" type="text/css">
    </head>

    <body onload="displayResults()">

        <div id="mydiv">

            <form action="login/login.jsp" method="post">
                <center><h1>Zaloguj się</h1></center>
                <table>
                    <tbody>
                        <tr>
                            <td>Nazwa użytkownika : </td>
                            <td><input type="email" name="email" /></td>
                        </tr>
                        <tr>
                            <td>Hasło : </td>
                            <td><input type="password" name="password" /></td>
                        </tr>
                        <tr>
                            <td><input type="submit" value="Zaloguj sie"/></td>
                        </tr>
                    </tbody>
                </table>

            </form>

            <table>
                <tr>
                    <td><p>Nie masz konta?</p></td>
                    <td><a href="<%=request.getContextPath()%>/register">Zarejestruj się
                        </a></td> <!-- Koniec przycisku rejestracji -->
                </tr>
            </table>

        </div>
    </body>
</html>