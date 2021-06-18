<%-- 
    Document   : insertLeaderData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Admin.InsertLeaderData"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="Connection.MySQLConnUtils"%>
<%@page import="DBUtils.DBQuery"%>

<jsp:include page="/admin" /> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
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

    <body onload="displayResults()">
        <div id="mydiv">

            <h1>Wprowadź wykładowcę</h1>
            <%                int result = 0;

                if (request.getParameter("submit") != null) {

                    String name = new String();
                    String lastName = new String();
                    String degree = new String();

                    if (request.getParameter("name") != null) {
                        name = request.getParameter("name");
                    }

                    if (request.getParameter("lastName") != null) {
                        lastName = request.getParameter("lastName");
                    }

                    if (request.getParameter("degree") != null) {
                        degree = request.getParameter("degree");
                    }

                    InsertLeaderData leader = new InsertLeaderData();
                    result = leader.setLeader(name, lastName, degree);

                }
            %>

            <form name="myForm" action="${pageContext.request.contextPath}/insertLeaderAdmin" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Imie </td>
                            <td><input type="text" name="name" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Nazwisko </td>
                            <td><input type="text" name="lastName" value="" size="50" /></td>
                        </tr>
                        <tr>
                            <td>Stopien </td>
                            <td><select name="degree">
                                    <option>Inzynier</option>
                                    <option>Magister</option>
                                    <option>Doktor</option>
                                    <option>Profesor</option>
                                </select></td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" name="hidden" value="<%= result%>" />

                <input type="submit" value="Potwierdź" name="submit" />
                <input type="reset" value="Resetuj" name="reset" />
            </form>

            <script language="JavaScript">
                <!--
                function displayResults()
                {
                    if (document.myForm.hidden.value == 1) {
                        alert("Dane zostaly wprowadzone");
                    }
                }
                //-->
            </script>
        </div>
    </body>
</html>
