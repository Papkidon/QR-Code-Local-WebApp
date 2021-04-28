<%-- 
    Document   : showUserData
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*"%>
<%@page import="Admin.ShowUserData"%>
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
            <h1>Dane użytkowników</h1>
            <%
                ShowUserData data = new ShowUserData();
                ResultSet childrens = data.getUserData();
                ResultSet visited = data.getVisitedData();
            %>
            <table class="myTable">
                <tbody>
                    <tr>
                        <th>Konta użytkowników</th>
                    </tr>
                    <tr>
                        <td>ID</td>
                        <td>E-mail</td>
                        <td>Hasło</td>
                        <td>Szkoła</td>
                        <td>Miejscowość</td>
                        <td>Profil</td>
                        <td>Typ konta</td>
                        <td>Potwierdzony e-mail</td>
                    </tr>
                    <% while (childrens.next()) {%>
                    <tr>
                        <td><%= childrens.getInt("ID")%></td>
                        <td><%= childrens.getString("email")%></td>
                        <td><%= childrens.getString("password")%></td>
                        <td><%= childrens.getString("school")%></td>
                        <td><%= childrens.getString("city")%></td>
                        <td><%= childrens.getString("profile")%></td>
                        <% if(childrens.getString("type").equals("admin")) { %>
                        <td>Administrator</td>
                        <% } else { %>
                        <td>Użytkownik</td>
                        <% } %>
                        <% if (childrens.getInt("verified") == 0) { %>
                        <td>Nie</td>
                        <% } else { %>
                        <td>Tak</td>
                        <% } %>
                    </tr>

                    <% }%>

                    <tr>
                        <th>Odwiedziny</th>
                    </tr>

                    <tr>
                        <td>ID</td>
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
                        <td><%= visited.getInt("id")%></td>

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
                </tbody>
            </table>
        </div>
    </body>
</html>
