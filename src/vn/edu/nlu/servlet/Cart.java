package vn.edu.nlu.servlet;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

@WebServlet("/Cart")
public class Cart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        HttpSession session =request.getSession();
        vn.edu.nlu.fit.model.Cart cart = (vn.edu.nlu.fit.model.Cart) session.getAttribute("cart");
        if(cart==null){
            cart = new vn.edu.nlu.fit.model.Cart();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session =request.getSession();
        vn.edu.nlu.fit.model.Cart  cart= (vn.edu.nlu.fit.model.Cart) session.getAttribute("cart");
        if(cart==null){
            cart = new vn.edu.nlu.fit.model.Cart();
        }
        request.setAttribute("cart",cart);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/cart.jsp");
        requestDispatcher.forward(request,response);
    }
}