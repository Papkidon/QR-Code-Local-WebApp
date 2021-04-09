<link rel ="stylesheet" href="../css/bg_gradient.css" />


<div id="mydiv">

    <%@ page language="java" contentType="text/html; charset=UTF-8"
             pageEncoding="UTF-8"%>
    <%@page import="java.sql.*,java.util.*"%>
    <%
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String city = request.getParameter("city");
        String school = request.getParameter("school");
        String profile = request.getParameter("profile");
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/childreg", "user", "haslo");
            Statement st = conn.createStatement();
            Statement st2 = conn.createStatement();
            int i = st.executeUpdate("insert into users(email,password,city,school,profile,type)values('" + email + "','" + password + "','" + city + "','" + school + "','" + profile + "', 'user')");
            int j = st2.executeUpdate("insert into visited (email) values ('" + email + "')");
            out.println("Dziękujemy za rejestrację! Proszę <a href='register.html'>potwierdzic adres e-mail</a>, aby się zalogować.");
        } catch (Exception e) {
            System.out.print(e);
            e.printStackTrace();
        }
    %>
</div>
</html>