package vn.edu.nlu.control;

import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class SearchController {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public ArrayList<Products> listProduct = new ArrayList<>();

    public SearchController() {
        getConnectDatabase = new GetConnectDatabase();
    }

    public ArrayList<Products> search(String stringSearch) {
        ArrayList<Products> arr = new ArrayList<>();
        connection  = null;

        String sql = ("select * from products where products.name like '%" + stringSearch + "%'");
        try {
            connection = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            //pre.setString(1, stringSearch);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Products s = new Products();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                s.setImage(rs.getString(3));
                s.setPrice(rs.getFloat(5));
                System.out.println(" tìm sách");
                arr.add(s);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println(" tìm sách..................");
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        System.out.println(" tìm sách");
        return arr;
    }
}
