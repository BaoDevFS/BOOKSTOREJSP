package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.control.RSAFile;
import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.ProductCart;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.crypto.NoSuchPaddingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.ByteArrayInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.charset.Charset;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/GenerateBillFile")
public class GenerateBillFile extends HttpServlet {
    private GetConnectDatabase connectDatabase;
    private Connection connection;
    private Orders orders;
    private ArrayList<ProductCart> listProduct;
    private Gson gson;
    private RSAFile rsaFile;

    public GenerateBillFile() {
        connectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        orders = new Orders();
        try {
            connection = connectDatabase.getConnectionSql();
            HttpSession session = request.getSession();
            String sql2 = "SELECT * from orders where id_user=? AND active=0 ORDER BY created_at DESC";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, ((Users) session.getAttribute("user")).getId());
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                listProduct = new ArrayList<>();
                orders.setName(rs.getString("name"));
                orders.setPhone(rs.getString("phone"));
                orders.setEmail(rs.getString("email"));
                orders.setAddress(rs.getString("address"));
                orders.setTotal(rs.getDouble("total"));
                for (ProductCart pc : (((Cart) session.getAttribute("cart")).getProductCart())) {
                    listProduct.add(pc);
                }
                orders.setListBook(listProduct);
                orders.setTotal(((Cart) session.getAttribute("cart")).getTotalCart());
                response.setContentType("application/octet-stream");
                response.setHeader("Content-disposition", "attachment; filename=bill.txt");
                // to json de gui xuong
                gson = new Gson();
                String bill = gson.toJson(orders);
                // moa hoa bang publickey
                // get public key
                String sql4 = "SELECT public_key from users where id=?";
                PreparedStatement ps = connection.prepareStatement(sql4);
                ps.setInt(1, ((Users) session.getAttribute("user")).getId());
                ResultSet rsPublicKey = ps.executeQuery();
                //neu co thi lay publickey
                if (rsPublicKey.next()) {
                    String publickey = rsPublicKey.getString(1);
                    System.out.println(publickey);
                    // ma hoa bill
                    System.out.println(bill);
                    DataOutputStream dataOutputStream = new DataOutputStream(response.getOutputStream());
                    InputStream inputStream = new ByteArrayInputStream(bill.getBytes(Charset.forName("UTF-8")));
                    rsaFile = new RSAFile();
                    rsaFile.doEncryptPublicKey(rsaFile.getPublicKey(publickey), inputStream, dataOutputStream);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        } catch (NoSuchPaddingException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}