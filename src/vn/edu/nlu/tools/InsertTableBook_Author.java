package vn.edu.nlu.tools;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class InsertTableBook_Author {
    GetConnectDatabase getConn;
    Connection connection;

    public InsertTableBook_Author() {
        getConn = new GetConnectDatabase();
    }
    //them authors tu books
    public void insertAuthor(){
        try {
            connection =getConn.getConnectionSql();
            // laay tat ca name author ma khong trung lap
            String sql="SELECT distinct author from books";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                // kieem tra name co rong hay khong
                if(rs.getString(1)==null||rs.getString(1).equals("")) {
                    continue;
                }else{
                    //insert du lieu
                    String insert = "INSERT INTO authors(name,active) values (?,?)";
                    PreparedStatement prs = connection.prepareStatement(insert);
                    prs.setString(1, rs.getString(1));
                    prs.setInt(2, 1);
                    prs.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    // them du lieu vao bang book_author  tu books va authors
    public void intsertData() {
        try {
            connection = getConn.getConnectionSql();
            //join 2 bang lai der lay ddc idbook and idauthor
            String sql = "SELECT  b.id , a.id FROM books b JOIN  `authors` a ON b.author = a.`name`";
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet rs = pr.executeQuery();
            while (rs.next()) {
                // insert du lieu
                String insertauthorbook = "insert  INTO book_authors(id_book,id_author,active) values (?,?,?)";
                PreparedStatement insert = connection.prepareStatement(insertauthorbook);
                insert.setInt(1,rs.getInt(1));
                insert.setInt(2,rs.getInt(2));
                insert.setInt(3,1);
                insert.executeUpdate();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        InsertTableBook_Author is = new InsertTableBook_Author();
//        is.insertAuthor();
        is.intsertData();
    }
}
