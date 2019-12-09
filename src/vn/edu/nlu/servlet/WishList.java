package vn.edu.nlu.servlet;


import com.google.gson.Gson;
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

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


@WebServlet("/WishList")
public class WishList extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        HttpSession session = request.getSession();
        vn.edu.nlu.fit.model.WishList wishlist = (vn.edu.nlu.fit.model.WishList) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new vn.edu.nlu.fit.model.WishList();
        }
        String id = request.getParameter("id");
        // id == null request no thing to do response jsp
        if (id == null) {
            Gson gson = new Gson();
            String json = gson.toJson(wishlist);
            PrintWriter out = response.getWriter();
            out.print(json);
        } else {
            wishlist.removeProductWishlist(Integer.parseInt(id));
            session.setAttribute("wishlist", wishlist);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//
        HttpSession session = request.getSession();
        vn.edu.nlu.fit.model.WishList wishlist = (vn.edu.nlu.fit.model.WishList) session.getAttribute("wishlist");
        if (wishlist == null) {
            wishlist = new vn.edu.nlu.fit.model.WishList();
        }
        request.setAttribute("wishlist", wishlist);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/wishlist.jsp");
        requestDispatcher.forward(request, response);
    }
}