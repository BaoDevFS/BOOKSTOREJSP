package vn.edu.nlu.servlet;

import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Faq")
public class Faq extends HttpServlet {
    Connection connection;
    GetConnectDatabase getConnectDatabase;

    public Faq() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        connection = null;
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sqlFaq = "SELECT * FROM faqs where active=1;";
            PreparedStatement preparedStatement = connection.prepareStatement(sqlFaq);
            ResultSet rsFaq = preparedStatement.executeQuery();
            request.setAttribute("rsFaq", rsFaq);

            request.getRequestDispatcher("/Public/pages/faq.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}