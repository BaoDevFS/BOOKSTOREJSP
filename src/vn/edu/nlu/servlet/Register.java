package vn.edu.nlu.servlet;

import vn.edu.nlu.control.SendMail;
import vn.edu.nlu.dao.HashCode;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.*;


@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    Users user;

    public Register() {
        super();
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String fullName = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        try {
            password = HashCode.hashCode(password);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        try {
//            password = HashCode.hashCode(password);
            user = new Users(fullName, email,password , phone);
            user.setId(9);
            user.setActive(0);
            boolean isExistEmail = checkRegister_email(email);
            if (isExistEmail) {
                RequestDispatcher rp = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
                rp.forward(request, response);
            } else {
                if(register(user)){
                    SendMail sendMail = new SendMail(user.getEmail());
                    response.getWriter().print("Check email verify acccount");
                }else {
                    response.sendRedirect(request.getContextPath() + "/Login");
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public boolean checkRegister_email(String email) {
        boolean result = false;
        String sql = "SELECT * FROM users WHERE users.email =?";
        try {
            connection = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, email);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                result = true;
                break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public boolean register(Users acc) {
        boolean result = false;
        String sql = "INSERT INTO users(name,  email,  password,  phone) values(?, ?, ?, ?)";
        System.out.println(sql);
        try {
            connection = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1,acc.getName());
            pre.setString(2, acc.getEmail());
            pre.setString(3, acc.getPassword());
            pre.setString(4, acc.getPhone());
            int i = pre.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

}
