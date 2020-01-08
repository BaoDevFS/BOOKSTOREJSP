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
import java.sql.SQLException;

@WebServlet("/Admin/DiscountAdd")
public class DiscountAdd extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public DiscountAdd(){
        getConnectDatabase = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = ValidateParameter.validateParameter(request,"name");
        String code = ValidateParameter.validateParameter(request,"code");
        String value = ValidateParameter.validateParameter(request,"value");
        String datestart = ValidateParameter.validateParameter(request,"startday");
        String dateend = ValidateParameter.validateParameter(request,"endday");
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql ="INSERT into discounts(name,code,value,date_start,date_end,active) values (?,?,?,?,?,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1,name);
            ps.setString(2,code);
            ps.setString(3,value);
            ps.setString(4,datestart);
            ps.setString(5,dateend);
            ps.setInt(6,1);
            if(ps.executeUpdate()!=0){
                response.sendRedirect(request.getContextPath()+"/Admin/Discount");
            }else
            {
                response.sendRedirect(request.getContextPath()+"/Admin/DiscountAdd");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/discountAdd.jsp");
        requestDispatcher.forward(request,response);
    }
}