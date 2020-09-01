package vn.edu.nlu.servletad;

import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin/Discount")
public class Discount extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public Discount(){
        getConnectDatabase = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "SELECT * from discounts where active=1";
            PreparedStatement pr = connection.prepareStatement(sql);
            ResultSet rs =pr.executeQuery();
            request.setAttribute("rs",rs);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/discount.jsp");
        requestDispatcher.forward(request,response);
    }
}