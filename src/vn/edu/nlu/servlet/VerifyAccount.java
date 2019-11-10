package vn.edu.nlu.servlet;

import vn.edu.nlu.control.EnCodeBase64;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

@WebServlet("/VerifyAccount")
public class VerifyAccount extends HttpServlet {
    GetConnectDatabase connectDatabase;
    Connection connection;
    Statement statement;

    public VerifyAccount() {
        connectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String token =request.getParameter("token");
        String mail = EnCodeBase64.deCode(token);
        try {
            connection= connectDatabase.getConnectionSql();
            String changeActiveAccount ="UPDATE users SET active=1 WHERE email='"+mail+"'";
            statement = connection.createStatement();
            statement.executeUpdate(changeActiveAccount);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
