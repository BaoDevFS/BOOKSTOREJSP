package vn.edu.nlu.control;

import vn.edu.nlu.dao.HashCode;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class SendMail {
    String mailFrom="BookStoreBQG@gmail.com";
    EnCodeBase64 enCodeBase64;
    Session mailSession;
    public SendMail(){
        setUp();
    }
    private void setUp(){
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
        mailSession = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, pass);
            }
        });
    }
    public void sendMailVerify(String mailTo){
        try{
            enCodeBase64 = new EnCodeBase64();
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(mailFrom));
            // To get the array of addresses
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
            message.setSubject("Verify acount");
            message.setText("Click to link verify account: "+"http://localhost:8080/BookStore/VerifyAccount?token="+enCodeBase64.enCode(mailTo));
            Transport.send(message);
        }
        catch(Exception e){
            System.out.println(e.getMessage());
        }
    }
    public void sendMailRecoverPassWord(String mailTo,String token){
        try {
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(mailFrom));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
            message.setSubject("Reset Your BookStoreBQG Account Password");
            String mesag="If you don't want to change your password or didn't request this, please ignore and delete this message.\n" +
                    "Thank you,\n" +
                    "The BookStoreBQG Team";
            message.setText("Click to link reset password: "+"http://localhost:8080/BookStore/ResetPassword?token="+token+"\n"+mesag);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
