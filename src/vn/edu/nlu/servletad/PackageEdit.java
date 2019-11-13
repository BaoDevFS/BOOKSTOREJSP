package vn.edu.nlu.servletad;

import vn.edu.nlu.control.GetListProductType;
import vn.edu.nlu.fit.model.Products;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/PackageEdit")
public class PackageEdit extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;

    public PackageEdit() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            String sql = "SELECT t.id,t.image,t.name,t.price,a.name,t.description,t.id_type FROM products t JOIN book_authors b ON t.id=b.id_book JOIN authors a ON b.id_author= a.id WHERE t.id="+id;
            connection = getConnectDatabase.getConnectionSql();
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);
            request.setAttribute("rs", resultSet);

            ResultSet resultSet2 =GetListProductType.getListProductType();
            request.setAttribute("booktype", resultSet2);
            while (resultSet2.next()){
                if(resultSet2.getInt(1)==id){
                        request.setAttribute("nametype",resultSet2.getString(2));
                        resultSet2.beforeFirst();
                break;
                }
            }
        }catch (SQLException e){
            e.printStackTrace();
        }

        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageEdit.jsp");
        requestDispatcher.forward(request, response);
    }
}