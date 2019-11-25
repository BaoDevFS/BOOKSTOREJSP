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
import java.io.IOException;
import java.sql.*;

@WebServlet("/Home")
public class Home extends HttpServlet {
    Connection connection;
    GetConnectDatabase getConnectDatabase;

    public Home() {
        this.getConnectDatabase = new GetConnectDatabase();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        HttpSession httpSession = request.getSession();
//        Users users = (Users) httpSession.getAttribute("user");
//        if (users != null) {
//            System.out.println(users.toString());
//        }
//        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/Home.jsp");
//        requestDispatcher.forward(request, response);
        connection = null;
        try {

            connection = getConnectDatabase.getConnectionSql();
            String sql = "Select * from books where active=1";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            request.setAttribute("rsHome", resultSet);
            request.getRequestDispatcher("/Public/pages/Home.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}