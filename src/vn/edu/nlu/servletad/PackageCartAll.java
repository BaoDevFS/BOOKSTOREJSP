package vn.edu.nlu.servletad;
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
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
@WebServlet("/Admin/PackageCartAll")
public class PackageCartAll extends HttpServlet {
    GetConnectDatabase database;
    Connection connection;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    int level = 1;

    public PackageCartAll() {
        database = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String sql = "Select * from booktypes";
        try {
            connection =database.getConnectionSql();
            Statement statement =connection.createStatement();
            ResultSet resultSet= statement.executeQuery(sql);
            request.setAttribute("list",resultSet);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAll.jsp");
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartAll.jsp");
            requestDispatcher.forward(request,response);
        }

    }
}