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
    public static int EMAIL_EXITS=1;
    public static int SIGNIN_SUCCESS=0;
    int level =1;
    public UserAdd(){
        database  = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String moblie = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email");
        String confirmemail = request.getParameter("confirmemail");
        try {
            Connection connection = database.getConnectionSql();
            Statement statement =connection.createStatement();
            String checkeMail = "SELECT users.email FROM users WHERE email="+"'"+email+"'";
            ResultSet resultSet =statement.executeQuery(checkeMail);
            if(!resultSet.next()) {
                String sql = "INSERT INTO users(name,fullname,email,phone,gender,address,password,active )\n" +
                        "VALUES(" + "'" + firstName + "','" + firstName + lastName + "','" + email + "','" + moblie + "','" + gender + "','" + address + "','" + password + "'," + 1 + ")";
                int status = statement.executeUpdate(sql);
                System.out.println(status);
            }else{
                request.setAttribute("error",EMAIL_EXITS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
                requestDispatcher.forward(request,response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
        requestDispatcher.forward(request,response);
    }
}