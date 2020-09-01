package vn.edu.nlu.servlet;

import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.fit.model.Cart;
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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/VerifyOrder")
public class VerifyOrder extends HttpServlet {
    private GetConnectDatabase connectDatabase;
    private Connection connection;

    public VerifyOrder() {
        connectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String signature = ValidateParameter.validateParameter(request, "signature");
        System.out.println(signature);
        try {
            connection = connectDatabase.getConnectionSql();
            HttpSession session = request.getSession();
            String sql2 = "SELECT id from orders where id_user=? AND active=0 ORDER BY created_at DESC";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, ((Users) session.getAttribute("user")).getId());
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int idOrder = rs.getInt(1);
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
                // order k co active =0 thi tra ve trang checkout
                response.sendRedirect(request.getContextPath()+"/Checkout");
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
        Cart cart =(Cart) session.getAttribute("cart");
        if(cart==null||cart.getProductCart().size()==0){
            response.sendRedirect(request.getContextPath() + "/ShopGrid");
        }else {
            request.setAttribute("status", "2");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/verifyOrder.jsp");
            requestDispatcher.forward(request, response);
        }
    }
}