<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css">


<div id="mydiv">

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%@page import="Register.Register"%>
    <%@page import="Connection.MySQLConnUtils"%>
    <%@page import="DBUtils.DBQuery"%>

    <%

        if (request.getParameter("Email") == null) {
            response.sendRedirect(request.getContextPath() + "/index");
            return;
        }

        String email = request.getParameter("email");

        Register register = new Register();
        ResultSet check = register.checkRegister(email);

        if (check.next()) {
            out.println("Posiadasz juz konto!\n<a href='" + request.getContextPath() + "/register'>Powrót</a>");
            return;
        } else {

            String password = request.getParameter("password");
            String city = request.getParameter("city");
            String school = request.getParameter("school");
            String profile = request.getParameter("profile");

            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection conn = MySQLConnUtils.getMySQLConnection();
                Statement st = conn.createStatement();
                Statement st2 = conn.createStatement();
                int i = DBQuery.registerQuery1(conn, email, password, city, school, profile);
                int j = DBQuery.registerQuery2(conn, email);
                out.println("Dziękujemy za rejestrację! Proszę <a href='" + request.getContextPath() + "/register'>potwierdzic adres e-mail</a>, aby się zalogować.");
            } catch (Exception e) {
                System.out.print(e);
                e.printStackTrace();
            }
        }
    %>
</div>
</html>