package vn.edu.nlu.tools;

import java.io.*;

public class ReadFile {
	private File file;
	private String path;
//	private String fordel = System.getProperty("user.dir") + "\\render\\model\\";
	private String fordel="D:\\00_HK1_3\\LTM\\test\\src\\";
	private BufferedReader bufferedReader;

	public ReadFile(String path) {
		this.path = path;
		readFile(path);
		createFordel();
	}

	private void createFordel() {
		file = new File(fordel);
		if (file.exists()) {

		} else {
			file.mkdir();
		}
	}

	private boolean identificationTitle(String string) {
		if (string.contains("CREATE TABLE")) {
			return true;
		} else {
			return false;
		}
	}

	private int countCharter(String string, char c) {
		int count = 0;
		for (int i = 0; i < string.length(); i++) {
			if (string.charAt(i) == c) {
				count++;
			}
		}
		return count;
	}

	private boolean identificationField(String string) {
		int countKeyOpen = countCharter(string, '`');
		if (countKeyOpen == 2 && string.contains("NULL")) {
			return true;
		} else {
			return false;
		}
	}

	private boolean indentificationFotter(String string) {
		if (string.contains("PRIMARY KEY")) {
			return true;
		} else {
			return false;
		}
	}

	private void readFile(String path) {
		file = new File(path);
		boolean flag = false;
		try {
			FileReader fileReader = new FileReader(file);
			bufferedReader = new BufferedReader(fileReader);
			String line = "";
			File infile;
			FileWriter fileWriter = null;
			while ((line = bufferedReader.readLine()) != null) {
				// xác định bắt đầu của bảng
				if (identificationTitle(line)) {
					// lấy tên bảng
					String tableName = getNameTable(line);
					String name = String.valueOf(tableName.charAt(0)).toUpperCase()+tableName.substring(1,tableName.length());
					infile = new File(fordel + name + ".java");
					// kiểm tra file có tồn tại
					if (infile.exists()) {
						flag = true;
					} else {
						infile.createNewFile();
						flag = true;
					}
					fileWriter = new FileWriter(infile);
					// viết cấu trúc tĩnh của file
					fileWriter.write("package vn.edu.nlu.fit.model;\n" + 
							"import java.sql.Date;\n"+
							"public class "+name+"{\n");
				}
				// xác định xem phải là trường của bảng hay không
				if (identificationField(line) && flag) {
					writerFiedInFile(fileWriter, line);
				}
				// xác định dấu kết thúc của bảng
				if (indentificationFotter(line) && flag) {
					// TODE sau khi da wirite xog
					flag = false;
					fileWriter.write("}\n");
					fileWriter.close();
				}
				System.out.println(line);
			}
			bufferedReader.close();
			fileReader.close();
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	private String getNameField(String string) {
		String nameField;
		nameField = string.substring(string.indexOf('`') + 1, string.lastIndexOf('`'));
		return nameField;
	}

	private String getTypeField(String string) {
		String nameTypeField;
		if(!string.contains("(")) {
			nameTypeField = string.substring(string.lastIndexOf('`')+1, string.lastIndexOf('`') + 6);
		}else {
		nameTypeField = string.substring(string.lastIndexOf('`') + 1, string.indexOf('('));
		}
		if (nameTypeField.endsWith("bigint")) {
			return "long";
		}else if (nameTypeField.endsWith("int")) {
			return "int";
		}
		else if (nameTypeField.endsWith("text")) {
			return "String";
		}
		else if (nameTypeField.endsWith("enum")) {
			return "String";
		}
		else if (nameTypeField.endsWith("year")) {
			return "int";
		}
		else if (nameTypeField.endsWith("float")) {
			return "float";
		}
		else if (nameTypeField.endsWith("tinyint")) {
			return "int";
		}
		else if (nameTypeField.endsWith("timestamp")) {
			return "Date";
		}
		else if (nameTypeField.endsWith("datetime")) {
			return "Date";
		} else if (nameTypeField.endsWith("bit")) {
			return "bool";
		} else if (nameTypeField.endsWith("text")) {
			return "String";
		} else if (nameTypeField.endsWith("varchar")) {
			return "String";
		}
		return nameTypeField;
	}

	private void writerFiedInFile(FileWriter fileWriter, String string) {
		try {
			fileWriter.write("\t\t" + getTypeField(string) + " " + getNameField(string) + " ;\n");
		} catch (IOException e) {
			System.out.println(e.toString());
		}
	}

	private String getNameTable(String string) {
		StringBuffer sbf = new StringBuffer(string);
		int end = sbf.lastIndexOf("`");
		int start = sbf.indexOf("`");
		String temp= sbf.substring(start + 1, end);
		return temp;
	}

	public static void main(String[] args) {
//		ReadFile read = new ReadFile("D:\\00_HK1_3\\LTW\\BOOKSTOREJSP\\database\\book.sql");
//	System.out.println(System.getProperty("user.dir"));
//	System.out.println(read.getNameTable("CREATE TABLE `importcoupons`  ("));
//	System.out.println(read.indentificationFotter(" PRIMARY KEY (`id`) USING BTREE,"));
//	System.out.println(read.countCharter("`gender` enum('Male','Female') CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,", '`'));
//	System.out.println(read.getNameField("  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,"));
//	System.out.println(read.getTypeField("  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,"));
//		String tableName = "user";
//		String name = String.valueOf(tableName.charAt(0)).toUpperCase()+tableName.substring(1,tableName.length());
//		System.out.println(name);
	}
}
