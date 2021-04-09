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
                <img src="../GenerateQRCode?qrText=http://192.168.15.111:8080/JSPDatabase/qr/setVisitedHall.jsp?mail=<%=session.getAttribute("Email").toString()%> & h_id=100">
                <!-- 100 -->
                <img src="../GenerateQRCode?qrText=http://192.168.15.111:8080/JSPDatabase/qr/setVisitedHall.jsp?mail=<%=session.getAttribute("Email").toString()%>&h_id=101">
                <!-- 101 -->
                <img src="../GenerateQRCode?qrText=http://192.168.15.111:8080/JSPDatabase/qr/setVisitedHall.jsp?h_id=102 + mail=<%=session.getAttribute("Email").toString()%>">
                <!-- 102 -->

        </div>
    </body>

</html>