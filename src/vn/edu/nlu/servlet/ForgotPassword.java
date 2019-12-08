package vn.edu.nlu.servlet;

import vn.edu.nlu.control.EnCodeBase64;
import vn.edu.nlu.control.SendMail;
import vn.edu.nlu.dao.HashCode;
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


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {

    public ForgotPassword() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/forgot.jsp");
        requestDispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        SendMail sendMail = new SendMail();
        GetConnectDatabase getConnectDatabase = new GetConnectDatabase();
        try {
            Connection connection = getConnectDatabase.getConnectionSql();
            String sql = "select * from users where email=? and active=1";
            PreparedStatement pre = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
            pre.setString(1,email);
            ResultSet rs = pre.executeQuery();
            if(rs.next()){
                String pass = rs.getString("password");
                rs.updateString("tokenreset", HashCode.hashCode(email+pass));
                rs.updateRow();
                sendMail.sendMailRecoverPassWord(email,HashCode.hashCode(email+pass));
                response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                        "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Check mail to reset password.</h6>\n" +
                        "</div>");
            }else {
                request.setAttribute("message","Email not found!");
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/forgot.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

    }
}