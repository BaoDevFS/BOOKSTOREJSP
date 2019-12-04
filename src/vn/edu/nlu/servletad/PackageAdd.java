package vn.edu.nlu.servletad;

import vn.edu.nlu.dao.GetListProductType;
import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.ResizeImage;
import vn.edu.nlu.control.SaveImage;
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
import java.io.*;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/Admin/PackageAdd")
@MultipartConfig
public class PackageAdd extends HttpServlet {
    GetConnectDatabase database;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    int level = 1;
    ResizeImage resizeImage;
    public PackageAdd() {
        database = new GetConnectDatabase();
       resizeImage = new ResizeImage();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        //
        SaveImage saveImage = new SaveImage();
        Part image = request.getPart("image");
        String fileNameImg=PathAbsolute.getPath("Public/images/books/"+ Paths.get(image.getSubmittedFileName()).getFileName().toString());
        System.out.println(fileNameImg);
        BufferedImage imgBuff = ImageIO.read(image.getInputStream());
        saveImage.saveImageForBook(imgBuff,Paths.get(image.getSubmittedFileName()).getFileName().toString(),request);
       //get file from form
        Part imagehover = request.getPart("imagehover");
        BufferedImage imghoverBuff = ImageIO.read(imagehover.getInputStream());

        //get path file save to server
        String fileNameImgHover=PathAbsolute.getPath("Public/images/books/"+ Paths.get(imagehover.getSubmittedFileName()).getFileName().toString());
        System.out.println(fileNameImgHover);
        //save file
        saveImage.saveImageForBook(imghoverBuff,Paths.get(imagehover.getSubmittedFileName()).getFileName().toString(),request);

        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String booktype = request.getParameter("booktype");
        String year = request.getParameter("year");
        String price = request.getParameter("price");
        String author = request.getParameter("author");
        try {
            request.setAttribute("booktype", GetListProductType.getListProductType());
            String sql = "INSERT INTO books (name, image ,image_hover,description, price, year, id_type, active,author) VALUES (? , ? , ?, ?, ?, ?, ?, ?, ?)";
            System.out.println(sql);
            Connection con = database.getConnectionSql();
            PreparedStatement pre = con.prepareStatement(sql);
            System.out.println(pre.toString());
            pre.setString(1, name);
            pre.setString(2, fileNameImg);
            pre.setString(3, fileNameImgHover);
            pre.setString(4, description);
            pre.setString(5, price);
            pre.setString(6, year);
            pre.setString(7, booktype);
            pre.setInt(8, 1);
            pre.setString(9, author);
            int a=pre.executeUpdate();
            if(a==1){
            request.setAttribute("status", SIGNIN_SUCCESS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
            requestDispatcher.forward(request, response);
            }else{
                request.setAttribute("status", EMAIL_EXITS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
                requestDispatcher.forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            request.setAttribute("status",NOTHING);
            request.setAttribute("booktype", GetListProductType.getListProductType());
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageAdd.jsp");
        requestDispatcher.forward(request, response);
    }
}