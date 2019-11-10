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
@WebServlet("/UserAdd")
public class UserAdd extends HttpServlet {
    GetConnectDatabase database;
    int level =1;
    public UserAdd(){
        database  = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String moblie = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String city = request.getParameter("city");
        String country = request.getParameter("country");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String confirmemail = request.getParameter("confirmemail");
        try {
            Connection connection = database.getConnectionSql();
            Statement statement =connection.createStatement();
            String sql ="INSERT INTO users(id,fullname,gender, email)\n" +
                    "VALUES()" ;
            int status =statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
        requestDispatcher.forward(request,response);
    }
}