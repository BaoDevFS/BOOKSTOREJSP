package vn.edu.nlu.servlet;

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
@WebServlet("/Login")
public class Login extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public Login() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("email");
        String passWord = request.getParameter("pass");
        Users user;
        try {
            connection = getConnectDatabase.getConnectionSql();
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM users WHERE users.email="+"'"+userName+"'"+" AND users.password="+"'"+passWord+"'"+"AND users.active=1";
            System.out.println(sql);
            ResultSet set =statement.executeQuery(sql);
            user= new Users();
            while (set.next()){
                System.out.println("user");
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setPasswork(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAddress(set.getString("address"));
                user.setPhone(set.getString("phone"));
                user.setActive(set.getInt("active"));
            }
            set.close();
            connection.close();
                System.out.println(user.toString());
                if (user.getEmail() != null && user.getPasswork() != null) {
                    System.out.println("LOGIN" + user.toString());
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/Home");
                } else {
                    request.setAttribute("status",1);
                    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
                    requestDispatcher.forward(request, response);
                }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("status",1);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status",0);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
        requestDispatcher.forward(request,response);
    }
}