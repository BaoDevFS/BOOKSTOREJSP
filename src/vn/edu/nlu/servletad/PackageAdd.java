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

@WebServlet("/PackageAdd")
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
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String booktype = request.getParameter("booktype");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        try {
            request.setAttribute("booktype", GetListProductType.getListProductType());
            String sql = "INSERT INTO products (name, image ,description, price, year, id_type, active)" +
                    "VALUES(name =?,image=?,description=?,price=?,year=?,id_type=?,active=?)";
            Connection con = database.getConnectionSql();
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1, name);
            pre.setString(2, "155151");
            pre.setString(3, description);
            pre.setFloat(4, Float.parseFloat(price));
            pre.setInt(5, Integer.parseInt(year));
            pre.setString(6, booktype);
            pre.setInt(7, 1);
            pre.executeUpdate();
            request.setAttribute("status", SIGNIN_SUCCESS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("status", EMAIL_EXITS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
            requestDispatcher.forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("status",NOTHING);
            request.setAttribute("booktype", GetListProductType.getListProductType());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
        requestDispatcher.forward(request, response);
    }
}