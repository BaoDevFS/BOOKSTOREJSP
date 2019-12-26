package vn.edu.nlu.servlet;

import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Contact")
public class Contact extends HttpServlet {
    GetConnectDatabase getConnect;
    Connection connection;

    public Contact() {
        getConnect = new GetConnectDatabase();

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firtName = ValidateParameter.validateParameter(request, "firstname");
        String lastName = ValidateParameter.validateParameter(request, "lastname");
        String email = ValidateParameter.validateParameter(request, "email");
        String website = ValidateParameter.validateParameter(request, "website");
        String subject = ValidateParameter.validateParameter(request, "subject");
        String message = ValidateParameter.validateParameter(request, "message");
        try {
            connection = getConnect.getConnectionSql();
            String sql = "INSERT INTO contacts(firstName,lastName,email,message,active,website,subject) values(?,?,?,?,?,?,?)";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, firtName);
            pre.setString(2, lastName);
            pre.setString(3, email);
            pre.setString(4, message);
            pre.setInt(5, 1);
            pre.setString(6, website);
            pre.setString(7, subject);
            int status = pre.executeUpdate();
            if (status == 1) {
                response.getWriter().write("Send success");
            } else {
                response.getWriter().write("Send message not success! Try again.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getServletContext()+"/Error404");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/contact.jsp");
        requestDispatcher.forward(request, response);
    }
}