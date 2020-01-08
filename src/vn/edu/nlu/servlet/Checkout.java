package vn.edu.nlu.servlet;

import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.Cart;
import vn.edu.nlu.fit.model.ProductCart;
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
import java.util.ArrayList;

@WebServlet("/Checkout")
public class Checkout extends HttpServlet {
    GetConnectDatabase connectDatabase;
    Connection connection;
    public Checkout(){
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
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, firstName + " " + lastName);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.setString(4, address);
            ps.setInt(5, ((Users) session.getAttribute("user")).getId());
            ps.setDouble(6,((Cart) session.getAttribute("cart")).getTotalCart());
            ps.setString(7,"chua xu ly");
            ps.executeUpdate();
            String sql2 = "SELECT id from orders where id_user=? ORDER BY created_at DESC";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, ((Users) session.getAttribute("user")).getId());
            ResultSet rs = ps2.executeQuery();
            if (rs.next()) {
                int idOder = rs.getInt("id");
                String sql3 = "INSERT into detailorders (id_book, id_order,quantum,active)VALUES (?,?,?,1)";
                ps = connection.prepareStatement(sql3);
                for (ProductCart pc : (((Cart) session.getAttribute("cart")).getProductCart())) {
                    ps.setInt(1, pc.getId());
                    ps.setInt(2, idOder);
                    ps.setInt(3, pc.getQuantity());
                    ps.executeUpdate();
                }
                request.setAttribute("status","0");
                session.setAttribute("cart",new Cart());
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
                requestDispatcher.forward(request, response);
            }else{
                request.setAttribute("status","1");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
                requestDispatcher.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status","2");
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/checkout.jsp");
        requestDispatcher.forward(request, response);
    }
}