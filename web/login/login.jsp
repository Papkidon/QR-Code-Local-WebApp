<!DOCTYPE html>


<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="java.sql.*,java.util.*"%>
<html>
    <head>
        <link rel="stylesheet" href="../css/bg_gradient.css">
        <title>Logowanie</title>
    </head>
    <body>
        <div id="mydiv">


            <%
                String email = request.getParameter("email");
                session.putValue("email", email);
                String password = request.getParameter("password");
                Class.forName("com.mysql.jdbc.Driver");
                java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/childreg", "user", "haslo");
                Statement st = con.createStatement();
                ResultSet rs = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
                try {
                    rs.next();
                    if (rs.getString("password").equals(password) && rs.getString("email").equals(email) && rs.getInt("verified") == 1) {
                        response.sendRedirect("../user/mainUser.jsp");
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
                ResultSet rst = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
            %>
            <% if (rst.next() == false) { %>
            Wprowadzono zle dane!
            <% } %>

            <%
                ResultSet rsta = st.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
            %>

            <%
                try {
                    rsta.next();
                    if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("admin") && rsta.getInt("verified") == 1) { %>
            <form name="loginOK1" action="../admin/mainAdmin.jsp" method="POST">
                <% session.setAttribute("Email", email); %>
                <input type="submit" value="Przejdz do strony glownej" />
            </form>
            <% } else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("user") && rsta.getInt("verified") == 1) { %>
            <form name="loginOK2" action="../user/mainUser.jsp" method="POST">
                <% session.setAttribute("Email", email); %>
                <input type="submit" value="Przejdz do strony glownej" />
            </form>
            <% } else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("admin") && rsta.getInt("verified") == 0) { %>
            <form name ="loginVerify1" action="register.html">
                <input type="submit" value="Potwierdź email tutaj" />
            </form>
            <%} else if (rsta.getString("password").equals(password) && rsta.getString("email").equals(email) && rsta.getString("type").equals("user") && rsta.getInt("verified") == 0) { %>
            <form name ="loginVerify1" action="register.html">
                <input type="submit" value="Potwierdź email tutaj" />
            </form>
            <%}
                } catch (SQLException e) {
                    e.printStackTrace();
                }%>

        </div>

    </body>

</html>