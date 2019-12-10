package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.Cart;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/AjaxCart")
public class AjaxCart extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        if(cart==null){
            cart = new Cart();
        }
        String id = request.getParameter("id");
        String quantity = request.getParameter("quantity");
        if(id==null){
            // request from cart.jsp
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            String json = gson.toJson(cart);
            out.print(json);
        }else {
            //request from home.jsp
            if(quantity==null){
                //add product to cart
                cart.addProductCart(Integer.parseInt(id),0);
            }else{
                // modifi product in cart
                cart.addProductCart(Integer.parseInt(id),Integer.parseInt(quantity));
            }
            // subbmit to session
            session.setAttribute("cart",cart);
        }
    }
}
