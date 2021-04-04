<%-- 
    Document   : verify
    Created on : 2021-03-26, 12:41:31
    Author     : Pawel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Weryfikacja</title>
        <link rel="stylesheet" type="text/css" href="../css/bg_gradient.css">
    </head>
    <body>
        <div id="mydiv">
            <span>Podaj 6-cyfrowy kod weryfikacyjny, który wysłaliśmy na twój adres e-mail.</span>

            <form action="../VerifyCode" method="post">
                <input type="text" name="authcode">
                <input type="submit" value="Zweryfikuj">
            </form>
</div><!-- comment -->
</body>
</html>
