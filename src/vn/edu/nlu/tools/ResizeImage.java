package vn.edu.nlu.tools;

import java.awt.AlphaComposite;
import java.awt.Graphics2D;
import java.awt.RenderingHints;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageInputStream;

public class ResizeImage {

	public BufferedImage resizeImageForBook(BufferedImage originalImage) {
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
		int IMG_WIDTH = 270;
		int IMG_HEIGHT = 340;
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		g.setComposite(AlphaComposite.Src);

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);

		return resizedImage;
	}

	public BufferedImage resizeImageForUser(BufferedImage originalImage) {
		int type = originalImage.getType() == 0 ? BufferedImage.TYPE_INT_ARGB : originalImage.getType();
		int IMG_WIDTH = 100;
		int IMG_HEIGHT = 100;
		BufferedImage resizedImage = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, type);
		Graphics2D g = resizedImage.createGraphics();
		g.drawImage(originalImage, 0, 0, IMG_WIDTH, IMG_HEIGHT, null);
		g.dispose();
		g.setComposite(AlphaComposite.Src);

		g.setRenderingHint(RenderingHints.KEY_INTERPOLATION, RenderingHints.VALUE_INTERPOLATION_BILINEAR);
		g.setRenderingHint(RenderingHints.KEY_RENDERING, RenderingHints.VALUE_RENDER_QUALITY);
		g.setRenderingHint(RenderingHints.KEY_ANTIALIASING, RenderingHints.VALUE_ANTIALIAS_ON);
		return resizedImage;
	}

	public void saveImageForBook(String sFordel, String dFordel) throws IOException {
		File srclists = new File(sFordel);
		File desLists = new File(dFordel);
		File[] files = srclists.listFiles();
		for (int i = 0; i < files.length; i++) {
			File file = files[i];
			BufferedImage bufIp = ImageIO.read(new FileImageInputStream(file));
			ImageIO.write(resizeImageForBook(bufIp), "jpg",
					new FileOutputStream(desLists.getAbsolutePath() + "/" + file.getName()));
		}
	}
	public static void main(String[] args) throws IOException {
		ResizeImage rs = new ResizeImage();
		rs.saveImageForBook("D:\\00_HK1_3\\LTW\\test\\img", "D:\\00_HK1_3\\LTW\\test\\des");
	}
}
