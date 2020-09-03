package vn.edu.nlu.servlet;

import vn.edu.nlu.control.SendMail;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Random;

@WebServlet("/GetOTP")
public class GetOTP extends HttpServlet {
    private SendMail sendMail;
    private GetConnectDatabase getConnect;

    public GetOTP() {
        getConnect = new GetConnectDatabase();
        sendMail = new SendMail();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        String code = ValidateParameter.validateParameter(request, "code");
        System.out.println(code);
        Connection connection = null;
        try {
            String sql = "SELECT otp from users where id=?";
            connection = getConnect.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            int id = ((Users) request.getSession().getAttribute("user")).getId();
            System.out.println(id);
            pre.setInt(1, id);
            ResultSet rs = pre.executeQuery();
            PrintWriter out = response.getWriter();
            if (rs.next()) {
                if (code.equals(rs.getString(1))) {
                    String sql2 = "UPDATE users SET otp=? where id= ?";
                    pre = connection.prepareStatement(sql2);
                    pre.setString(1, "0");
                    pre.setInt(2, id);
                    pre.executeUpdate();
                    out.print("{\"mes\":\"1\"}");
                    out.flush();
                } else {
                    out.print("{\"mes\":\"0\"}");
                    out.flush();
                }
            } else {
                out.print("{\"mes\":\"0\"}");
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    private String generateOTP() {
        int leftLimit = 48; // numeral '0'
        int rightLimit = 58; // letter 'z'
        int targetStringLength = 6;
        Random random = new Random();

        String generatedString = random.ints(leftLimit, rightLimit + 1)
                .filter(i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97))
                .limit(targetStringLength)
                .collect(StringBuilder::new, StringBuilder::appendCodePoint, StringBuilder::append)
                .toString();

        return generatedString;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        try {
            // cap nhat opt xuong db
            String sql = "UPDATE users SET otp=? where id=?";
            Connection connection = getConnect.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            String otp = generateOTP();
            pre.setString(1, otp);
            // get id user from session
            pre.setInt(2, ((Users) request.getSession().getAttribute("user")).getId());
            int st = pre.executeUpdate();
            PrintWriter out = response.getWriter();
            if (st == 1) {
                sendMail.sendOtp(((Users) request.getSession().getAttribute("user")).getEmail(), otp);
                out.print("{\"mes\":\"1\"}");
                out.flush();
            } else {
                out.print("{\"mes\":\"0\"}");
                out.flush();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
