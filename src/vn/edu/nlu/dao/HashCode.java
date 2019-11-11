package vn.edu.nlu.dao;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashCode {
    public static String hashCode(String txt) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("HashCode");
        md.update(txt.getBytes());
        byte byteData[] = md.digest();

        StringBuffer sb = new StringBuffer();
        for (int i = 0; i < byteData.length; i++) {
            sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));
        }
        return sb.toString();
    }
//
//    public static void main(String[] args) throws NoSuchAlgorithmException {
//		System.out.println(hashCode("1234"));
//    }
}
