package vn.edu.nlu.servletad;

import com.google.gson.Gson;
import vn.edu.nlu.control.GetProduct;
import vn.edu.nlu.dao.GetListBooking;
import vn.edu.nlu.fit.model.BookingJsonObject;
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
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        GetListBooking getListBooking = new GetListBooking();
        BookingJsonObject bookingJsonObject = new BookingJsonObject();
        bookingJsonObject.setList(getListBooking.getListBooking());
        String json = gson.toJson(bookingJsonObject);
        out.print(json);
    }
}
