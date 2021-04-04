<%-- 
    Document   : mainAdmin
    Created on : 2021-03-06, 16:05:52
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="../css/bg_gradient.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
    </head>
    <body>
        <div id ="mydiv">
            
            <h1>Administrator</h1>
            <table>
                <tbody>
                <td>
                    <form action="lectures.jsp">
                        <input type="submit" value="Pokaż wykłady" />
                    </form>
                </td>

                <td>
                    <form action="insertLectureData.jsp">
                        <input type="submit" value="Dodaj wykład" />
                    </form>
                </td>

                <td>
                    <form action="deleteLectureData.jsp">
                        <input type="submit" value="Usuń wykład" />
                    </form>
                </td>
                </tbody>
            </table>

            <table>
                <tbody>
                <td>
                    <form action="showLeaderData.jsp">
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
                    <form action="showUserData.jsp">
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
        </div>
    </body>
</html>
