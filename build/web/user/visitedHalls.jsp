<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="robots" content="noindex,nofollow"/>
        <link rel="stylesheet" href="../css/bg_gradient.css"/>
        <title>Sale</title>
    </head>

    <body>
        <div id="mydiv">
            <form id="QRcodes" name="QRcodes" method="POST" action="visitedHalls.jsp">
                <img src="../GenerateQRCode?qrText=http://192.168.15.111:8080/JSPDatabase/qr/gene">
            </form>
        </div>
    </body>

</html>