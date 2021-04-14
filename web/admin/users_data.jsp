<%-- 
    Document   : users_data
    Created on : 2021-03-06, 17:06:18
    Author     : Paweł
--%>

<%@page import = "java.sql.*"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Uczestnicy</title>
        
        <style>
        body {
    background-image: url('bg.jpg');
}
       </style>
       
       <style type="text/css"> 
#mydiv {
    position:absolute;
    top: 50%;
    left: 50%;
    width:30em;
    height:18em;
    margin-top: -9em; /*set to a negative number 1/2 of your height*/
    margin-left: -15em; /*set to a negative number 1/2 of your width*/
}

</style>

    </head>
    <body>
        <div id="mydiv">
        <h1>Dane uczestników</h1>
        <%!
            public class Children {
                String URL = "jdbc:mysql://localhost:3307/childreg";
                String USERNAME = "user";
                String PASSWORD = "haslo";

                Connection connection = null;
                PreparedStatement selectChildren = null;
                ResultSet resultSet = null;

                public Children() {
                
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        selectChildren = connection.prepareStatement(
                                "SELECT c_id, name, lastName, age, gender, isSigned FROM child_id");
                    } catch (SQLException e){
                        e.printStackTrace();
                        }
               }

               public ResultSet getChildren() {

               try {
                resultSet = selectChildren.executeQuery();
               } catch (SQLException e) {
                    e.printStackTrace();
                }

                return resultSet;
               }
    }
    %>
    <%
        Children children = new Children();
        ResultSet childrens = children.getChildren();
    %>
    <table border="1">
        <tbody>
            <tr>
                <td>ID</td>
                <td>Imie</td>
                <td>Nazwisko</td>
                <td>Wiek</td>
                <td>Płeć</td>
                <td>Czy wyklad?</td>
            </tr>
            <% while(childrens.next()) { %>
            <tr>
                <td><%= childrens.getInt("c_id")%></td>
                <td><%= childrens.getString("name")%></td>
                <td><%= childrens.getString("lastName")%></td>
                <td><%= childrens.getInt("age")%></td>
                <td><%= childrens.getString("gender")%></td>
                <td><%= childrens.getInt("isSigned")%></td>
            <% } %>
            </tr>
        </tbody>
    </table>

    </div>
    </body>
</html>
