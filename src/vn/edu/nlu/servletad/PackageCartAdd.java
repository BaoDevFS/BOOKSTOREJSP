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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Admin/PackageCartAdd")
public class PackageCartAdd extends HttpServlet {
    GetConnectDatabase database;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;

    public PackageCartAdd() {
        database = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name =  request.getParameter("name");
        try {
            Connection con = database.getConnectionSql();
            String sql = "INSERT into booktypes(name,active) values (?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1,name);
            statement.setInt(2,1);
            int a = statement.executeUpdate(sql);
            if (a > 0) {
                request.setAttribute("status", SIGNIN_SUCCESS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
                requestDispatcher.forward(request, response);
            } else {
                request.setAttribute("status", EMAIL_EXITS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
//            request.setAttribute("status", EMAIL_EXITS);
//            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
//            requestDispatcher.forward(request, response);
            response.sendRedirect(request.getContextPath()+"/Error404");
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setAttribute("status", NOTHING);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
        requestDispatcher.forward(request, response);
    }
}