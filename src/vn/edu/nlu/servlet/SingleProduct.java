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

@WebServlet("/SingleProduct")
public class SingleProduct extends HttpServlet {
    Connection connection;
    GetConnectDatabase getConnectDatabase;

    public SingleProduct() {
        this.getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        doGet(request, response);

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        connection = null;
        String id = request.getParameter("id");

        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "SELECT id, name FROM booktypes WHERE active = 1 ";
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            ResultSet rsCategory = preparedStatement.executeQuery();
            request.setAttribute("rsCategory", rsCategory);

            sql = ("select booktypes.id,booktypes.name,count(books.quantum) from books join  booktypes ON books.id_type=booktypes.id GROUP BY booktypes.id");
            PreparedStatement preCount = connection.prepareStatement(sql);
            ResultSet rsCount = preCount.executeQuery();
            request.setAttribute("rsCount", rsCount);

            String sqlBook = "SELECT * from books where active=1 and id=?";
            PreparedStatement pre = connection.prepareStatement(sqlBook);
            pre.setInt(1, (Integer.parseInt(id)));
            ResultSet rsB = pre.executeQuery();
            rsB.next();
            String type = rsB.getString("id_type");
            rsB.beforeFirst();
            request.setAttribute("rsB", rsB);

            String sqlRelated = "SELECT * FROM BOOKS WHERE active=1 and id_type= ? LIMIT 0,10";
            PreparedStatement prRe = connection.prepareStatement(sqlRelated);
            prRe.setInt(1, Integer.parseInt(type));
            ResultSet rsRe = prRe.executeQuery();
            request.setAttribute("rsRe", rsRe);

            String sqlbSell = "Select * from books where active=1 limit 0,15";
            PreparedStatement prSell = connection.prepareStatement(sqlbSell);
            ResultSet rsSell = prSell.executeQuery();
            request.setAttribute("rsSell", rsSell);

            request.getRequestDispatcher("/Public/pages/singleProduct.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}