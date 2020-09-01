package vn.edu.nlu.servletad;

import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.SaveImage;
import vn.edu.nlu.control.ValidateParameter;
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
        String avatars= "";
        String sql;
        if(avatar.getSize()>0) {
            SaveImage saveImage = new SaveImage();
             avatars = PathAbsolute.getPath("admin/images/user/" + Paths.get(avatar.getName()).getFileName().toString());
            BufferedImage imghoverBuff = ImageIO.read(avatar.getInputStream());
            saveImage.saveImageForUser(imghoverBuff, Paths.get(avatar.getName()).getFileName().toString(), request);
            sql="UPDATE users set `name` =?,email=?,fullname=?,address=?,phone=?,gender=?,`group` = ?,active= ?,avatar=? where id="+id;
        }else{
            sql="UPDATE users set `name` =?,email=?,fullname=?,address=?,phone=?,gender=?,`group` = ?,active= ? where id="+id;
        }
        String firstName = ValidateParameter.validateParameter(request,"firstname");
        String fullname = ValidateParameter.validateParameter(request,"fullname");
        String moblie = ValidateParameter.validateParameter(request,"mobile");
        String gender = ValidateParameter.validateParameter(request,"gender");
        String address = ValidateParameter.validateParameter(request,"address");
//        String password = request.getParameter("password");
        String email = ValidateParameter.validateParameter(request,"email");
        String group = ValidateParameter.validateParameter(request,"group");
        String active = ValidateParameter.validateParameter(request,"active");
        try {
//            password = HashCode.hashCode(password);
            con = database.getConnectionSql();
            PreparedStatement pr = con.prepareStatement(sql);
            pr.setString(1, firstName);
            pr.setString(2,email);
            pr.setString(3,fullname);
            pr.setString(4,address);
            pr.setString(5,moblie);
            pr.setString(6,gender);
            pr.setString(7,group);
            pr.setString(8,active);
            if(avatar.getSize()>0){
                pr.setString(9,avatars);
            }
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