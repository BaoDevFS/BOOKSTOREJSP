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
        connection = null;
        try {
            connection = getConnectDatabase.getConnectionSql();

            String sql = "SELECT c.* FROM `receiptdetails` a join `goodreceipts` b on b.id= a.id_import Join `books` c on a.id_book= c.id where (DATE(CURDATE()) - dateimport)<30; ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet resultSet = preparedStatement.executeQuery();
            request.setAttribute("rsNew", resultSet);


            String sqlAllBook = "SELECT c.* FROM  `books` c where active=1;";
            PreparedStatement preparedStatementAll = connection.prepareStatement(sqlAllBook);
            ResultSet resultSetAll = preparedStatementAll.executeQuery();
            request.setAttribute("rsAll", resultSetAll);

            String sqlBiographic = "SELECT c.* FROM  `books` c where active=1 AND id_type=1";
            PreparedStatement pBiographic = connection.prepareStatement(sqlBiographic);
            ResultSet rsBiographic = pBiographic.executeQuery();
            request.setAttribute("rsBiographic", rsBiographic);

            String sqlSale = "SELECT * FROM `books` WHERE (price_old - price >15) AND active=1;";
            PreparedStatement pSale = connection.prepareStatement(sqlSale);
            ResultSet rsSale = pSale.executeQuery();
            request.setAttribute("rsSale", rsSale);

            String sqlMystery = "SELECT c.* FROM  `books` c where active=1 AND id_type=2";
            PreparedStatement pMystery = connection.prepareStatement(sqlMystery);
            ResultSet rsMystery = pBiographic.executeQuery();
            request.setAttribute("rsMystery", rsMystery);


            request.getRequestDispatcher("/Public/pages/Home.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}