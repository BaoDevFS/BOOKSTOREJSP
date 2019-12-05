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
    String id_page;

    public ShopGrid() {
        this.getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        requestDispatcher.forward(request,response);
//        connection = null;
//        id_page = request.getParameter("page");
        String type = request.getParameter("type");
//        String search = request.getParameter("selectSearch");
        String page = request.getParameter("page");
//        response.getWriter().println(page);
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

<<<<<<< HEAD
            connection = getConnectDatabase.getConnectionSql();
            sql = "SELECT * FROM books WHERE active = 1";
            if (type != null) sql += " and id_type = " + type;
            PreparedStatement pre1 = connection.prepareStatement(sql);
            ResultSet rs1 = pre1.executeQuery();
            request.setAttribute("rs1", rs1);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/shopGrid.jsp");
            requestDispatcher.forward(request, response);
=======
            sql = "select * from books WHERE active = 1 ";



            if (idType != 0) {
                sql += "and id_type= " + idType;
            }
//            else if(search != null) {
//                sql += " and search =" + search;
//            }
            PreparedStatement pst2 = connection.prepareStatement(sql);

//            response.getWriter().println(sql);

            ResultSet book = pst2.executeQuery();
            book.last();
            int rows = book.getRow();
            book.beforeFirst();
//            System.out.println("gjhjhiu" + rows);

            int nOfPages = rows / 9;

            if (nOfPages % 9 > 0) {
                nOfPages++;
            }
            System.out.println(nOfPages);


            request.setAttribute("book", book);
            request.setAttribute("currentPage", pageNum);
            request.setAttribute("nOfPages", nOfPages);
            request.setAttribute("idType", idType);

            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/shopGrid.jsp");
            requestDispatcher.forward(request, response);


>>>>>>> 1fc8c3e59c03194effa2fb1620601d684218d7c6
        } catch (SQLException e) {
            e.printStackTrace();

        }
//        try {
////            connection = getConnectDatabase.getConnectionSql();
////            String sql = "SELECT id, name FROM booktypes WHERE active = 1";
////            PreparedStatement pre = connection.prepareStatement(sql);
////            ResultSet rs = pre.executeQuery();
////            request.setAttribute("rs", rs);
//
//            connection = getConnectDatabase.getConnectionSql();
//            sql = ("select booktypes.id,booktypes.name,SUM(books.quantum) from books join  booktypes ON books.id_type=booktypes.id GROUP BY booktypes.id");
//            PreparedStatement preCount = connection.prepareStatement(sql);
//            ResultSet rsCount = preCount.executeQuery();
//            request.setAttribute("rsCount", rsCount);
//
//            connection = getConnectDatabase.getConnectionSql();
//            sql = "SELECT * FROM books WHERE active = 1";
//            if (type != null) sql += " and id_type = " + type;
//            PreparedStatement pre1 = connection.prepareStatement(sql);
//            ResultSet rs1 = pre1.executeQuery();
//            request.setAttribute("rs1", rs1);
//            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/shopGrid.jsp");
//            requestDispatcher.forward(request, response);
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
    }

}
