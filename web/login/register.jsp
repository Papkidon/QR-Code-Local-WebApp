<%-- 
    Document   : register
    Created on : 2021-04-22, 07:17:41
    Author     : Pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <style>
            <%@ include file="../css/bg_gradient.css"%>
        </style>

        <meta charset="UTF-8">
        <title>Rejestracja</title>
    </head>
    <body>

        <div id="mydiv">
            <form action="reg-process.jsp" method="post">
                <h1>Zarejestruj się</h1>
                <table class="myTable">
                    <tbody>
                        <tr>
                            <td>Adres e-mail : </td>
                            <td><input type="email" name="email" /></td>

                    <script type="text/javascript">
                        if ($('#email').val() === "")
                        {
                            e.preventDefault();
                        }
                    </script><!-- comment -->

                    </tr>
                    <tr>
                        <td>Hasło : </td>
                        <td><input type="password" name="password" minlength="8" maxlength="12"/> (od 8 do 12 cyfr)</td>
                    </tr>
                    <tr>
                        <td>Miejscowość : </td>
                        <td><input type="text" name="city" /></td>
                    </tr>
                    <tr>
                        <td>Nazwa obecnej szkoły : </td>
                        <td><input type="text" name="school" /></td>
                    </tr>
                    <tr>
                        <td>Profil : </td>
                        <td><input type="text" name="profile" /></td>
                    </tr>
                    <tr>
                        <td><input type="submit" /></td>
                    </tr>
                    </tbody>
                </table>
            </form>

            <h1>Zweryfikuj e-mail</h1>
            <form action="<%=request.getContextPath()%>/UserVerify" method="POST">
                <table>
                    <tbody>
                        <tr>
                            <td><input type="email" name="email"></td>
                            <td><input type="submit" value="Potwierdź"></td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </body>
</html>