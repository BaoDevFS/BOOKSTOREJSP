package vn.edu.nlu.tools;
import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.io.Reader;
import java.io.UnsupportedEncodingException;
import java.nio.charset.Charset;
import java.util.ArrayList;

public class GenerateFile {
	public static void main(String[] args) throws IOException {
		GenerateFile g = new GenerateFile();
//		g.generateFileJsp();
//		System.out.println(g.convertToServlet("D:\\00_HK1_3\\LTM\\test\\src\\src\\pages\\about.jsp"));
		g.generateFileServlet();
//	g.test();s
	}
	public void generateFileJsp() throws IOException {
		String path = "D:\\00_HK1_3\\LTW\\BOOKSTOREJSP\\web\\admin\\pages";
		String startHeader="<header";
		String endHeader ="</header>";
		String startFooter="<footer";
		String endFooter="</footer>";
		File pathFile = new File(path);
		ArrayList<String> listFile =find(path, ".html");
		System.out.println(listFile.toString());
		for (int i = 0; i < listFile.size(); i++) {
			File file = new File(listFile.get(i));
			File des = new File(convertToJsp(listFile.get(i)));
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file),"UTF-8"));
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(des),"UTF-8"));
//			DataInputStream bufferedReader = new DataInputStream(new FileInputStream(file));
//			DataOutputStream printWriter = new DataOutputStream(new FileOutputStream(des));
			File files = new File("D:\\00_HK1_3\\LTM\\test\\des\\sadas.txt");
			BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(new FileInputStream(files),"UTF-8"));
			printWriter.write(bufferedReader2.readLine());
			printWriter.write("\n");
			boolean statusHeader=false;
			String line;
			while ((line=bufferedReader.readLine())!=null) {
				System.out.println(line);
				if(line.contains(startHeader)) {
					statusHeader=true;
					continue;
				}else if(line.contains(endHeader)) {
					statusHeader=false;
					printWriter.write("<%@ include file=\"include/header.jsp\" %>");
					printWriter.write("\n");
					continue;
				}
				else if(line.contains(startFooter)) {
					statusHeader=true;
					continue;
				}else if(line.contains(endFooter)) {
					statusHeader=false;
					printWriter.write("<%@ include file=\"include/footer.jsp\" %>");
					printWriter.write("\n");
					continue;
				}
				if(statusHeader==true) continue;
				printWriter.write(line);
				printWriter.write("\n");
				printWriter.flush();
			}
			bufferedReader.close();
			printWriter.close();
		}
		
	}
	public void test() throws IOException {
		File file = new File("D:\\00_HK1_3\\LTW\\BOOKSTOREJSP\\web\\Public\\pages\\about.html");
		File des = new File("D:\\00_HK1_3\\LTM\\test\\src\\src\\about.jsp");
		BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(file)));
		PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(des)));
		String line="<%@ page contentType=\"text/html;charset=UTF-8\" language=\"java\" %>";
		printWriter.write(line);
		printWriter.flush();
		String startHeader="<header";
		String endHeader ="</header>";
		String startFooter="<footer";
		String endFooter="</footer>";
		boolean statusHeader=false;
		while ((line=bufferedReader.readLine())!=null) {
			System.out.println(line);
			if(line.contains(startHeader)) {
				statusHeader=true;
				continue;
			}else if(line.contains(endHeader)) {
				statusHeader=false;
				printWriter.write("<%@ include file=\"pages/include/header.jsp\"%>");
				printWriter.write("\n");
				continue;
			}
			else if(line.contains(startFooter)) {
				statusHeader=true;
				continue;
			}else if(line.contains(endFooter)) {
				statusHeader=false;
				printWriter.write("<%@ include file=\"pages/include/footer.jsp\"%>");
				printWriter.write("\n");
				continue;
			}
			if(statusHeader==true) continue;
			
			printWriter.write(line);
			printWriter.write("\n");
			printWriter.flush();
		}
		bufferedReader.close();
		printWriter.close();
	}
	public String convertToJsp(String path) {
		// lưu file luôn ở đường dẫn nhập vào
		return path.substring(0, path.lastIndexOf("."))+".jsp";
		// lưu file ở đường đẫn khác
		
//		return "D:\\00_HK1_3\\LTM\\test\\des\\"+path.substring(path.lastIndexOf("\\",path.length()));
	}
	public String convertToServlet(String path) {
		File des = new File(path);
		String name = des.getName().substring(0, des.getName().indexOf("."));
		String nameUpper = String.valueOf(name.charAt(0)).toUpperCase()+name.substring(1,name.length());
		// lưu trên cùng đường dẫn nhận vào
//		return path.substring(0, path.lastIndexOf("\\")+1)+nameUpper+".java";
		// lưu ở chỗ khác;
		return "D:\\00_HK1_3\\LTW\\BOOKSTOREJSP\\src\\vn\\edu\\nlu\\servletad\\"+nameUpper+".java";
	}
	public void generateFileServlet() throws IOException {
		String path = "D:\\00_HK1_3\\LTW\\BOOKSTOREJSP\\web\\admin\\pages";
		File pathFile = new File(path);
		ArrayList<String> listFile =find(path, ".jsp");
		for (int i = 0; i < listFile.size(); i++) {
			File des = new File(convertToServlet(listFile.get(i)));
			String name = des.getName().substring(0, des.getName().indexOf("."));
			String nameLower = String.valueOf(name.charAt(0)).toLowerCase()+name.substring(1,name.length());
			PrintWriter printWriter = new PrintWriter(new OutputStreamWriter(new FileOutputStream(des),"UTF-8"));
			String line="package vn.edu.nlu.servletad;\n" + 
					"import vn.edu.nlu.fit.model.Users;\n" + 
					"import vn.edu.nlu.git.database.GetConnectDatabase;\n" + 
					"import javax.servlet.RequestDispatcher;\n" + 
					"import javax.servlet.ServletException;\n" + 
					"import javax.servlet.annotation.WebServlet;\n" + 
					"import javax.servlet.http.HttpServlet;\n" + 
					"import javax.servlet.http.HttpServletRequest;\n" + 
					"import javax.servlet.http.HttpServletResponse;\n" + 
					"import javax.servlet.http.HttpSession;\r\n" + 
					"import java.io.IOException;\n" + 
					"import java.sql.Connection;\n" + 
					"import java.sql.ResultSet;\n" + 
					"import java.sql.SQLException;\n" + 
					"import java.sql.Statement;\n" + 
					"@WebServlet(\""+"/"+name+"\")\n" + 
					"public class "+name+" extends HttpServlet {\n" + 
					"    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" + 
					"    }\n" + 
					"\n" + 
					"    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {\n" + 
					"        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher(\"/admin/pages/"+nameLower+".jsp\");\n" + 
					"        requestDispatcher.forward(request,response);\n" + 
					"    }\n" + 
					"}";
			printWriter.write(line);
			printWriter.close();
		}
	}
	public ArrayList<String> find(String path, String pattern) {
		File file1 = new File(path);
		File[] files =file1.listFiles();
		ArrayList<String> list = new ArrayList<>();
		for (File file : files) {
			if(file.isFile()) {
				if(file.getName().contains(pattern)) {
				list.add(file.getAbsolutePath());
				}
			}else if(file.isDirectory()) {
				list.addAll(find(file.getAbsolutePath(), pattern));
			}
		}
		return list;
	}
	
}
