package vn.edu.nlu.control;

import java.awt.*;
import java.awt.image.BufferedImage;

public class ResizeImage {


//    public static void main(String [] args){
//
//        try{
//
//            BufferedImage originalImage = ImageIO.read(new File("D:\\00_HK1_3\\LTW\\test\\1dQ0a3p.jpg"));
//            int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
//
//            BufferedImage resizeImageJpg = resizeImage(originalImage, type);
//            ImageIO.write(resizeImageJpg, "jpg", new File("D:\\00_HK1_3\\LTW\\img3.jpg"));
//
//            BufferedImage resizeImagePng = resizeImage(originalImage, type);
//            ImageIO.write(resizeImagePng, "png", new File("D:\\00_HK1_3\\LTW\\img4.jpg"));
//
////            BufferedImage resizeImageHintJpg = resizeImageWithHint(originalImage, type);
////            ImageIO.write(resizeImageHintJpg, "jpg", new File("D:\\00_HK1_3\\LTW\\img1.jpg"));
////
////            BufferedImage resizeImageHintPng = resizeImageWithHint(originalImage, type);
////            ImageIO.write(resizeImageHintPng, "png", new File("D:\\00_HK1_3\\LTW\\img2.jpg"));
//
//        }catch(IOException  e){
//            System.out.println(e.getMessage());
//        }
//
//    }

//    private static BufferedImage resizeImageForBook(BufferedImage originalImage, int type){
//        int IMG_WIDTH = 270;
//        int IMG_HEIGHT = 340;
//        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
//        Graphics2D g = resizedImage.createGraphics();
//        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
//        g.dispose();
//
//        return resizedImage;
//    }

    public  BufferedImage resizeImageForBook(BufferedImage originalImage){
        int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
        int IMG_WIDTH = 270;
        int IMG_HEIGHT = 340;
        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();
        g.setComposite(AlphaComposite.Src);

        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.setRenderingHint(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);

        return resizedImage;
    }
    public BufferedImage resizeImageForUser(BufferedImage originalImage){
        int type = originalImage.getType() == 0? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
        int IMG_WIDTH = 100;
        int IMG_HEIGHT = 100;
        BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
        Graphics2D g = resizedImage.createGraphics();
        g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
        g.dispose();
        g.setComposite(AlphaComposite.Src);

        g.setRenderingHint(RenderingHints.KEY_INTERPOLATION,
                RenderingHints.VALUE_INTERPOLATION_BILINEAR);
        g.setRenderingHint(RenderingHints.KEY_RENDERING,
                RenderingHints.VALUE_RENDER_QUALITY);
        g.setRenderingHint(RenderingHints.KEY_ANTIALIASING,
                RenderingHints.VALUE_ANTIALIAS_ON);
        return resizedImage;
    }
}
