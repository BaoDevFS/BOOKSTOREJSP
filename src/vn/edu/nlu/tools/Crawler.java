package vn.edu.nlu.tools;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.util.ArrayList;

import javax.imageio.ImageIO;

import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Crawler {
	public static final String LINK="https://www.bookdepository.com/";
	Document document;
	HSSFWorkbook workbook;
	HSSFSheet sheet;
	Row row;
	Cell cell;
	Integer A=0;
	int i = 0;
	ResizeImage resizeImg;
	public Crawler() {
		workbook = new HSSFWorkbook();
		resizeImg = new ResizeImage();
	}
	public void getDocumentFromLink(String link) throws IOException {
		 document= Jsoup.connect(link).get();
		 
	}
	public void runCrawler() throws InterruptedException, IOException {
		ArrayList<String> links = new ArrayList<>();
//		links.add("https://www.bookdepository.com/category/2/Art-Photography");
//		links.add("https://www.bookdepository.com/category/213/Biography");
//		links.add("https://www.bookdepository.com/category/2455/Childrens-Books");
//		links.add("https://www.bookdepository.com/category/2942/Crafts-Hobbies");
//		links.add("https://www.bookdepository.com/category/2616/Crime-Thriller");
//		links.add("https://www.bookdepository.com/category/2858/Food-Drink");
//		links.add("https://www.bookdepository.com/category/2638/History-Archaeology");
//		links.add("https://www.bookdepository.com/category/2892/Home-Garden");
//		links.add("https://www.bookdepository.com/category/1983/Computer-Programming-Software-Development");
//		links.add("https://www.bookdepository.com/category/1279/Medical");
		links.add("https://www.bookdepository.com/category/3328/Teaching-Resources-Education");
		links.add("https://www.bookdepository.com/category/1708/Technology-Engineering");
		links.add("https://www.bookdepository.com/category/3391/Teen-Young-Adult");
		links.add("https://www.bookdepository.com/category/2967/Transport");
		links.add("https://www.bookdepository.com/category/3098/Travel-Holiday-Guides");
		for (; i < links.size(); i++) {
			System.out.println(i);
//			System.out.println(links.get(i).substring(links.get(i).lastIndexOf("/")+1));
//			getInfomation(links.get(i).substring(links.get(i).lastIndexOf("/")+1));
			getDocumentFromLink(links.get(i));
			getInfomation(links.get(i).substring(links.get(i).lastIndexOf("/")+1));
	
//			Thread thread = new Thread(new Runnable() {
//				@Override
//				public void run() {
//					try {
//						getDocumentFromLink(links.get(i));
//						getInfomation(links.get(i).substring(links.get(i).lastIndexOf("/")+1));
//					} catch (IOException | InterruptedException e) {
//						// TODO Auto-generated catch block
//						e.printStackTrace();
//					}
//				}
//			});
//			thread.start();
//			Thread.sleep(3000);
		}
//		TimeUnit.SECONDS.sleep(60);
		FileOutputStream fos = new FileOutputStream("C:\\Users\\WaterMeLon\\Desktop\\100.xls");
		workbook.write(fos);
		fos.close();
		System.out.println("Done!");
	}
	public void getInfomation(String booktype) throws IOException, InterruptedException {
		Elements element = document.getElementsByClass("book-item");
			sheet= workbook.createSheet(booktype);
		int countnum=0;
			row =sheet.createRow(0);
		cell =row.createCell(0);
		cell.setCellValue("title");
		
		cell =row.createCell(1);
		cell.setCellValue("author");
		
		cell =row.createCell(2);
		cell.setCellValue("price");
		
		cell =row.createCell(3);
		cell.setCellValue("publicday");
		
		cell =row.createCell(4);
		cell.setCellValue("images");
		
		cell =row.createCell(5);
		cell.setCellValue("description");
		
		cell =row.createCell(6);
		cell.setCellValue("infor");
		
		for (int i = 0; i <20; i++) {
			countnum++;
				row =sheet.createRow(countnum);
			
			Element bookItem = element.get(i);
//			Elements image = bookItem.getElementsByClass("lazy");
//			String img =image.attr("data-lazy");
//			System.out.println(img);
			Elements title =bookItem.getElementsByClass("title");
//			System.out.println(title.text());
			String tileText= title.first().text();
			cell =row.createCell(0, CellType.STRING);
			cell.setCellValue(tileText);
			
			Elements author =bookItem.getElementsByClass("author");
			cell =row.createCell(1, CellType.STRING);
			cell.setCellValue(author.text());
//			System.out.println(author.text());
			
			Elements price =bookItem.getElementsByClass("price");
			cell =row.createCell(2, CellType.STRING);
			cell.setCellValue(price.text());
//			System.out.println(price.text());
			
			Elements publicdate =bookItem.getElementsByClass("published");
			cell =row.createCell(3, CellType.STRING);
			cell.setCellValue(publicdate.text());
//			System.out.println(publicdate.text());
			
			Elements taga = bookItem.getElementsByClass("item-img");
			Element tda = taga.first();
			String linkDetail ="https://www.bookdepository.com"+tda.select("a[href]").attr("href");
//			System.out.println(linkDetail);
			getInforFromDitailBook(linkDetail,row,cell);
			System.out.println("=====================");
		}
//		FileOutputStream fos = new FileOutputStream(desFile);
//		workbook.write(fos);
//		fos.close();
//		System.out.println("Done!");	
	}

	public  void saveImage(String imageUrl) throws IOException {
		URL url = new URL(imageUrl);
		String fileName = url.getFile();
		String destName = "D:\\00_HK1_3\\LTW\\test\\200" + fileName.substring(fileName.lastIndexOf("/"));
		System.out.println(destName);
		InputStream is = url.openStream();
		BufferedImage imgBuff = ImageIO.read(is);
		BufferedImage outbuff = resizeImg.resizeImageForBook(imgBuff);
		ByteArrayOutputStream bais = new ByteArrayOutputStream();
		ImageIO.write(outbuff, "jpg",bais);
		OutputStream os = new FileOutputStream(destName);
		ByteArrayInputStream bis = new ByteArrayInputStream(bais.toByteArray());
		byte[] b = new byte[4096];
		int length;
	 
		while ((length = bis.read(b)) != -1) {
			os.write(b, 0, length);
		}
	 
		is.close();
		os.close();
	}
	public void getInforFromDitailBook(String link,Row row,Cell cell) throws IOException {
		Document doc = Jsoup.connect(link).get();
		Elements ditail = doc.getElementsByClass("item-wrap");
		Element ditails = ditail.first();
		String imgText = ditails.getElementsByClass("book-img").attr("src");
		saveImage(imgText);
		String pathImg="http://localhost:8080/BookStore/Public/images/books"+imgText.substring(imgText.lastIndexOf("/"));
		cell =row.createCell(4, CellType.STRING);
		cell.setCellValue(pathImg);
		
		Elements emldescription = ditails.getElementsByClass("item-excerpt");
		String description =emldescription.html();
//		System.out.println(description);
		cell =row.createCell(5, CellType.STRING);
		cell.setCellValue(description);
		
		Elements elmInfor = ditails.getElementsByClass("biblio-info");
		String infor = elmInfor.html();
//		System.out.println(infor);
		cell =row.createCell(6, CellType.STRING);
		cell.setCellValue(infor);
	}
	public static void main(String[] args) throws IOException, InterruptedException {
		Crawler cr = new Crawler();
//		cr.getDocumentFromLink("https://www.bookdepository.com/category/2/Art-Photography");
		cr.runCrawler();
//		cr.getInfomation("Art-Photography");
//		cr.getInforFromDitailBook("https://www.bookdepository.com/Bear-Who-Went-Boo-David-Walliams/9780008174897?ref=pd_gw_1_pd_gateway_1_1");
	}
}	
