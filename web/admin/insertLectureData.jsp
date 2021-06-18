<%-- 
    Document   : insertLectureData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="Admin.InsertLectureData"%>
<jsp:include page="/admin" /> 

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bg_gradient.css" />
    </head>
    <body onload="displayResults()">
        
        <div id="mydiv">
            
        <h1>Wprowadz dane</h1>

            <%
                int result = 0;
                
                if(request.getParameter("submit") != null) {
                
                int leader_id = 0;
                String topic = new String();
                String t_start = new String();
                String t_stop = new String();
                
                int hall = 0;
                
                if(request.getParameter("leader_id") != null) {
                    leader_id = Integer.parseInt(request.getParameter("leader_id"));
                }
                
                if(request.getParameter("t_start") != null) {
                    t_start = request.getParameter("t_start");
                }
                
                if(request.getParameter("t_stop") != null) {
                    t_stop = request.getParameter("t_stop");
                }
                
                if(request.getParameter("topic") != null) {
                    topic = request.getParameter("topic");
                }
                
                if(request.getParameter("hall") != null) {
                    hall = Integer.parseInt(request.getParameter("hall"));
                }
                
                Date date = new Date();
                Timestamp timeStamp = new Timestamp(date.getTime());
                
                InsertLectureData insdata = new InsertLectureData();
                result = insdata.setLecture(leader_id, topic, timeStamp, t_start, t_stop, hall);
                
                }
            %>
        
            <form name="myForm" action="${pageContext.request.contextPath}/insertLectureAdmin" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ID Wykładowcy</td>
                        <td><input type="number" name="leader_id" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Temat wykładu </td>
                        <td><input type="text" name="topic" value="" size="20" /></td>
                    </tr>
                    <tr>
                        <td>Sala </td>
                        <td><input type="number" name="hall" value="" size="50" /></td>
                    </tr>
                    <tr>
                        <td>Data wykładu </td>
                        <td><input type="date" name="date" value ="" size="60"></td>
                    </tr>
                    <tr>
                        <td>Godzina rozpoczecia </td>
                        <td><input type="text" name="t_start" value ="" size="20"></td>
                    </tr>
                    <tr>
                        <td>Godzina zakończenia </td>
                        <td><input type="text" name="t_stop" value ="" size="20"></td>
                    </tr>
                </tbody>
            </table>
            
            <input type="hidden" name="hidden" value="<%= result %>" />

            <input type="submit" value="Potwierdź" name="submit" />
            <input type="reset" value="Resetuj" name="reset" />
        </form>
            
            <script language="JavaScript">
            <!--
                function displayResults()
                {
                    if(document.myForm.hidden.value === 1){
                        alert("Dane zostaly wprowadzone");
                    }
                }
            //-->
            </script>
            
        </div>
    </body>
</html>
