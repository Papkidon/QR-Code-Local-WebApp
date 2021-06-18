<!DOCTYPE html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.sql.Connection"%>
<%@page import="Connection.*"%>
<%@page import="DBUtils.DBQuery"%>

<html>
    <head>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
        <title>Logowanie</title>
    </head>
    <body>
        <div id="mydiv">

            <%
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                if (email.equals("") || password.equals("")) {
                    response.sendRedirect(request.getContextPath() + "/index");
                }

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = MySQLConnUtils.getMySQLConnection();
                ResultSet rs = DBQuery.loginQuery(con, email, password);
                try {
                    rs.next();
                    if (rs.getString("password").equals(password) && rs.getString("email").equals(email) && rs.getInt("verified") == 1) {
                        out.println("Witaj");
                    } else if (rs.getString("password").equals(password) && rs.getString("email").equals(email) && rs.getInt("verified") == 0) {
                        out.println("Musisz potwierdzić swój adres e-mail (" + email + "), aby się zalogować!");
                    } else {
                        out.println("Nieprawidlowy login lub haslo uzytkownika");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>


            <%
                ResultSet rst = DBQuery.loginQuery(con, email, password);
            %>
            <% if (rst.next() == false) { %>
            Wprowadzono zle dane!
            <% } %>

            <%
                ResultSet rsta = DBQuery.loginQuery(con, email, password);
            %>

            <%
                try {
                    rsta.next();
                    if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("admin") && rsta.getInt("verified") == 1) { %>
            <form name="loginOK1" action="${pageContext.request.contextPath}/lecturesAdmin" method="POST">
                <% session.setAttribute("AdminEmail", email); %>
                <% response.sendRedirect(request.getContextPath() + "/lecturesAdmin"); %>
            </form>
            <% } else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("user") && rsta.getInt("verified") == 1) { %>
            <form name="loginOK2" action="../user/mainUser.jsp" method="POST">
                <% session.setAttribute("Email", email); %>
                <% response.sendRedirect(request.getContextPath() + "/main"); %>
                <input type="submit" value="Przejdz do strony glownej" />
            </form>
            <% } else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("admin") && rsta.getInt("verified") == 0) { %>
            <form name ="loginVerify1" action="${pageContext.request.contextPath}/register">
                <input type="submit" value="Potwierdź email tutaj" />
            </form>
            <%} else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("user") && rsta.getInt("verified") == 0) { %>
            <form name ="loginVerify1" action="${pageContext.request.contextPath}/register">
                <input type="submit" value="Potwierdź email tutaj" />
            </form>
            <%}
                } catch (SQLException e) {
                    e.printStackTrace();
                }%>

        </div>

    </body>

</html>