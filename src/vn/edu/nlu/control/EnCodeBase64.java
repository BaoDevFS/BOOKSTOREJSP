package vn.edu.nlu.control;

import java.util.Base64;

public class EnCodeBase64 {
    public static String enCode(String string){
        return Base64.getEncoder().encodeToString(string.getBytes());
    }
    public static String deCode(String stringEncode){
        return new String(Base64.getDecoder().decode(stringEncode));
    }
}
