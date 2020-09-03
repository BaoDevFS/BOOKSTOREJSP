package vn.edu.nlu.dao;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.ProductCart;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetBooking {
    private GetConnectDatabase getDatabase;
    private Connection connection;

    public GetBooking() {
        getDatabase = new GetConnectDatabase();
    }

    public Orders getBooking(int id) {
        try {
            Orders orders = new Orders();
            connection = getDatabase.getConnectionSql();
            String sql = "SELECT * from orders where active=0 and id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1,id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                orders.setId(rs.getInt("id"));
                orders.setName(rs.getString("name"));
                orders.setPhone(rs.getString("phone"));
                orders.setEmail(rs.getString("email"));
                orders.setAddress(rs.getString("address"));
                orders.setTotal(rs.getDouble("total"));
                orders.setNote(rs.getString("note")==null?"":rs.getString("note"));
                orders.setDate(rs.getDate("created_at"));
            }
                String sql2 = "SELECT b.id,b.`name`,b.price,d.quantum,b.image FROM books b JOIN detailorders d ON b.id =  d.id_book WHERE d.id_order=?";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, orders.getId());
                ResultSet rs2 = ps2.executeQuery();
                ArrayList<ProductCart> listBook = new ArrayList<>();
                while (rs2.next()) {
                    ProductCart productCart = new ProductCart();
                    Books book = new Books();
                    book.setId(rs2.getInt(1));
                    book.setName(rs2.getString(2));
                    book.setPrice(rs2.getDouble(3));
                    book.setImage(rs2.getString(5));
                    productCart.setId(rs2.getInt(1));
                    productCart.setBooks(book);
                    productCart.setQuantity(rs2.getInt(4));
                    listBook.add(productCart);
                }
               orders.setListBook(listBook);
            return orders;
        } catch (SQLException e) {

            e.printStackTrace();
            return null;
        }
    }

    public static void main(String[] args) {
        GetBooking get = new GetBooking();
        Orders orders = get.getBooking(49);
        Gson gson = new Gson();
        System.out.println(gson.toJson(orders));
    }

}
