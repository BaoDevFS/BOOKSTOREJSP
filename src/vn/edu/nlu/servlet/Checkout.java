package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.control.RSAFile;
import vn.edu.nlu.control.ValidateParameter;
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

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
    private GetConnectDatabase connectDatabase;
    private Connection connection;

    public Checkout() {
        connectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = ValidateParameter.validateParameter(request, "firstName");
        String lastName = ValidateParameter.validateParameter(request, "lastName");
        String address = ValidateParameter.validateParameter(request, "address");
        String phone = ValidateParameter.validateParameter(request, "phone");
        String email = ValidateParameter.validateParameter(request, "email");
        try {
            connection = connectDatabase.getConnectionSql();
            String sql = "INSERT into orders(name,phone,email,address,id_user,total,status) values (?,?,?,?,?,?,?)";
            HttpSession session = request.getSession();
            Cart cart = (Cart) session.getAttribute("cart");
            if(cart==null) cart= new Cart();
            if(cart.getProductCart().size()==0){
                request.setAttribute("status","1");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
                requestDispatcher.forward(request, response);
                return;
            }
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, firstName + " " + lastName);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setInt(5, ((Users) session.getAttribute("user")).getId());
            ps.setDouble(6, ((Cart) session.getAttribute("cart")).getTotalCart());
            ps.setString(7, "chua xu ly");
            ps.executeUpdate();
            String sql2 = "SELECT id from orders where id_user=? ORDER BY created_at DESC";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, ((Users) session.getAttribute("user")).getId());
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int idOder = rs.getInt("id");
                String sql3 = "INSERT into detailorders (id_book, id_order,quantum,active)VALUES (?,?,?,1)";
                ps = connection.prepareStatement(sql3);
                for (ProductCart pc : cart.getProductCart()) {
                    ps.setInt(1, pc.getId());
                    ps.setInt(2, idOder);
                    ps.setInt(3, pc.getQuantity());
                    ps.executeUpdate();
                }
                response.sendRedirect(request.getContextPath() + "/VerifyOrder");
            } else {
                request.setAttribute("status", "1");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status", "2");
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
        requestDispatcher.forward(request, response);
    }
}