<%-- 
    Document   : insertLectureData
    Created on : 2021-03-06, 18:30:36
    Author     : Paweł
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page import="java.sql.*"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Dni otwarte</title>
        <link rel="stylesheet" href="../css/bg_gradient.css" />
    </head>
    <body onload="displayResults()">
        
        <div id="mydiv">
            
        <h1>Wprowadz dane</h1>
        <%!
            public class Children {
                String URL = "jdbc:mysql://localhost:3307/childreg";
                String USERNAME = "user";
                String PASSWORD = "haslo";

                Connection connection = null;
                PreparedStatement insertChildren = null;
                ResultSet resultSet = null;

                public Children() {
                
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        insertChildren = connection.prepareStatement(
                                "INSERT INTO lectures (leader_id, topic, date, t_start, t_stop, hall) VALUES (?, ?, ?, ?, ?, ?)");
                    } catch (SQLException e){
                        e.printStackTrace();
                        }
               }

             public int setChildren(int leaderId, String topic, Timestamp date, String t_start, String t_stop, int hall) {
                    
                int result = 0;

                try {
                insertChildren.setInt(1, leaderId);
                insertChildren.setString(2, topic);
                insertChildren.setTimestamp(3, date);
                insertChildren.setString(4, t_start);
                insertChildren.setString(5, t_stop);
                insertChildren.setInt(6, hall);
                result = insertChildren.executeUpdate();
                } catch (SQLException e) {
                    e.printStackTrace();
}

                return result;
}
    }
            %>
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
                
                Children children = new Children();
                result = children.setChildren(leader_id, topic, timeStamp, t_start, t_stop, hall);
                
                }
            %>
        
        <form name="myForm" action="insertLectureData.jsp" method="POST">
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
