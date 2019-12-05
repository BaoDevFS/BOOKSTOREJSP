package vn.edu.nlu.dao;

import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDAO {
    GetConnectDatabase getConnectDatabase = new GetConnectDatabase();
    private ArrayList<Integer> listBookByType = new ArrayList<>();
    Connection cn;

    public int countProductByType(int type) throws SQLException {
        int count = 0;
        cn = getConnectDatabase.getConnectionSql();
<<<<<<< HEAD
        String sql = "select  COUNT(id) as soluong from books WHERE active = 1 " + " and id_type=" + type;
=======

        String sql = "select  COUNT(id) as soluong from books WHERE active = 1 ";
        if (type != 0) {
            sql += "and id_type= " + type;
        }
>>>>>>> 1fc8c3e59c03194effa2fb1620601d684218d7c6
        PreparedStatement ps = cn.prepareStatement(sql);
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            count = Integer.parseInt(rs.getString("soluong"));
            cn.close();
        }
        return count;
    }

    public ArrayList<Products> getListCategoriesAndPage(int type, int currentPage, int itemPerPage) {
        ArrayList<Products> arr = new ArrayList<>();
        cn = null;
<<<<<<< HEAD
        int position = (currentPage == 0) ? 0 : (currentPage - 1) * itemPerPage;
        String sql;
        if (type > 0) {
            sql = "select * from books WHERE active = 1  " + "and id_type=" + type + " LIMIT " + position + "," + itemPerPage;
        } else {
            sql = "select * from books WHERE active = 1  " + " LIMIT " + position + "," + itemPerPage;
=======
        int position = (currentPage - 1) * itemPerPage;
        String sql = "select * from books WHERE active = 1  " + " LIMIT " + position + "," + itemPerPage;
        System.out.println(sql);
        if (type != 0) {
            sql = "select * from books WHERE active = 1  " + "and id_type=" + type + " LIMIT " + position + "," + itemPerPage;
>>>>>>> 1fc8c3e59c03194effa2fb1620601d684218d7c6
        }
        try {
            cn = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = cn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setImage(rs.getString(3));
                s.setImage_hover(rs.getString(4));
                s.setDescription(rs.getString(5));
                s.setPrice_old(rs.getFloat(6));
                s.setPrice(rs.getFloat(7));
                s.setNote(rs.getString(8));
                s.setQuantum(rs.getInt(9));
                s.setYear(rs.getInt(10));
                s.setActive(rs.getInt(11));
                s.setId_type(rs.getInt(15));
                arr.add(s);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    public static void main(String[] args) throws SQLException {
        BookDAO bt = new BookDAO();
<<<<<<< HEAD
        ArrayList<Products> l = bt.getListCategoriesAndPage(1, 2, 9);
        for (Products b : l) {
            System.out.println(b.getId() + "," + b.getName());
        }
=======
        ArrayList<Products> l = bt.getListCategoriesAndPage(1, 1, 16);
        System.out.println(l.size());
        for (Products b : l) {
            System.out.println(b.getId() + "," + b.getName());
        }
        System.out.println(bt.countProductByType(0));
>>>>>>> 1fc8c3e59c03194effa2fb1620601d684218d7c6
    }
}
