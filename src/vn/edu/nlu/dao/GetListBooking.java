package vn.edu.nlu.dao;

import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.ProductCart;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetListBooking {
    GetConnectDatabase getDatabase;
    Connection connection;

    public GetListBooking() {
        getDatabase = new GetConnectDatabase();
    }

    public ArrayList<Orders> getListBooking() {
        try {
            connection = getDatabase.getConnectionSql();
            ArrayList<Orders> ar = new ArrayList<>();
            String sql = "SELECT * from orders where active=1";
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Orders orders = new Orders();
                orders.setId(rs.getInt("id"));
                orders.setName(rs.getString("name"));
                orders.setPhone(rs.getString("phone"));
                orders.setEmail(rs.getString("email"));
                orders.setAddress(rs.getString("address"));
                orders.setId_user(rs.getInt("id_user"));
                orders.setTotal(rs.getDouble("total"));
                orders.setStatus(rs.getString("status"));
                orders.setNote(rs.getString("note")==null?"":rs.getString("note"));
                ar.add(orders);
            }
            for (int i = 0; i < ar.size(); i++) {
                String sql2 = "SELECT b.id,b.`name`,b.price,b.id_type,b.author,d.quantum FROM books b JOIN detailorders d ON b.id =  d.id_book WHERE d.id_order=?";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, ar.get(i).getId());
                ResultSet rs2 = ps2.executeQuery();
                ArrayList<ProductCart> listBook = new ArrayList<>();
                while (rs2.next()) {
                    ProductCart productCart = new ProductCart();
                    Books book = new Books();
                    book.setId(rs2.getInt(1));
                    book.setName(rs2.getString(2));
                    book.setPrice(rs2.getDouble(3));
                    book.setId_type(rs2.getInt(4));
                    book.setAuthor(rs2.getString(5));
                    productCart.setId(rs2.getInt(1));
                    productCart.setBooks(book);
                    productCart.setQuantity(rs2.getInt(6));
                    listBook.add(productCart);
                }
                ar.get(i).setListBook(listBook);
            }
            return ar;
        } catch (SQLException e) {

            e.printStackTrace();
            return null;
        }
    }

}
