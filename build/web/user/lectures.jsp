<%-- 
    Document   : lectures
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import="java.sql.*, java.util.*"%>
<%@page import="User.Lectures"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/js.js"></script>
    </head>
    <body>
        <div id="mydiv">

            <%
                if (session.getAttribute("Email") == null) {
                    response.sendRedirect(request.getContextPath() + "/index");
                    return;
                }
            %>

            <%= session.getAttribute("Email").toString()%>

            <h1>Wykłady</h1>

            <%
                Lectures children = new Lectures();
                ResultSet childrens = children.getLectures();

                // Declare and define user_id, lecture_id, email
                int user_id = 0;
                String mail = session.getAttribute("Email").toString();
                ResultSet rs = children.getUserID(mail);

                while (rs.next()) {
                    user_id = rs.getInt("ID");
                }


            %>
            <table class="myTable">
                <tbody>
                    <tr>
                        <th>Temat</th>
                        <th>Sala</th>
                        <th>Data wykładu</th>
                        <th>Godzina rozpoczecia</th>
                        <th>Godzina zakonczenia</th>
                        <th>Rejestracja/<br>rezygnacja</th>
                    </tr>
                    <% while (childrens.next()) {%>
                    <tr>
                        <td><%= childrens.getString("topic")%></td>
                        <td><%= childrens.getInt("hall")%></td>
                        <td><%= childrens.getDate("date")%></td>
                        <td><%= childrens.getString("t_start")%></td>
                        <td><%= childrens.getString("t_stop")%></td>

                        <% int lecture_id = childrens.getInt("id"); %>
                        <% ResultSet rsc = children.checkUser(user_id, lecture_id, mail); %>

                        <% if (!rsc.next()) {%>
                        <td> <a href="${pageContext.request.contextPath}/reg?id=<%=childrens.getInt("id")%>" > Rejestracja </a> </td>
                        <% } else {%>
                        <td> <a href="${pageContext.request.contextPath}/res?id=<%=childrens.getInt("id")%>" > Zrezygnuj </a> </td>
                        <% }
                            }%>
                    </tr>
                </tbody>
            </table>

        </div>
    </body>
</html>
