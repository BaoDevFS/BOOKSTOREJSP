package vn.edu.nlu.servlet;

import vn.edu.nlu.control.GreneratePublicPrivateKey;
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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    Users user;
    GreneratePublicPrivateKey grenerateKey;

    public Register() {
        getConnectDatabase = new GetConnectDatabase();
        grenerateKey = new GreneratePublicPrivateKey();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String userName = request.getParameter("username") == null ? "" : request.getParameter("username");
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        String email = request.getParameter("email") == null ? "" : request.getParameter("email");
        String phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");
//        try {
//            password = HashCode.hashCode(password);
//        } catch (NoSuchAlgorithmException e) {
//            e.printStackTrace();
//        }
        if (password == "" || repassword == "") {
            System.out.println(password + "==" + repassword);
            request.setAttribute("message", "Password invalid!");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        if (!password.equals(repassword)) {
            System.out.println(password + "!=" + repassword);
            request.setAttribute("message", "Repassword not same!");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        try {
            password = HashCode.hashCode(password);
            user = new Users(userName, email, password, phone);
            boolean isExistEmail = checkRegister_email(email);
            if (isExistEmail) {
                request.setAttribute("message", "Email already exit!");
                RequestDispatcher rp = getServletContext().getRequestDispatcher("/Public/pages/register.jsp");
                rp.forward(request, response);
            } else {
                grenerateKey.generateKey(2048);
                String pathFilePrivateKey = grenerateKey.saveKey(grenerateKey.getPrivateKey(), user.getEmail() + "Private.key", request);
                String pathFilePublicKey = grenerateKey.saveKey(grenerateKey.getPublicKey(),user.getEmail()+"Public.key",request);
                if (register(user,grenerateKey.getPublicKey())) {
                    SendMail sendMail = new SendMail();
                    sendMail.sendMailVerify(user.getEmail(),pathFilePrivateKey,pathFilePublicKey);
                    response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                            "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Check email verify acccount!</h6>\n" +
                            "</div>");
                } else {
                    response.sendRedirect(request.getContextPath() + "/Login");
                }
            }
        } catch (IOException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
    }

    public boolean checkRegister_email(String email) {
        Connection cn = null;
        boolean result = false;
        String sql = "SELECT * FROM users WHERE users.email =?";
        try {
            cn = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = cn.prepareStatement(sql);
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
                cn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public boolean register(Users acc,String publicKey) {
        boolean result = false;
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "INSERT  INTO users (name,email,password,phone,public_key) values (? , ?, ?, ?,?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, acc.getName());
            pre.setString(2, acc.getEmail());
            pre.setString(3, acc.getPassword());
            pre.setString(4, acc.getPhone());
            pre.setString(5, publicKey);
            int i = pre.executeUpdate();
            if (i > 0) {
                result = true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return result;
    }

}
