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

@WebServlet("/Admin/PackageEdit")
public class PackageEdit extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    int id;
    public PackageEdit() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        System.out.println(year);
        try {
            connection = getConnectDatabase.getConnectionSql();
            String sql="UPDATE books SET name=?,image=?,description=?,price=?,year=?,price_old=? where id="+id;
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1,name);
            pre.setString(2,"");
            pre.setString(3,description);
            pre.setString(4,price);
            pre.setInt(5,Integer.parseInt(year));
            pre.setString(6,"0");
            int a=pre.executeUpdate();
            if(a>0){
                response.sendRedirect(request.getContextPath()+"/Admin/PackageEdit?id="+id);
            }else{
                response.sendRedirect(request.getContextPath()+"/Error404");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        id= Integer.parseInt(request.getParameter("id"));
        try {
            String sql = "SELECT * FROM books  WHERE id="+id;
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
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageEdit.jsp");
        requestDispatcher.forward(request, response);
    }
}