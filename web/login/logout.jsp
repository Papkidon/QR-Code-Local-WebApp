<%-- 
    Document   : logout
    Created on : 2021-04-14, 09:37:26
    Author     : Pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% request.getSession().removeAttribute("Email");%>
<% response.sendRedirect("../index.jsp");%>