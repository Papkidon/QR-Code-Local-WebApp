<%-- 
    Document   : insertLeaderData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="QR.SetVisitedHall"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>

    <body>
        <div id="mydiv">

            <%
                int result = 0;

                String val = request.getParameter("val");
                
                String h_id = val.substring(0, 4);
                String email = val.substring(5);

                SetVisitedHall visit = new SetVisitedHall();
                ResultSet rs1 = visit.checkVisited(h_id, email);

                if (!rs1.next()) {

                    result = visit.setVisited(h_id, email);

                    if (result == 1) {
                        out.println("Sala " + h_id.substring(1, 4) + " dla emailu " + email + " zaznaczona jako odwiedzona.");
                    } else {
                        out.println("Nie udało się oznaczyć sali " + h_id + " dla emailu " + email + " jako odwiedzonej.");
                    }
                } else {
                    out.println("Sala " + h_id.substring(1, 4) + " jest juz zaznaczona jako odwiedzona.");
                }

            %>

        </div>
    </body>
</html>
