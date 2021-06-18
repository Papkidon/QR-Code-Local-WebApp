<%-- 
    Document   : register
    Created on : 2021-04-22, 07:17:41
    Author     : Pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css">
        <meta charset="UTF-8">
        <title>Rejestracja</title>
    </head>
    <body>


        <div id="mydiv">

            <h1>Zarejestruj się</h1>
            <form action="<%=request.getContextPath()%>/UserVerify" method="POST">
                <table class ="myTable">
                    <tr>
                        <td>Adres e-mail : </td>
                        <td><input type="email" name="email" required/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" value="Zarejestruj się"></td>
                    </tr>
                </table>
            </form>
        </div>
    </body>
</html>