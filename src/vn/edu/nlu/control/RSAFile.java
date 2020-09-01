package vn.edu.nlu.control;

import javax.crypto.*;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.io.*;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;
import java.util.Random;

public class RSAFile {

    public void processFile(Cipher ci, InputStream in, OutputStream out)
            throws IOException, IllegalBlockSizeException, BadPaddingException {
        byte[] ibuf = new byte[2014];
        int length;
        while ((length = in.read(ibuf)) != -1) {
            byte[] output = ci.update(ibuf, 0, length);
            if (output != null) {
                out.write(output);
            }
        }
        byte[] obuf = ci.doFinal();
        if (obuf != null) {
            out.write(obuf);
        }
        out.close();
        in.close();
    }


    public void doEncryptPrivateKey(PrivateKey pri, InputStream in, OutputStream out) throws Exception {
        KeyGenerator keygen = KeyGenerator.getInstance("AES");
        keygen.init(128);
        SecretKey skey = keygen.generateKey();
        byte[] iv = new byte[128 / 8];
        Random random = new Random();
        random.nextBytes(iv);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        {
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.ENCRYPT_MODE, pri);
            byte[] b = cipher.doFinal(skey.getEncoded());
            out.write(b);
            System.out.println("AES key length " + b.length);
        }
        out.write(iv);
        System.out.println("IV length: " + iv.length);
        Cipher ci = Cipher.getInstance("AES/CBC/PKCS5Padding");
        ci.init(Cipher.ENCRYPT_MODE, skey, ivSpec);
        processFile(ci, in, out);

    }

    public void doEncryptPublicKey(PublicKey pub, InputStream in, OutputStream out) throws Exception {
        KeyGenerator keygen = KeyGenerator.getInstance("AES");
        keygen.init(128);
        SecretKey skey = keygen.generateKey();
        byte[] iv = new byte[128 / 8];
        Random random = new Random();
        random.nextBytes(iv);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        {
            Cipher cipher = Cipher.getInstance("RSA");
            cipher.init(Cipher.ENCRYPT_MODE, pub);
            byte[] b = cipher.doFinal(skey.getEncoded());
            out.write(b);
            System.out.println("AES key length " + b.length);
        }
        out.write(iv);
        System.out.println("IV length: " + iv.length);
        Cipher ci = Cipher.getInstance("AES/CBC/PKCS5Padding");
        ci.init(Cipher.ENCRYPT_MODE, skey, ivSpec);
        processFile(ci, in, out);

    }

    public void doDecryptPublicKey(PublicKey pub, InputStream in, OutputStream out)
            throws IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
            IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
        SecretKeySpec skey = null;

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, pub);
        byte b[] = new byte[256];
        in.read(b);
        byte keyB[] = cipher.doFinal(b);
        skey = new SecretKeySpec(keyB, "AES");
        byte iv[] = new byte[128 / 8];
        in.read(iv);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        Cipher ci = Cipher.getInstance("AES/CBC/PKCS5Padding");
        ci.init(Cipher.DECRYPT_MODE, skey, ivSpec);
        processFile(ci, in, out);

    }

    public void doDecryptPrivateKey(PrivateKey pri, InputStream in, OutputStream out)
            throws IOException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException,
            IllegalBlockSizeException, BadPaddingException, InvalidAlgorithmParameterException {
        SecretKeySpec skey = null;

        Cipher cipher = Cipher.getInstance("RSA");
        cipher.init(Cipher.DECRYPT_MODE, pri);
        byte b[] = new byte[256];
        in.read(b);
        byte keyB[] = cipher.doFinal(b);
        skey = new SecretKeySpec(keyB, "AES");
        byte iv[] = new byte[128 / 8];
        in.read(iv);
        IvParameterSpec ivSpec = new IvParameterSpec(iv);
        Cipher ci = Cipher.getInstance("AES/CBC/PKCS5Padding");
        ci.init(Cipher.DECRYPT_MODE, skey, ivSpec);

        processFile(ci, in, out);


    }

    public PublicKey getPublicKey(String base64PublicKey) {
        PublicKey publicKey = null;
        try {
            X509EncodedKeySpec keySpec = new X509EncodedKeySpec(Base64.getDecoder().decode(base64PublicKey));
            KeyFactory keyFactory = KeyFactory.getInstance("RSA");
            publicKey = keyFactory.generatePublic(keySpec);
            return publicKey;
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        }
        return publicKey;
    }

    public PrivateKey getPrivateKey(String base64PrivateKey) {
        PrivateKey privateKey = null;
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(Base64.getDecoder().decode(base64PrivateKey));
        KeyFactory keyFactory = null;
        try {
            keyFactory = KeyFactory.getInstance("RSA");
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        try {
            privateKey = keyFactory.generatePrivate(keySpec);
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        }
        return privateKey;
    }

    public static void main(String[] args) throws IOException, NoSuchPaddingException, InvalidAlgorithmParameterException, NoSuchAlgorithmException, BadPaddingException, IllegalBlockSizeException, InvalidKeyException {
        FileInputStream  fi = new FileInputStream("D:\\Downloads\\bill.txt");
        FileOutputStream fo =new FileOutputStream("D:\\Downloads\\billDE.txt");
        RSAFile rs = new RSAFile();
        String key="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCl4k0CEnV1KYkSDO7LBK48f6ibz0xGBWf8qZmTIpatX3rMWzeep4X4U6cEhB+wCyPJO/rQEh3A6hkaHx0G58HyWfxGQjMNIC07jQMUx/50gZuqH/oKmUSBiBTt4rSCv98IXSRyK+QfK/bVFmVwg0WoSmF8hRPEASXRcFZFEdIyD14y48orRg1tRaCyvjhGfUkzT1VmZ3ze2DLMotjCErr5wkj7Zp0+SR4ngY2nCh5fbhjY+H52ejW70NaL2bb7wVJNwkFBhXctvtnvvSky0VFHZnVcgoXmT569UYhF2hGKWp9qdRX+WJnwfuedrepn4rO3jIbVWoml+4ardZsqodPNAgMBAAECggEAMf7Kht1ZWT5zeWU8cyOt/73Z61vG+TOX66aSCq5aC1bDg+PaF48V6YoMxGetxTkWSAgzx5IuNX5Yom7OKM6gvZIxXluFV2djOpd9Xj4IisSlTdjlW1xmMUP6StgQ33dEmRi5a0+fKWXutrpRSF/IFriUORtCochWxZC974M3fq51Bb4dsf4LWF4fmS4suh8mC/xtvrEUPMR7ZHXgivL8EaF9XD9A5jBBo86oLVZcvUXf5R/TShRdpffwJ0UQA+k5wkIX4WhPVD9rWYbhR44iuczXw9BIhIN7pqACf/cJq9NUVqNpZc0jucPwr1V0Ywy7d3FZ8KbQJHfxLNsx1zuFYQKBgQD0aqiY7V2X11pZYZ9IoQWPnztp7sy92dF7PEm/ZdYK9L5HXLoTJilOGJFN7ef+Usm77Ut9QfkP6U7C3BrJf9lS/MyXczZlr1lJlN7xnTTaRK8ADtVnniM5KxVs74jzwQIfncTd2kcp2gq/I6616cpLe50Smt5FsSg2vGq8TQ0tRwKBgQCtvtvcUmOsJRcIza0dyFwJ5Ouq1KA0G9PostvitQzMKYtu1IffJlBxjEpnYg5l4u0v4dRL1YhoxePF7rgX+4b6S0+H9X/lDqPH0IW8oiosdh/ZdI7JMo4RCkFhU0pAe+5tNt2iF4qF4Dr+2yyswu2arMliKUOKAV7M0BZlhZXwSwKBgQCHcyBR96FZh4fTZs1d85ZgXG8RqrweLjrwH54DCs2OrslQROv9trVHSUglNsXNZFXV5pBiLxB2p+X1CQNzTX3DhsNe3wNzYLSLmYvfvC5RE6Uj1BSh4rpEcULjZu+vnfOuT8GM7O1pHSO9f2nP+GsaX7vRVq/9UUsm4k4IYm79+wKBgD9VD+2KtrxcNL5Hwq/Vhf8xS9pUcSUtc5wh/lbwKf8Nsb6vh+uGmtIZElIHAzqOcmj+x5Tw/C083R8cOky7qeL4qr/jdEA5iufeEbHF5tuYH1nzy8x5OiHp/BUO+ETzJ+D1m+pm7F6KctbNa8Z5s4SrMSkv42edwkGkJFXTUOlrAoGBAJFlGabeDdOAcxH14NQFLjm3hIkoC8myD99pp1aiVF2Tdr42AAna+soa5JeCYUOYClo+/w17GhG7UZRfB4RY0R0itDy2OMtgTDeluOT2M761O5TLUc8N+lIxc1gcDa+6b7T6UFI5Ca7fsny425Y1DTMm9jwjMRCVnspHFY7q9oiS";
        rs.doDecryptPrivateKey(rs.getPrivateKey(key),fi,fo);
    }
}
