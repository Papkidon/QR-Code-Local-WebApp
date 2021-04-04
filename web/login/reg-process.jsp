<link rel ="stylesheet" href="../css/bg_animated.css" />

<div class="stars">
<div class="twinkling">
<div class="clouds">
<div id="mydiv">

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String email=request.getParameter("email");
String password=request.getParameter("password");
String city=request.getParameter("city");
String school=request.getParameter("school");
String profile=request.getParameter("profile");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/childreg", "user", "haslo");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into users(email,password,city,school,profile,type)values('"+email+"','"+password+"','"+city+"','"+school+"','"+profile+"', 'user')");
out.println("Dziekujemy za rejestracje! Prosze <a href='../mail/signupdata.jsp'>potwierdzic adres e-mail</a>, aby kontynuowac.");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</div>
</div>
</div>
</div>
</html>