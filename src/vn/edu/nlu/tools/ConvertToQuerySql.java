package vn.edu.nlu.tools;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Iterator;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.mysql.cj.xdevapi.PreparableStatement;
import vn.edu.nlu.git.database.GetConnectDatabase;

public class ConvertToQuerySql {
	// cần thư viện poi(search vs tư khóa EXCEL POI);
	// tải về và import file poix-x-x.jar(x-x-x là số phiên bản f)
	Workbook workbook;
	HSSFSheet sheet;
	public ConvertToQuerySql(String sFile) throws EncryptedDocumentException, IOException {
		//mở file excel
		FileInputStream fis = new FileInputStream(sFile);
		workbook = WorkbookFactory.create(fis);
		
	}
	public void processExeltoString() throws SQLException {
		System.out.println(workbook.getNumberOfSheets());
//		System.out.println(workbook.getSheetName(0));
		String insertString ="INSERT INTO books(name,image,image_hover,description,price,price_old,quantum,`year`,active,id_type,author) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		int numSheet=workbook.getNumberOfSheets();
		GetConnectDatabase getConnect= new GetConnectDatabase();
		Connection con = getConnect.getConnectionSql();
		// duyet theo so luong sheet co trong file exel
		for (int i = 0; i <numSheet; i++) {
			// lay sheet ra
			sheet = (HSSFSheet) workbook.getSheetAt(i);
			// lay tat car cac dong trong 1 sheet
			Iterator<Row> itrow = sheet.iterator();
			// loai bo dong dau tieen la tieu de khong co data
			itrow.next();
			// them booktype la sheetname
			String sql ="INSERT INTO booktypes(name,active) values(?,?)";
			PreparedStatement pr2 =  con.prepareStatement(sql);
			pr2.setString(1, workbook.getSheetName(i));
			pr2.setInt(2, 1);
			pr2.executeLargeUpdate();
			// duyet tu dong trong sheet de lay du lieeuj
			while (itrow.hasNext()) {
				Row row = itrow.next();
				// get lan luot tung cell(mỗi ô trên 1 hàng )
				// cell bắt đàu vị trí 0
				// căn cứ vào file excel lấy ra dữ liệu mong muốn
				String name =row.getCell(0).getStringCellValue();

				String author = row.getCell(1).getStringCellValue();

				String price = row.getCell(8).getStringCellValue();

				String price_old = row.getCell(9).getStringCellValue()+"0";
				String year = row.getCell(10).getStringCellValue();

				String description = row.getCell(5).getStringCellValue();

				String image = row.getCell(4).getStringCellValue();

				String image_hover = row.getCell(4).getStringCellValue();

//				System.out.println(name+"-"+author+"-"+price+"-"+price_old+"-"+year+"-"+description+"-"+image);
				// insert vào database
				PreparedStatement pr =  con.prepareStatement(insertString);
				pr.setString(1, name);
				pr.setString(2, image);
				pr.setString(3, image_hover);
				pr.setString(4, description);
				pr.setString(5, price);
				pr.setString(6, price_old);
				pr.setInt(7, 10);
				pr.setString(8, year);
				pr.setInt(9, 1);
				pr.setInt(10,i+1); //typebook 1 ->
				pr.setString(11, author);
				pr.executeUpdate();
			}
		}
	}
	public static void main(String[] args) throws EncryptedDocumentException, IOException, SQLException {
		ConvertToQuerySql c = new ConvertToQuerySql("C:\\Users\\WaterMeLon\\Desktop\\100.xls");
		c.processExeltoString();
	}
}
