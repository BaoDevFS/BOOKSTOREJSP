package vn.edu.nlu.servletad;

import com.google.gson.Gson;
import vn.edu.nlu.control.GetProduct;
import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.ProductJsonObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/AjaxBooking")
public class AjaxBooking extends HttpServlet {

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
        GetProduct getProduct = new GetProduct();
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        try {
            ArrayList<Books> products = getProduct.getAllProduct();
            ProductJsonObject productJson = new ProductJsonObject();
            productJson.setProducts(products);
            String json = gson.toJson(productJson);
            out.print(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
