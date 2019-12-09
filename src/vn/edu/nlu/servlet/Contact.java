package vn.edu.nlu.servlet;

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
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Contact")
public class Contact extends HttpServlet {
    Connection connection;
    GetConnectDatabase getConnectDatabase;

    public Contact() {
        this.getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        connection = null;
        try {
            String sql = "SELECT * FROM `contacts` WHERE active=1";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rsContact = preparedStatement.executeQuery();

            request.setAttribute("rsContact", rsContact);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}