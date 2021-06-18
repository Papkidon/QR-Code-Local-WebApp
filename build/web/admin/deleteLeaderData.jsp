<%-- 
    Document   : deleteLeaderData
    Created on : 2021-03-07, 09:32:58
    Author     : Paweł
--%>

<%@page import = "java.sql.*" %>
<%@page import="Admin.DeleteLeaderData"%>
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

            <h1>Usuń wykładowcę</h1>
            
            <%
                int result = 0;

                DeleteLeaderData leader = new DeleteLeaderData();
                ResultSet leaders = leader.getLeader();

                Integer leaderId = new Integer(0);

                if (request.getParameter("submit") != null) {
                    leaderId = Integer.parseInt(request.getParameter("idWykladowcy"));
                    result = leader.deleteLeader(leaderId);
                }
            %>

            <form name="myForm" action="${pageContext.request.contextPath}/deleteLeaderAdmin" method="POST">
                <table border="0">
                    <tbody>
                        <tr>
                            <td>ID Wykładowcy </td>
                            <td><select name="idWykladowcy">
                                    <% while (leaders.next()) {%>
                                    <option value="<%= leaders.getInt("id")%>">[<%= leaders.getInt("id")%>] [<%= leaders.getString("name")%>] [<%= leaders.getString("lastName")%>] [<%= leaders.getString("degree")%>]</option>
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
                if (document.myForm.hidden.value === 1) {
                    alert("Dane zostaly usuniete");
                }
            }
            //-->
        </script>
    </body>
</html>
