package vn.edu.nlu.control;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

import static javax.mail.internet.InternetAddress.*;

public class SendMail {
    String mailTo;
    String mailFrom="BookStoreBQG@gmail.com";
    EnCodeBase64 enCodeBase64;
    public SendMail(String mailTo){
        this.mailTo=mailTo;
        sendMail();
    }
    public void sendMail(){
        try{
            String host = "smtp.gmail.com";
            String pass = "special45";
            Properties props = System.getProperties();
            props.put("mail.smtp.host", host);
            props.put("mail.transport.protocol", "smtp");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.user", mailFrom);
            props.put("mail.password", pass);
            props.put("mail.port", "465");
            Session mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(mailFrom, pass);
                }
            });
            enCodeBase64 = new EnCodeBase64();
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(mailFrom));
            // To get the array of addresses
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
            message.setSubject("Verify acount");
            message.setText("Click to link verify account: "+"http://localhost:8080/BookStore/VerifyAcount?token="+enCodeBase64.enCode(mailTo));
            Transport.send(message);
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
}
