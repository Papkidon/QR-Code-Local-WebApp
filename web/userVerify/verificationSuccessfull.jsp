<%-- 
    Document   : verificationSuccessfull
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="UserVerify.VerificationSuccessfull"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>

    <body>
        <div id="mydiv">

            <form action="<%=request.getContextPath()%>/reg-process" method="post">
                <table class="myTable">
                    <tr>
                        <td>Hasło : </td>
                        <td><input type="password" name="password" minlength="8" required/></td>
                    </tr>
                    <tr>
                        <td>Miejscowość : </td>
                        <td><input type="text" name="city" required/></td>
                    </tr>
                    <tr>
                        <td>Nazwa obecnej szkoły : </td>
                        <td><input type="text" name="school" required/></td>
                    </tr>
                    <tr>
                        <td>Profil : </td>
                        <td><input type="text" name="profile" required/></td>
                    </tr>
                    <tr>
                        <td><input type="submit" /></td>
                    </tr>
                </table>
            </form>

        </div>
    </body>
</html>
