<%-- 
    Document   : deleteChildrenData
    Created on : 2021-03-07, 09:32:58
    Author     : Paweł
--%>

<%@page import = "java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usun dane</title>
        <link rel="stylesheet" href="../css/bg_animated.css" />
    </head>
    <body onload="displayResults()">
        
        <div class="stars">
        <div class="twinkling">
        <div class="clouds">
        <div id="mydiv">
        
        <h1>Usun dane</h1>
        
                <%!
            public class Children {
                String URL = "jdbc:mysql://localhost:3307/childreg";
                String USERNAME = "user";
                String PASSWORD = "haslo";

                Connection connection = null;
                PreparedStatement selectChildren = null;
                PreparedStatement deleteChildren = null;
                ResultSet resultSet = null;

                public Children() {
                
                    try {
                        connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        selectChildren = connection.prepareStatement("SELECT c_id, name, lastName, age, gender, isSigned FROM child_id");

                        deleteChildren = connection.prepareStatement("DELETE FROM child_id WHERE c_id = ?");
                    } catch (SQLException e){
                        e.printStackTrace();
                        }
                    }

                    public ResultSet getChildren(){
                        try {
                            resultSet = selectChildren.executeQuery();
                        } catch (SQLException e) {
                                e.printStackTrace();
                          }
                        return resultSet;
                    }

                    public int deleteChildren(Integer id){
                        int result = 0;

                        try {
                            deleteChildren.setInt(1, id);
                            result = deleteChildren.executeUpdate();
                            } catch(SQLException e){
                                e.printStackTrace();
                              }
                        return result;
                    }
               }
            %>
            <%
                int result = 0;
                
                Children children = new Children();
                ResultSet childrens = children.getChildren();
                
                Integer childrenId = new Integer(0);
                
                if(request.getParameter("submit") != null) {
                    childrenId = Integer.parseInt(request.getParameter("iducznia"));
                    result = children.deleteChildren(childrenId);
                }
                %>
        
        <form name="myForm" action="deleteChildrenData.jsp" method="POST">
            <table border="0">
                <tbody>
                    <tr>
                        <td>ID Ucznia </td>
                        <td><select name="iducznia">
                                <% while (childrens.next()) { %>
                                <option value="<%= childrens.getInt("c_id")%>"><%= childrens.getInt("c_id")%> <%= childrens.getString("name")%> <%= childrens.getString("lastName")%> <%= childrens.getInt("age")%> <%= childrens.getString("gender")%> <%= childrens.getInt("isSigned")%></option>
                                <% } %>
                            </select></td>
                    </tr>
                </tbody>
            </table>
                            
            <input type="hidden" name="hidden" value="<%= result%>" />
            <input type="submit" value="Potwierdź" name="submit" />
        </form>
                            
        </div>
        </div>
        </div>
        </div>
            
            <script language="JavaScript">
            <!--
                function displayResults()
                {
                    if(document.myForm.hidden.value == 1){
                        alert("Dane zostaly usuniete");
                    }
                }
            //-->
            </script>
    </body>
</html>
