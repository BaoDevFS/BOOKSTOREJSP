package vn.edu.nlu.servlet;

import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;
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
    Users user;
    public Login() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("email");
        String passWord = request.getParameter("pass");
        try {
            connection = getConnectDatabase.getConnectionSql();
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM users WHERE users.email="+"'"+userName+"'"+" AND users.passwork="+"'"+passWord+"'";
            System.out.println(sql);
            ResultSet set =statement.executeQuery(sql);
            while (set.next()){
                user = new Users();
                user.setActive(set.getInt("active"));
                user.setEmail(set.getString("email"));
                user.setPasswork(set.getString("passwork"));
            }
            set.close();
            connection.close();
            if(user!=null) {
                System.out.println("LOGIN"+user.toString());
                HttpSession session = request.getSession();
                session.setAttribute("user", user);
                response.sendRedirect(request.getContextPath() + "/Home");
            }else{
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
                requestDispatcher.forward(request,response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
        requestDispatcher.forward(request,response);
    }
}