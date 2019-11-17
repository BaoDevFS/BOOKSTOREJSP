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
    public void saveImageForBook(BufferedImage inp, String filename, HttpServletRequest request) throws IOException {
        File file = new File(request.getServletContext().getRealPath("Public")+"/images/books/"+filename);
        System.out.println(file.getAbsolutePath());
        if(!file.exists()) file.createNewFile();
        ImageIO.write(resizeImage.resizeImageForBook(inp),"jpg",new FileOutputStream(file));
    }
    public void saveImageForUser(BufferedImage inp, String filename, HttpServletRequest request) throws IOException {
        File file = new File(request.getServletContext().getRealPath("admin")+"/images/user/"+filename);
        System.out.println(file.getAbsolutePath());
        if(!file.exists()) file.createNewFile();
        ImageIO.write(resizeImage.resizeImageForUser(inp),"jpg",new FileOutputStream(file));
    }
}
