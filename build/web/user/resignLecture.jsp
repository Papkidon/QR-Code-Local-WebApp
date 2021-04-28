<%-- 
    Document   : registerLecture
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Connection.MySQLConnUtils"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="User.ResignLecture"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Rejestracja</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/js/js.js"></script>
    </head>

    <%
        if (MySQLConnUtils.checkEmailNotNull(request, session, response) == 0) {
            return;
        }
    %>

    <body>
        <div id="mydiv">

            <h1>Rejestracja</h1>

            <%
                int result = 0;

                // Declare and define user_id, lecture_id, email
                int user_id = 0;
                String email = session.getAttribute("Email").toString();
                int lecture_id = Integer.parseInt(request.getParameter("id"));
                ResignLecture drop = new ResignLecture();
                ResultSet rs = drop.getUserID(email);

                while (rs.next()) {
                    user_id = rs.getInt("ID");
                }

                // If is not signed, then assign this person to selected lecture
                result = drop.dropLecture(user_id, lecture_id, email);

                if (result == 1) {
                    response.sendRedirect(request.getContextPath() + "/lectures?#rl");
                } else {
                    out.println("Nie udało się zrezygnować z wykładu. Proszę spróbować później.");
                }


            %>
            <br><br>
            <button><a href="${pageContext.request.contextPath}/lectures">Powrót</a></button>
        </div>
    </body>
</html>
