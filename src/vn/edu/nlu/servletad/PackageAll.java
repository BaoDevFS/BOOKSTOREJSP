package vn.edu.nlu.servletad;
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
@WebServlet("/PackageAll")
public class PackageAll extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public PackageAll() {
        getConnectDatabase = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String sql = "SELECT t.id,t.image,t.name,t.price,a.name,t.id_type FROM products t JOIN book_authors b ON t.id=b.id_book JOIN authors a ON b.id_author= a.id";
        try {
            connection =getConnectDatabase.getConnectionSql();
            Statement statement =connection.createStatement();
            ResultSet resultSet= statement.executeQuery(sql);
            request.setAttribute("rs",resultSet);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAll.jsp");
        requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}