package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.BookMini;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/AjaxBookMini")
public class AjaxBookMini extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        PrintWriter out = response.getWriter();
        String id = request.getParameter("id");
        GetConnectDatabase getConnect = new GetConnectDatabase();
        try {
            String sql = "SELECT b.id,b.`name`,b.price ,b.description,b.image,bt.`name`from books b join booktypes bt on b.id_type=bt.id where b.id=?";
            Connection connection = getConnect.getConnectionSql();
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1,Integer.parseInt(id));
            ResultSet rs = pre.executeQuery();
            rs.next();
            BookMini bookMini = new BookMini();
            bookMini.setId(rs.getInt(1));
            bookMini.setName(rs.getString(2));
            String desc =rs.getString(4);
            if(desc==null||desc==""){
                bookMini.setDescription(desc);
            }else{
                if (desc.contains(".")){
                    bookMini.setDescription(desc.substring(0,desc.indexOf(".")));
                }else{
                    bookMini.setDescription(desc.substring(0,desc.length()/3));
                }
            }
            bookMini.setPrice(rs.getDouble(3));
            bookMini.setImage(rs.getString(5));
            bookMini.setBooktype(rs.getString(6));
            System.out.println(bookMini.toString());
            Gson gson = new Gson();
            String json = gson.toJson(bookMini);
            out.print(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
