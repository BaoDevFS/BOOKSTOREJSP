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

@WebServlet("/Admin/AuthorAll")
public class AuthorAll extends HttpServlet {
    GetConnectDatabase database;
    Connection connection;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    int level = 1;

    public AuthorAll() {
        database = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String sql = "Select * from authors";
        try {
            connection =database.getConnectionSql();
            PreparedStatement statement =connection.prepareStatement(sql);
            ResultSet resultSet= statement.executeQuery();
            request.setAttribute("list",resultSet);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/authorAll.jsp");
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath()+"/Error404");
            e.printStackTrace();
        }

    }
}