package vn.edu.nlu.servlet;

import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;


@WebServlet("/Comment")
public class Comment extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rate = request.getParameter("rating");
        String id_book = request.getParameter("id");
        String name = request.getParameter("nickname");
        String review = request.getParameter("review");
        try {
            String sql = "INSERT feedbacks  VALUES (?,?,?,?,?,?,?);";
            PreparedStatement pre =  new GetConnectDatabase().getConnectionSql().prepareStatement(sql);
//            lay id bang vi tri cuoi trong db feebacks - start
            String sql_id = "SELECT COUNT(*) as sum FROM feedbacks;";
            PreparedStatement pre_id =  new GetConnectDatabase().getConnectionSql().prepareStatement(sql_id);
            ResultSet rs_id = pre_id.executeQuery();
            rs_id.first();
            int id = rs_id.getInt(1);
//            end
            pre.setInt(1,id);
            pre.setString(2,review);
            // lấy ngày hiện tại là ngày cmt
            long mili = System.currentTimeMillis();
            Date date = new Date(mili);
            pre.setString(3,name);
            pre.setString(4,date.toString());
            pre.setInt(5,Integer.parseInt(rate));
            pre.setInt(6,Integer.parseInt(id_book));
            pre.setInt(7,1);
            pre.executeUpdate();

            response.sendRedirect("http://localhost:8080/BookStore/SingleProduct?id="+id_book);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}