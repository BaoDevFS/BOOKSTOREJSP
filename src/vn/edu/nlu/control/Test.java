package vn.edu.nlu.control;

import vn.edu.nlu.dao.HashCode;

import java.security.NoSuchAlgorithmException;

public class Test {
    public static void main(String[] args) {
//        SendMail sendMail = new SendMail("nguyennhubao999@gmail.com");
//        sendMail.sendMail();
        try {
            System.out.println(HashCode.hashCode("nguyennhubao99@gmail.com")+HashCode.hashCode("special45"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    }
}
