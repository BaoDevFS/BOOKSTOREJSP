package vn.edu.nlu.fit.model;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class WishList {
    private ArrayList<ProductWishlist> productWishlist;

    public WishList() {
        productWishlist = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "WishList{" +
                "ProductWishlist=" + productWishlist +
                '}';
    }

    public void removeProductWishlist(int id) {
        for (int i = 0; i < productWishlist.size(); i++) {
            if (productWishlist.get(i).getId() == id) {
                productWishlist.remove(i);
                break;
            }
        }
    }

    public ArrayList<ProductWishlist> getProductWishlist() {
        return productWishlist;
    }

    public void addProductWishlist(int id) {
        GetConnectDatabase getCon = new GetConnectDatabase();
        try {
            Connection connection = getCon.getConnectionSql();
            String sql = "SELECT * from books where id=?";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                Books books = new Books();
                books.setId(rs.getInt("id"));
                books.setName(rs.getString("name"));
                books.setPrice(rs.getDouble("price"));
                books.setImage(rs.getString("image"));
                books.setActive(rs.getInt("active"));
                ProductWishlist productC = new ProductWishlist();
                productC.setBooks(books);
                productWishlist.add(productC);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void addProduct(String id) {

    }

    public void setProductWishlist(ArrayList<ProductWishlist> ProductWishlist) {
        this.productWishlist = ProductWishlist;
    }
}
