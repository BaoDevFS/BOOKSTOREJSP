package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.ProductWishlist;
import vn.edu.nlu.fit.model.WishList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/AjaxWishList")
public class AjaxWishList extends HttpServlet {


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        vn.edu.nlu.fit.model.WishList wishlist = (vn.edu.nlu.fit.model.WishList) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new WishList();
        }
        String id = request.getParameter("id");
        if (id == null) {
            // request from cart.jsp
            PrintWriter out = response.getWriter();
            Gson gson = new Gson();
            String json = gson.toJson(wishlist);
            out.print(json);
        } else {
            for (ProductWishlist list : wishlist.getProductWishlist()) {
                if (Integer.parseInt(id) == list.getId()) {
                    PrintWriter out = response.getWriter();
                    out.write("{\"status\":\"0\"}");
                    return;
                }
            }
            wishlist.addProductWishlist(Integer.parseInt(id));
        }
        // subbmit to session
        System.out.println(wishlist.toString());
        session.setAttribute("wishlist", wishlist);
        PrintWriter out = response.getWriter();
        out.write("{\"status\":\"1\"}");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }
}