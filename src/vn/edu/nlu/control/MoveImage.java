package vn.edu.nlu.control;

import java.io.*;

/* Use for user up load avatar or admin upload book
* copy from directory out to drirectory image*/
public class MoveImage {
    public  static  boolean copyImage(String src, String des) {
        try {
            FileInputStream fis = new FileInputStream(src);
            FileOutputStream fos = new FileOutputStream(des);
            BufferedInputStream bis = new BufferedInputStream(fis);
            BufferedOutputStream bos = new BufferedOutputStream(fos);
            byte[] byt = new byte[1024*32];
            int lenght;
            while ((lenght=bis.read(byt))!=-1){
                bos.write(byt,0,lenght);
            }
            bis.close();
            fis.close();
            bos.close();
            fos.close();
            return true;
        }catch (IOException e){
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) throws ClassNotFoundException {
       File file = new File(System.getProperty("user.dir")+"\\web\\Public\\images\\books");
        File[] files = file.listFiles();
        System.out.println(file.getAbsolutePath());
    }
}
