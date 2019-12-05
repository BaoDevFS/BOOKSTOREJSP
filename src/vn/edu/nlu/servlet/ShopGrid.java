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

@WebServlet("/ShopGrid")
public class ShopGrid extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;

    public ShopGrid() {
        this.getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        String page = request.getParameter("page");
        int idType = 0;
        int pageNum = 1;

        try {
            idType = Integer.parseInt(type);

        } catch (Exception e) {

        }
        try {
            pageNum = Integer.parseInt(page);

        } catch (Exception e) {

        }

        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql = "SELECT id, name FROM booktypes WHERE active = 1";

            PreparedStatement pst = connection.prepareStatement(sql);

            ResultSet rs = pst.executeQuery();

            request.setAttribute("rs", rs);

            connection = getConnectDatabase.getConnectionSql();

            sql = "select * from books WHERE active = 1 ";


            if (idType != 0) {
                sql += "and id_type= " + idType;
            }
            PreparedStatement pst2 = connection.prepareStatement(sql);

            ResultSet book = pst2.executeQuery();
            book.last();
            int rows = book.getRow();
            book.beforeFirst();

            int nOfPages = rows / 12;

            if (nOfPages % 12 > 0) {
                nOfPages++;
            }
            connection = getConnectDatabase.getConnectionSql();
            sql = ("select booktypes.id,booktypes.name,SUM(books.quantum) from books join  booktypes ON books.id_type=booktypes.id GROUP BY booktypes.id");
            PreparedStatement preCount = connection.prepareStatement(sql);
            ResultSet rsCount = preCount.executeQuery();

            request.setAttribute("rsCount", rsCount);

            request.setAttribute("book", book);
            request.setAttribute("currentPage", pageNum);
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("idType", idType);

            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/shopGrid.jsp");
            requestDispatcher.forward(request, response);


        } catch (SQLException e) {
            e.printStackTrace();

        }
    }

}
