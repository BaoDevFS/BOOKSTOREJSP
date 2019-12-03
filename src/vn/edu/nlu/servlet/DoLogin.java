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
import javax.websocket.Session;
import java.io.IOException;
import java.sql.*;

@WebServlet("/DoLogin")
public class DoLogin extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    Users user;

    public DoLogin() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String userName = request.getParameter("email");
        String passWord = request.getParameter("pass");
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql ="SELECT * FROM users WHERE users.email=? and users.password=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,userName.trim());
            statement.setString(2,passWord.trim());
            ResultSet set = statement.executeQuery();
            user = new Users();
            while (set.next()) {
                user.setActive(set.getInt("active"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
            }
            set.close();
            connection.close();
            System.out.println(user.toString());
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/Home");
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        doPost(request,response);
    }
}
