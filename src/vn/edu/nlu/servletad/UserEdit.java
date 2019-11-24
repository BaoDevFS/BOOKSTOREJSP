package vn.edu.nlu.servletad;
import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.SaveImage;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet("/Admin/UserEdit")
@MultipartConfig
public class UserEdit extends HttpServlet {
    GetConnectDatabase database;
    Connection con;
    String id;
    public UserEdit() {
        database = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part avatar = request.getPart("avatar");
        SaveImage saveImage = new SaveImage();
        String avatars= PathAbsolute.getPath("admin/images/user/"+ Paths.get(avatar.getSubmittedFileName()).getFileName().toString());
        BufferedImage imghoverBuff = ImageIO.read(avatar.getInputStream());
        saveImage.saveImageForUser(imghoverBuff,Paths.get(avatar.getSubmittedFileName()).getFileName().toString(),request);
        String firstName = request.getParameter("firstname");
        String fullname = request.getParameter("fullname");
        String moblie = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        try {
            con = database.getConnectionSql();
            String sql="UPDATE users set name =?,email=?,fullname=?,password=?,address=?,phone=?,avatar=?,gender=?, avatar=? where id="+id;
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, firstName);
            pr.setString(2,email);
            pr.setString(3,fullname);
            pr.setString(4,password);
            pr.setString(5,address);
            pr.setString(6,moblie);
            pr.setString(7,"");
            pr.setString(8,gender);
            pr.setString(9,avatars);

            int a=pr.executeUpdate();
            System.out.println(a);
            if(a!=0){
                response.sendRedirect(request.getContextPath()+"/Admin/UserView?id="+id);
            }else {
                response.sendRedirect(request.getContextPath()+"/Admin/UserEdit?id="+id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       id = request.getParameter("id");
        try {
            con= database.getConnectionSql();
            String sql ="SELECT * from users where users.id="+id;
            PreparedStatement st = con.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            request.setAttribute("users",rs);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userEdit.jsp");
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }

    }
}