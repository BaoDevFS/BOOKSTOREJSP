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
        String sql = "select  COUNT(id) as soluong from books WHERE active = 1 " + " and id_type=" + type;
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
        int position = (currentPage == 0) ? 0 : (currentPage - 1) * itemPerPage;
        String sql;
        if (type > 0) {
            sql = "select * from books WHERE active = 1  " + "and id_type=" + type + " LIMIT " + position + "," + itemPerPage;
        } else {
            sql = "select * from books WHERE active = 1  " + " LIMIT " + position + "," + itemPerPage;
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
        ArrayList<Products> l = bt.getListCategoriesAndPage(1, 2, 9);
        for (Products b : l) {
            System.out.println(b.getId() + "," + b.getName());
        }
    }
}
