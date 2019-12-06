package vn.edu.nlu.servlet;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.Books;
import vn.edu.nlu.fit.model.ObjSearch;
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
import java.util.ArrayList;


@WebServlet("/Search")
public class Search extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public Search() {
        getConnectDatabase = new GetConnectDatabase();
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        String key = request.getParameter("tukhoa");
        System.out.println("key+"+key);
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql ="select * from books where name like '%"+key+"%' or author like '%"+key+"%'";
            PreparedStatement pre = connection.prepareStatement(sql);
            System.out.println(pre.toString());
            ResultSet rs = pre.executeQuery();
            ArrayList<Books> books = new ArrayList<>();
            while (rs.next()){
                books.add(new Books(rs.getInt("id"),rs.getString("name"),rs.getString("image"),rs.getDouble("price"),rs.getString("author")));
            }
            Gson gson = new Gson();
            ObjSearch ob = new ObjSearch();
            ob.setListBook(books);
            String json = gson.toJson(ob);
            response.getWriter().write(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doGet(request,response);
    }

}