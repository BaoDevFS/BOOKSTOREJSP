package vn.edu.nlu.control;

import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetProduct {
    public ArrayList<Books> getAllProduct() throws SQLException {
        GetConnectDatabase getCon = new GetConnectDatabase();
        ArrayList<Books> products = new ArrayList<>();
        Connection connect = getCon.getConnectionSql();
        String sql ="SELECT * from books";
        PreparedStatement pr = connect.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        Books product;
        while (rs.next()){
            product= new Books();
            product.setId(rs.getInt("id"));
            product.setName(rs.getString("name"));
            product.setImage(rs.getString("image"));
            product.setImage_hover(rs.getString("image_hover"));
            product.setDescription(rs.getString("description"));
            product.setPrice(rs.getDouble("price"));
            product.setPrice_old(rs.getDouble("price_old"));
            product.setYear(rs.getInt("year"));
            product.setActive(rs.getInt("active"));
            product.setId_type(rs.getInt("id_type"));
            product.setAuthor(rs.getString("author")+"");
            products.add(product);
        }
        return  products;
    }

}
