package vn.edu.nlu.servletad;

import vn.edu.nlu.control.GetListProductType;
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
import java.sql.Statement;

@WebServlet("/Admin/PackageAdd")
public class PackageAdd extends HttpServlet {
    GetConnectDatabase database;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    int level = 1;

    public PackageAdd() {
        database = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String booktype = request.getParameter("booktype");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        try {
            request.setAttribute("booktype", GetListProductType.getListProductType());
            String sql = "INSERT INTO products (name, image ,description, price, year, id_type, active) VALUES (? , ?, ?, ?, ?, ?, ?)";
            System.out.println(sql);
            Connection con = database.getConnectionSql();
            PreparedStatement pre = con.prepareStatement(sql);
            System.out.println(pre.toString());
            pre.setString(1, name);
            pre.setString(2, "");
            pre.setString(3, description);
            pre.setString(4, price);
            pre.setString(5, year);
            pre.setString(6, booktype);
            pre.setInt(7, 1);
            int a=pre.executeUpdate();
            if(a==1){
            request.setAttribute("status", SIGNIN_SUCCESS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
            requestDispatcher.forward(request, response);
            }else{
                request.setAttribute("status", EMAIL_EXITS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("status",NOTHING);
            request.setAttribute("booktype", GetListProductType.getListProductType());
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
        requestDispatcher.forward(request, response);
    }
}