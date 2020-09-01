package vn.edu.nlu.control;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

public class SaveImage {
    ResizeImage resizeImage;
    public SaveImage(){
        resizeImage = new ResizeImage();
    }
    private void copyImageForBook(String src,String fileName){
        String des = System.getProperty("user.dir")+"\\web\\Public\\images\\books\\"+fileName;
        MoveImage.copyImage(src,des);
    }
    private void copyImageForUser(String src,String fileName){
        String des = System.getProperty("user.dir")+"\\web\\Public\\images\\user\\"+fileName;
        MoveImage.copyImage(src,des);
    }
    public void saveImageForBook(BufferedImage inp, String filename, HttpServletRequest request) throws IOException {
        File file = new File(request.getServletContext().getRealPath("Public")+"/images/books/"+filename);
        if(!file.exists()) file.createNewFile();
        ImageIO.write(resizeImage.resizeImageForBook(inp),"jpg",new FileOutputStream(file));
        String src = file.getAbsolutePath();
        copyImageForBook(src,filename);
    }
    public void saveImageForUser(BufferedImage inp, String filename, HttpServletRequest request) throws IOException {
        File file = new File(request.getServletContext().getRealPath("admin")+"/images/user/"+filename);
        if(!file.exists()) file.createNewFile();
        ImageIO.write(resizeImage.resizeImageForUser(inp),"jpg",new FileOutputStream(file));
        String src = file.getAbsolutePath();
        copyImageForUser(src,filename);
    }
}
