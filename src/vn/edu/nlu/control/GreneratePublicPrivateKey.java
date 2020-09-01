package vn.edu.nlu.control;

import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.nio.charset.Charset;
import java.security.*;
import java.util.Base64;

public class GreneratePublicPrivateKey {
    private PublicKey publicKey;
    private PrivateKey privateKey;

    public String getPublicKey() {
        return Base64.getEncoder().encodeToString(publicKey.getEncoded());
    }

    public void setPublicKey(PublicKey publicKey) {
        this.publicKey = publicKey;
    }

    public String getPrivateKey() {
        return Base64.getEncoder().encodeToString(privateKey.getEncoded());
    }

    public void setPrivateKey(PrivateKey privateKey) {
        this.privateKey = privateKey;
    }

    public void generateKey(int keyLenght) {
        KeyPairGenerator keyGen = null;
        try {
            keyGen = KeyPairGenerator.getInstance("RSA");
            keyGen.initialize(keyLenght);
            KeyPair pair = keyGen.generateKeyPair();
            publicKey = pair.getPublic();
            privateKey = pair.getPrivate();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }
    public String saveKey(String key, String filename, HttpServletRequest request){
        File file = new File(request.getServletContext().getRealPath("Public")+"/keystore/"+filename);
        if(!file.exists()) {
            try {
                file.createNewFile();
                copyFile(key,file);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return  file.getAbsolutePath();
    }
    private  boolean copyFile(String key, File desFile) {
        try {
            PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(desFile), Charset.forName("UTF-8")));
            printWriter.write(key);
            printWriter.flush();
            printWriter.close();
            return true;
        }catch (IOException e){
            e.printStackTrace();
            return false;
        }
    }
}
