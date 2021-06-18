<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="Register.Register"%>
<%@page import="Connection.MySQLConnUtils"%>
<%@page import="DBUtils.DBQuery"%>

<!DOCTYPE html>
<html>

    <head>

        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css">

    </head>


    <div id="mydiv">

         <%

             String email = session.getAttribute("Email").toString();
             String password = request.getParameter("password");
             String city = request.getParameter("city");
             String school = request.getParameter("school");
             String profile = request.getParameter("profile");

             try {
                 Class.forName("com.mysql.jdbc.Driver");
                 Connection conn = MySQLConnUtils.getMySQLConnection();
                 int i = DBQuery.registerQuery1(conn, email, password, city, school, profile);
                 int j = DBQuery.registerQuery2(conn, email);
             } catch (Exception e) {
                 System.out.print(e);
                 e.printStackTrace();
             }
         %>
         
         <p>Dziękujemy za rejestrację!</p>
         <p class="link1"><a href="<%=request.getContextPath()%>/index">Zaloguj się</a></p>
         

         </div>
         </html>