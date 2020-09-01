package vn.edu.nlu.servletad;

import vn.edu.nlu.control.ValidateParameter;
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

@WebServlet("/Admin/DiscountEdit")
public class DiscountEdit extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    int id;
    public DiscountEdit() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = ValidateParameter.validateParameter(request, "name");
        String code = ValidateParameter.validateParameter(request, "code");
        String value = ValidateParameter.validateParameter(request, "value");
        String datestart = ValidateParameter.validateParameter(request, "startday");
        String dateend = ValidateParameter.validateParameter(request, "endday");
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "UPDATE discounts set name=?,code=?,value=?,date_start=?,date_end=? where id="+id;
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, code);
            ps.setString(3, value);
            ps.setString(4, datestart);
            ps.setString(5, dateend);
            if (ps.executeUpdate() != 0) {
                response.sendRedirect(request.getContextPath() + "/Admin/Discount");
            } else {
                response.sendRedirect(request.getContextPath() + "/Admin/DiscountEdit");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        id = Integer.parseInt(ValidateParameter.validateParameter(request, "id"));
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "SELECT * from discounts where id=?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            request.setAttribute("rs",rs);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/discountEdit.jsp");
        requestDispatcher.forward(request, response);
    }
}