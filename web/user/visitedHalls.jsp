<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="User.VisitedHalls"%>
<%@page import="Connection.MySQLConnUtils"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex,nofollow"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
        <title>Sale</title>
    </head>
    <%
            if (MySQLConnUtils.checkEmailNotNull(request, session, response) == 0) {
                return;
            }
    %>

    <body>
        <div id="mydiv">

            <!-- Tablice odwiedzin -->

            <%
                String email = session.getAttribute("Email").toString();
                VisitedHalls visits = new VisitedHalls();
                ResultSet visited = visits.findVisited(email);
            %>

            <table class="myTable">
                <tr>
                    <th>Odwiedziny</th>
                </tr>

                <tr>
                    <td>Sala 100</td>
                    <td>Sala 101</td>
                    <td>Sala 102</td>
                    <td>Sala 200</td>
                    <td>Sala 201</td>
                    <td>Sala 202</td>
                    <td>Sala 300</td>
                </tr>
                <% while (visited.next()) {%>
                <tr>
                    <% if (visited.getInt("h100") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% } %>

                    <% if (visited.getInt("h101") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                    <% if (visited.getInt("h102") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                    <% if (visited.getInt("h200") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                    <% if (visited.getInt("h201") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                    <% if (visited.getInt("h202") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                    <% if (visited.getInt("h300") == 1) { %>
                    <td>Tak</td>
                    <% } else {%>
                    <td>Nie</td>
                    <% }%>

                </tr>
                <% }%>
            </table>

            <% ResultSet visited3 = visits.findVisited(email); %>
            <!-- Kody QR -->
            <h1>Sale </h1>
            <table class="myTable">
                <tr>
                    <% while (visited3.next()) {%>
                    <% if (visited3.getInt("h100") == 0) { %>
                    <th>100</th>
                        <% } %>
                        <% if (visited3.getInt("h101") == 0) { %>
                    <th>101</th>
                        <% } %>
                        <% if (visited3.getInt("h102") == 0) { %>
                    <th>102</th>
                        <% } %>
                        <% if (visited3.getInt("h200") == 0) { %>
                    <th>200</th>
                        <% } %>
                        <% } %>
                </tr>
                <% ResultSet visited1 = visits.findVisited(email); %>
                <% while (visited1.next()) {%>
                <tr>
                    <% if (visited1.getInt("h100") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h100 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 100 -->
                    <% }%>
                    <% if (visited1.getInt("h101") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h101 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 101 -->
                    <% } %>
                    <% if (visited1.getInt("h102") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h102 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 102 -->
                    <% } %>
                    <% if (visited1.getInt("h200") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h200 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 200 -->
                    <% } %>
                </tr>
                <% } %>
            </table>

            <% ResultSet visited2 = visits.findVisited(email); %>

            <table class="myTable">   
                <% while (visited2.next()) {%>
                <tr>
                    <% if (visited2.getInt("h201") == 0) { %>
                    <th>201</th>
                        <% } %>
                        <% if (visited2.getInt("h202") == 0) { %>
                    <th>202</th>
                        <% } %>
                        <% if (visited2.getInt("h300") == 0) { %>
                    <th>300</th>
                        <% } %>
                </tr>
                <% } %>
                <% visited2 = visits.findVisited(email); %>
                <% while (visited2.next()) {%>
                <tr>
                    <% if (visited2.getInt("h201") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h201 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 201 -->
                    <% } %>
                    <% if (visited2.getInt("h202") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.111:8080/${pageContext.request.contextPath}/setVisitedHall?val=h202 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 202 -->
                    <% } %>
                    <% if (visited2.getInt("h300") == 0) {%>
                    <td><img src="${pageContext.request.contextPath}/GenerateQRCode?qrText=http://192.168.15.105:8080/${pageContext.request.contextPath}/setVisitedHall?val=h300 <%=session.getAttribute("Email").toString()%>"></td>
                    <!-- 300 -->
                    <% } %>
                </tr>
                <% }%>
            </table>
        </div>
    </body>

</html>