<%-- 
    Document   : deleteUserData
    Created on : 2021-03-07, 09:32:58
    Author     : Paweł
--%>

<%@page import="java.sql.*" %>
<%@page import="Admin.DeleteUserData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="/admin" /> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usun dane</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>
    <body onload="displayResults()">
        <div id="mydiv">

            <h1>Usuń użytkownika</h1>

            <%
                int result = 0;

                DeleteUserData deldata = new DeleteUserData();
                ResultSet users = deldata.getUsers();

                Integer userId = new Integer(0);

                if (request.getParameter("submit") != null) {
                    userId = Integer.parseInt(request.getParameter("iducznia"));
                    result = deldata.deleteUser(userId);
                    response.sendRedirect(request.getContextPath() + "/userDataAdmin");
                }
            %>

            <form name="myForm" action="${pageContext.request.contextPath}/deleteUserAdmin" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>Usuń uczestnika </td>
                            <td><select name="iducznia">
                                    <% while (users.next()) {%>
                                    <option value="<%= users.getInt("ID")%>">[<%= users.getInt("ID")%>] [<%= users.getString("email")%>] [<%= users.getString("password")%>] [<%= users.getString("city")%>] [<%= users.getString("profile")%>] [<%= users.getString("type")%>] [<%= users.getInt("verified")%>]</option>
                                    <% }%>
                                </select></td>
                        </tr>
                    </tbody>
                </table>

                <input type="hidden" name="hidden" value="<%= result%>" />
                <input type="submit" value="Potwierdź" name="submit" />
            </form>
        </div>

        <script language="JavaScript">
            <!--
            function displayResults()
            {
                if (document.myForm.hidden.value == 1) {
                    alert("Dane zostaly usuniete");
                }
            }
            //-->
        </script>
    </body>
</html>
