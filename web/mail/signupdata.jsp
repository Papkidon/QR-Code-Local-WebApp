<%-- 
    Document   : signupdata
    Created on : 2021-03-24, 21:18:19
    Author     : Pawel
--%>

<%@page import="javax.mail.MessagingException"%>
<%@page import="javax.mail.Transport"%>
<%@page import="javax.mail.Message"%>
<%@page import="javax.mail.internet.InternetAddress"%>
<%@page import="javax.mail.internet.MimeMessage"%>
<%@page import="javax.mail.Session"%>
<%@page import="java.util.Properties"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Wyslij</title>
    </head>
    <body>
        <% // Recipient's email ID needs to be mentioned.
      String to = request.getParameter("email");

      // Sender's email ID needs to be mentioned
      String from = "SENDER_EMAIL";

      // Assuming you are sending email from localhost
      String host = "YOUR_EMAIL_HOST";

      // Get system properties
      Properties properties = System.getProperties();

      // Setup mail server
      properties.setProperty("mail.smtp.host", host);

      // Get the default Session object.
      Session sess = Session.getDefaultInstance(properties);

      try{
         // Create a default MimeMessage object.
         MimeMessage message = new MimeMessage(sess);

         // Set From: header field of the header.
         message.setFrom(new InternetAddress(from));

         // Set To: header field of the header.
         message.addRecipient(Message.RecipientType.TO,
                                  new InternetAddress(to));

         // Set Subject: header field
         message.setSubject("Dni otwarte - Potwierdzenie adresu e-mail");

         // Now set the actual message
         message.setText("Potwierdznie adresu e-mail");

         // Send message
         Transport.send(message);
         System.out.println("Wiadomość wysłana...");
      }catch (MessagingException mex) {
         mex.printStackTrace();
      }
   }
%>
    </body>
</html>
