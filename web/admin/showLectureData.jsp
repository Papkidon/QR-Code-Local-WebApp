<%-- 
    Document   : showLectureData
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*"%>
<%@page import="Admin.ShowLectureData"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
    </head>
    <body>
        <div id="mydiv">
            <h1>Wykłady</h1>

            <%
                ShowLectureData sldata = new ShowLectureData();
                ResultSet data = sldata.getLectures();
            %>
        <table class="myTable">
                <tbody>
                    <tr>
                        <td>ID</td>
                        <td>ID Prowadzacego</td>
                        <td>Temat</td>
                        <td>Sala</td>
                        <td>Data wykładu</td>
                        <td>Godzina rozpoczecia</td>
                        <td>Godzina zakonczenia</td>
                    </tr>
                    <% while (data.next()) {%>
                    <tr>
                        <td><%= data.getInt("id")%></td>
                        <td><%= data.getInt("leader_id")%></td>
                        <td><%= data.getString("topic")%></td>
                        <td><%= data.getInt("hall")%></td>
                        <td><%= data.getDate("date")%></td>
                        <td><%= data.getString("t_start")%></td>
                        <td><%= data.getString("t_stop")%></td>
                        <% }%>
                    </tr>
                </tbody>
            </table>
        </div>
    </body>
</html>
