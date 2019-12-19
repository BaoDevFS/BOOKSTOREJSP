package vn.edu.nlu.fit.model;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class Cart {
    private ArrayList<ProductCart> productCart;
    private double totalCart;
    int quanty = 0;

    public void countTotalCart() {
        totalCart = 0;
        for (ProductCart p : productCart) {
            totalCart += p.getTotal();
        }
    }

    public Cart() {
        productCart = new ArrayList<>();
    }

    @Override
    public String toString() {
        return "Cart{" +
                "productCart=" + productCart +
                ", totalCart=" + totalCart +
                '}';
    }

    public void removeProductCart(int id) {
        for (int i = 0; i < productCart.size(); i++) {
            if (productCart.get(i).getId() == id) {
                productCart.remove(i);
                countTotalCart();
                break;
            }
        }
    }

    public ArrayList<ProductCart> getProductCart() {
        return productCart;
    }

    public double getTotalCart() {
        return totalCart;
    }

    public void setTotalCart(double totalCart) {
        this.totalCart = totalCart;
    }

    public void addProductCart(int id, int quantity) {
        quanty = quantity;
        for (int i = 0; i < productCart.size(); i++) {
            // if id da co thi tang quantity len 1
            //else them ms book vao
            if (id == productCart.get(i).getId()) {
                //quantity =0  tuc la them ms book vao cart
                // else chinh sua quantity da co
                if (quantity == 0) {
                    productCart.get(i).setQuantity(productCart.get(i).getQuantity() + 1);
                    countTotalCart();
                    return;
                } else {
                    if (productCart.get(i).getQuantity() + 1 == quantity) {
                        productCart.get(i).setQuantity(productCart.get(i).getQuantity() + 1);
                        countTotalCart();
                    } else if (quantity + 1 == productCart.get(i).getQuantity()) {
                        productCart.get(i).setQuantity(quantity );
                        countTotalCart();
                    } else {
                        productCart.get(i).setQuantity(quantity + productCart.get(i).getQuantity());
                        countTotalCart();
                    }
                    return;
                }
            }
        }
        // add new product and quatity no quantity and have quantity
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
                ProductCart productC = new ProductCart();
                productC.setBooks(books);
                productC.updateTotal();
                //if have quatity do setquanity
                if (quanty != 0) {
                    productC.setQuantity(quanty);
                }
                productCart.add(productC);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        countTotalCart();
    }

    public void addProduct(String id) {

    }

    public void setProductCart(ArrayList<ProductCart> productCart) {
        this.productCart = productCart;
        countTotalCart();
    }
}
