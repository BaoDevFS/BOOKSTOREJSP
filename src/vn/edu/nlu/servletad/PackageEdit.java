package vn.edu.nlu.servletad;

import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.SaveImage;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.dao.GetListProductType;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin/PackageEdit")
@MultipartConfig
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
        Part avatar = request.getPart("avatar");
        String sql; String avatars="";

        if(avatar.getSize()>0) {
            SaveImage saveImage = new SaveImage();
            avatars= PathAbsolute.getPath("Public/images/books/" + Paths.get(avatar.getSubmittedFileName()).getFileName().toString());
            BufferedImage imghoverBuff = ImageIO.read(avatar.getInputStream());
            saveImage.saveImageForBook(imghoverBuff, Paths.get(avatar.getSubmittedFileName()).getFileName().toString(), request);
            sql="UPDATE books SET name=?,description=?,price=?,year=?,price_old=?,author=?,image=? where id="+id;
        }else{
            sql="UPDATE books SET name=?,description=?,price=?,year=?,price_old=?,author=? where id="+id;
        }
        String name = ValidateParameter.validateParameter(request,"name");
        String description = ValidateParameter.validateParameter(request,"description");
        String author = ValidateParameter.validateParameter(request,"author");
        String year = ValidateParameter.validateParameter(request,"year");
        String price = ValidateParameter.validateParameter(request,"price");
        String price_old= ValidateParameter.validateParameter(request,"price_old");
        try {
            connection = getConnectDatabase.getConnectionSql();
           PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1,name);
            pre.setString(2,description);
            pre.setString(3,price);
            pre.setInt(4,Integer.parseInt(year));
            pre.setString(5,price_old);
            pre.setString(6,author);
            if(avatar.getSize()>0) {
                pre.setString(7, avatars);
            }
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
        try {
            id = Integer.parseInt(request.getParameter("id"));
        }catch (NumberFormatException e){
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Admin/PackageAll");
        }
        try {
            String sql = "SELECT * FROM books  WHERE id="+id;
            connection = getConnectDatabase.getConnectionSql();
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            request.setAttribute("rs", resultSet);

            ResultSet resultSet2 =GetListProductType.getListProductType();
            request.setAttribute("booktype", resultSet2);
            resultSet.next();
            while (resultSet2.next()){
                if(resultSet2.getInt(1)==resultSet.getInt("id_type")){
                        request.setAttribute("nametype",resultSet2.getString(2));
                        resultSet2.beforeFirst();
                        resultSet.beforeFirst();
                break;
                }
            }
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageEdit.jsp");
            requestDispatcher.forward(request, response);
        }catch (SQLException e){
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }

    }
}