package vn.edu.nlu.dao;

import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;

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

    public ArrayList<Products> getListCategoriesAndPage(int type, int currentPage, int itemPerPage, String paramSort) {
        ArrayList<Products> arr = new ArrayList<>();
        cn = null;
        int position = (currentPage == 0) ? 0 : (currentPage - 1) * itemPerPage;
        String sql;
//        paramSort=null;
        if (type > 0) {
            sql = "select * from books WHERE active = 1  " + "and id_type=" + type + " ORDER BY " + paramSort + " ASC"+
            " LIMIT " + position + "," + itemPerPage;

        } else {
            sql = "select * from books WHERE active = 1  "  + "ORDER BY " + paramSort + " ASC"+ " LIMIT " + position + "," + itemPerPage;
        }
        try {
            System.out.println(sql);
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

    public ArrayList<Products> sort(ArrayList<Products> list) {
        ArrayList<Products> rs = list;
        Collections.sort(rs, new Comparator<Products>() {
            @Override
            public int compare(Products o1, Products o2) {
                return o1.getName().compareTo(o2.getName());
            }
        });
        return rs;
    }


    public static void main(String[] args) throws SQLException {
        BookDAO bt = new BookDAO();
//        ArrayList<Products> l = bt.getListCategoriesAndPage(0, 25, 12, null);
//        for (Products b : l) {
//            System.out.println(b.getId() + "," + b.getName());
//        }
//        System.out.println(bt.sort(l));
//        for (Products b : l) {
//            String r = (b.getDescription().length() > 30) ? b.getDescription().substring(0, 30) : b.getDescription();
//            System.out.println(b.getId() + "," + r);
//        }
        String s="http://localhost:8080/BookStore/ShopGrid?type=1&page=2&page=2";
        if(s.contains("page")){
            System.out.println(s.lastIndexOf("page"));

            System.out.println(s.substring(0,s.indexOf("page=")));
        }
    }
}
