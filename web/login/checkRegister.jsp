<%-- 
    Document   : checkRegister
    Created on : 2021-05-26, 06:44:48
    Author     : Pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="Register.Register"%>

<html>

    <head>
        <title>Rejestracja</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css"/>
    </head>

    <body>
        <div id="mydiv">
            <%
                String email = request.getParameter("email");

                Register reg = new Register();
                ResultSet rs = reg.checkRegister(email);

                if (rs.next()) {
                    out.println("Posiadasz juz konto!");
                } else {
                    session.setAttribute(email, "email");
                    response.sendRedirect(request.getContextPath() + "/UserVerify");
                }
            %>
        </div>
    </body>
</html>