package vn.edu.nlu.dao;

import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.*;
import java.util.ArrayList;

public class GetListProductType {
    GetConnectDatabase getConnectDatabase;

    public GetListProductType() {
        getConnectDatabase = new GetConnectDatabase();
    }

    public static ResultSet getListProductType() throws SQLException {
        GetConnectDatabase getConnectDatabase = new GetConnectDatabase();
        Connection connection = null;
        ResultSet resultSet2;
        String sql2 = "SELECT * from booktypes WHERE active = 1";
        connection = getConnectDatabase.getConnectionSql();
        Statement statement2 = connection.createStatement();
        resultSet2 = statement2.executeQuery(sql2);
        return resultSet2;
    }

    public ArrayList<Products> getList() {
        ArrayList<Products> arr = new ArrayList<>();
        Connection cn = null;

        String sql = "select * from books WHERE active = 1";
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

<<<<<<< HEAD:src/vn/edu/nlu/dao/GetListProductType.java
=======
    public ArrayList<Products> getListCategories(int type) {
        ArrayList<Products> arr = new ArrayList<>();
        Connection cn = null;
        String sql = "select * from books WHERE active = 1 ";
        if (type != 0) {
            sql += "and id_type= " + type;
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

>>>>>>> 1fc8c3e59c03194effa2fb1620601d684218d7c6:src/vn/edu/nlu/control/GetListProductType.java
    public static void main(String[] args) {
        GetListProductType g = new GetListProductType();
        ArrayList<Products> l = g.getList();
        System.out.println(l.size());
    }
}
