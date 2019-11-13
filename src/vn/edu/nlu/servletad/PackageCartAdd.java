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
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/Admin/PackageCartAdd")
public class PackageCartAdd extends HttpServlet {
    GetConnectDatabase database;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    int level = 1;

    public PackageCartAdd() {
        database = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name =  request.getParameter("name");
        try {
            Connection con = database.getConnectionSql();
            Statement statement = con.createStatement();
            String sql = "INSERT into booktypes(name,active) values (\"" + name + "\",1)";
            System.out.println(sql);
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
            request.setAttribute("status", EMAIL_EXITS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
            requestDispatcher.forward(request, response);
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status", NOTHING);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAdd.jsp");
        requestDispatcher.forward(request, response);
    }
}