package UserVerify;

import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.net.*;
import javax.net.SocketFactory;

public class SendEmail {

    public String getRandom() {
        Random rnd = new Random();
        int number = rnd.nextInt(999999);

        return String.format("%06d", number);
    }

    public boolean sendEmail(User user) {
        boolean test = false;

        String toEmail = user.getEmail();
        // E-mail address used for sending verification e-mail
        String fromEmail = "email@email.com";
        // E-mail password
        String password = "password";

        try {

            // SMTP properties
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "poczta.o2.pl");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.ssl.trust", "poczta.o2.pl");
            //pr.put("mail.smtp.socketFactory.port", "465");
            //pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });
            
            Message mess = new MimeMessage(session);
            
            mess.setRecipient(javax.mail.Message.RecipientType.TO, new InternetAddress(toEmail));
            mess.setFrom(new InternetAddress(fromEmail));
            
            mess.setSubject("Weryfikacja e-mail");
            
            mess.setText("Zarejestruj adres e-mail używając tego kodu : " + user.getCode() + "\n\nPozdrawiamy!");
            
            Transport.send(mess);
            
            test = true;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return test;
    }
}
