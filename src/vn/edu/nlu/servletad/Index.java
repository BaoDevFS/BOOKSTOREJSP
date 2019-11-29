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
import java.sql.*;

@WebServlet("/Admin/Index")
public class Index extends HttpServlet {
    GetConnectDatabase connectDatabase;
    Connection connection;
    public Index(){
        connectDatabase = new GetConnectDatabase();
        try {
            connection= connectDatabase.getConnectionSql();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            PreparedStatement pre = connection.prepareStatement("SELECT COUNT(id) FROM books");
            ResultSet rsBook = pre.executeQuery();
            rsBook.next();
            int countBook =rsBook.getInt(1);
            ResultSet rsUser =pre.executeQuery("SELECT COUNT(id) FROM users");
            rsUser.next();
            int countUser =rsUser.getInt(1);

            ResultSet rsBooking =pre.executeQuery("SELECT COUNT(id) FROM orders");
            rsBooking.next();
            int countBooking =rsBooking.getInt(1);
            request.setAttribute("countBook",countBook);
            request.setAttribute("countUser",countUser);
            request.setAttribute("countBooking",countBooking);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/index.jsp");
        requestDispatcher.forward(request,response);
    }
}