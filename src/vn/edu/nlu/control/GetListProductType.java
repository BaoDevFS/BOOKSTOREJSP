package vn.edu.nlu.control;

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
        String sql2 = "SELECT * from booktypes";
        connection = getConnectDatabase.getConnectionSql();
        Statement statement2 = connection.createStatement();
        resultSet2 = statement2.executeQuery(sql2);
        return resultSet2;
    }

    public ArrayList<Products> getList() {
        ArrayList<Products> arr = new ArrayList<>();
        Connection cn = null;

        String sql = "select * from products";
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
                s.setId_type(rs.getInt(14));
                arr.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return arr;
    }
    public ArrayList<Products> getListByPage(ArrayList<Products> arr, int start, int end) {
        ArrayList<Products> list = new ArrayList<>();
        for (int i = start; i < end; i++) {
            list.add(arr.get(i));
        }
        return list;
    }

}
