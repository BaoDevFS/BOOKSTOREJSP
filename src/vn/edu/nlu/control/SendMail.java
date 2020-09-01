package vn.edu.nlu.control;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import java.util.Properties;

public class SendMail {
    String mailFrom="quenquen6799@gmail.com";
    EnCodeBase64 enCodeBase64;
    Session mailSession;
    public SendMail(){
        setUp();
    }
    private void setUp(){
        String host = "smtp.gmail.com";
        String pass = "123213313";
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
    public void sendMailVerify(String mailTo,String pathFilePrivateKey,String pathFilePublicKey){
        try{
            enCodeBase64 = new EnCodeBase64();
            MimeMessage message = new MimeMessage(mailSession);
            message.setFrom(new InternetAddress(mailFrom));
            // To get the array of addresses
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(mailTo));
            message.setSubject("Verify acount");
            MimeBodyPart mesage = new MimeBodyPart();
            mesage.setText("Click to link verify account: "+"https://bookstore.com/VerifyAccount?token="+enCodeBase64.enCode(mailTo));
            Multipart multipartKey = new MimeMultipart();
            multipartKey.addBodyPart(mesage);
            MimeBodyPart messageBodyPartPrivatekey = new MimeBodyPart();
            String fileNamePrivate = "privatekey.key";
            DataSource sourcePrivate = new FileDataSource(pathFilePrivateKey);
            messageBodyPartPrivatekey.setDataHandler(new DataHandler(sourcePrivate));
            messageBodyPartPrivatekey.setFileName(fileNamePrivate);
            multipartKey.addBodyPart(messageBodyPartPrivatekey);

            MimeBodyPart messageBodyPartPublickey = new MimeBodyPart();
            String fileNamePublic = "publickey.key";
            DataSource sourcePublic = new FileDataSource(pathFilePublicKey);
            messageBodyPartPublickey.setDataHandler(new DataHandler(sourcePublic));
            messageBodyPartPublickey.setFileName(fileNamePublic);
            multipartKey.addBodyPart(messageBodyPartPublickey);

            message.setContent(multipartKey);
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
            message.setText("Click to link reset password: "+"/ResetPassword?token="+token+"\n"+mesag);
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }

    }
}
