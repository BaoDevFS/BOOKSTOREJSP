package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.control.RSAFile;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.dao.GetBooking;
import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.Orders;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

@WebServlet("/VerifyOrder")
public class VerifyOrder extends HttpServlet {
    private GetConnectDatabase connectDatabase;
    private Connection connection;
    private GetBooking getBooking;
    private Gson gson;
    private RSAFile rsaFile;

    public VerifyOrder() {
        connectDatabase = new GetConnectDatabase();
        getBooking = new GetBooking();
    }

    private boolean checkSignature(int idOrder, String publicKey, String sign) {
        Orders orders = getBooking.getBooking(idOrder);
        gson = new Gson();
        String json = gson.toJson(orders);
        System.out.println(json);
        rsaFile = new RSAFile();
        PublicKey pub;
        try {
            pub = rsaFile.getPublicKey(publicKey);
            Signature signature = Signature.getInstance("SHA256withRSA");
            signature.initVerify(pub);
            signature.update(json.getBytes());
            return signature.verify(Base64.getDecoder().decode(sign));
        } catch (NoSuchAlgorithmException | InvalidKeyException | SignatureException e) {
            e.printStackTrace();
            return false;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String signature = ValidateParameter.validateParameter(request, "signature");
        String otp = ValidateParameter.validateParameter(request, "otp");
        System.out.println(signature);
        try {
            connection = connectDatabase.getConnectionSql();
            HttpSession session = request.getSession();
            String sql2 = "SELECT d.id , u.public_key from orders d JOIN users u ON d.id_user = u.id where d.id_user=? AND d.active=0 AND u.otp=? ORDER BY d.created_at DESC LIMIT 1";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, ((Users) session.getAttribute("user")).getId());
            ps2.setString(2,otp);
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int idOrder = rs.getInt(1);
                String publicKey = rs.getString(2);
                //TODO
                // kiem tra chu ki co dung hay k
                if (!checkSignature(idOrder, publicKey, signature)) {
                    request.setAttribute("status", "3");
                    request.setAttribute("mes", "Chữ kí không đúng");
                    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/verifyOrder.jsp");
                    requestDispatcher.forward(request, response);
                    return;
                }
                String sql3 = "UPDATE orders SET signature=?,active=1 where id=?";
                ps2 = connection.prepareStatement(sql3);
                ps2.setString(1, signature);
                ps2.setInt(2, idOrder);
                ps2.executeUpdate();
                session.setAttribute("cart", new Cart());
                request.setAttribute("status", "0");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/verifyOrder.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("status", "3");
                request.setAttribute("mes", "Mã OTP không đúng!");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/verifyOrder.jsp");
                requestDispatcher.forward(request, response);
                return;
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        } catch (NullPointerException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Checkout");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // kieem tra cart null thi chuyen trang gio hang
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if (cart == null || cart.getProductCart().size() == 0) {
            response.sendRedirect(request.getContextPath() + "/ShopGrid");
        } else {
            request.setAttribute("status", "2");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/verifyOrder.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}