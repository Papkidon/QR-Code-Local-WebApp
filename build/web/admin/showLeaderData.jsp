<%-- 
    Document   : showLeaderData
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import="java.sql.*"%>
<%@page import="Admin.ShowLeaderData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>
    <body>
        <div id="mydiv">
            <h1>Dane wykładowców</h1>
            <%
                ShowLeaderData leader = new ShowLeaderData();
                ResultSet leaders = leader.getLeaders();
            %>
            <table class="myTable">
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td>Imie</td>
                        <td>Nazwisko</td>
                        <td>Stopien</td>
                    </tr>
                    <% while (leaders.next()) {%>
                    <tr>
                        <td><%= leaders.getInt("id")%></td>
                        <td><%= leaders.getString("name")%></td>
                        <td><%= leaders.getString("lastName")%></td>
                        <td><%= leaders.getString("degree")%></td>
                        <% }%>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
