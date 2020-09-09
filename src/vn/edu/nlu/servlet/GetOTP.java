package vn.edu.nlu.servlet;

import vn.edu.nlu.control.GetUser;
import vn.edu.nlu.control.GreneratePublicPrivateKey;
import vn.edu.nlu.control.SendMail;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
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
    GreneratePublicPrivateKey grenerateKey;

    public GetOTP() {
        getConnect = new GetConnectDatabase();
        sendMail = new SendMail();
        grenerateKey = new GreneratePublicPrivateKey();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        String code = ValidateParameter.validateParameter(request, "code");
        String type = ValidateParameter.validateParameter(request, "type");
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
                    // update public key to databaase and change key
                    if (type.equals("1")) {
                        createKey(connection, request.getSession(), response, request);
                    }
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

    public void createKey(Connection connection, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws SQLException {
        Users user = (Users) session.getAttribute("user");
        grenerateKey.generateKey(2048);
        String publickey = grenerateKey.getPrivateKey();
        //  update field old_key = public_ key
        update_Old_key(connection, user.getId());
        // update new key into public_key
        updatePublicKey(connection, user.getId(), publickey);

        String pathFilePrivateKey = grenerateKey.saveKey(publickey, user.getEmail() + "Private.key", request);
        String pathFilePublicKey = grenerateKey.saveKey(grenerateKey.getPublicKey(), user.getEmail() + "Public.key", request);

        SendMail sendMail = new SendMail();
        sendMail.sendMailChangeKey(user.getEmail(), pathFilePrivateKey, pathFilePublicKey);

    }

    private void update_Old_key(Connection connection, int userId) throws SQLException {
        String sql1 = "SELECT * FROM users WHERE id = ?";
        PreparedStatement pre = connection.prepareStatement(sql1,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        pre.setInt(1, userId);
        ResultSet rs = pre.executeQuery();
        if(rs.next()) {
            rs.updateString("old_key", rs.getString("public_key"));
            rs.updateRow();
        }

    }


    public void updatePublicKey(Connection connection, int userId, String publickey) throws SQLException {

        String sql = "Update users SET public_key=? where id=?";
        PreparedStatement pre = connection.prepareStatement(sql);
        pre.setString(1, publickey);
        pre.setInt(2, userId);
        pre.executeUpdate();
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
