<%-- 
    Document   : verificationSuccessfull
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="UserVerify.VerificationSuccessfull"%>

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

                HttpSession ses = request.getSession();
                String email = ses.getAttribute("Email").toString();

                VerificationSuccessfull verifs = new VerificationSuccessfull();
                result = verifs.setVerification(email);
            %>

            <% if (result == 1) {%>
            <h1>Konto <% out.println(email); %> zostało potwierdzone.</h1>
            <p>Możesz już <a href="${pageContext.request.contextPath}/index">się zalogować.</a></p>
            <% } else { %>
            <h1>Nie udało się potwierdzić konta. Proszę spróbować później.</h1>
            <% } %>
            
        </div>
    </body>
</html>
