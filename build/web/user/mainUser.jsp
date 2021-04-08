<%-- 
    Document   : mainUser
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

        <div id="mydiv">

            <%= session.getAttribute("Email").toString()%>

            <h1>Witaj na dniach otwartych w naszej szkole!</h1>
            <table class="myTable">
                <tbody>
                    <tr>
                        <td>
                            <form action="lectures.jsp">
                                <input type="submit" value="Pokaż wykłady" />
                            </form>
                        </td>
                        <td>
                            <form action="sendQuery.jsp">
                                <input type="submit" value="Odwiedzone sale" />
                            </form>
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
