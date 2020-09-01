package vn.edu.nlu.servletad;

import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.SaveImage;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.dao.HashCode;
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
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin/UserAdd")
@MultipartConfig
public class UserAdd extends HttpServlet {
    GetConnectDatabase database;
    public static int EMAIL_EXITS=0;
    public static int SIGNIN_SUCCESS=1;
    public static int NOTHING=2;
    int level =1;
    public UserAdd(){
        database  = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        Part avatar = request.getPart("avatar");
        SaveImage saveImage = new SaveImage();
        String avatars= PathAbsolute.getPath("admin/images/user/"+ Paths.get(avatar.getName()).getFileName().toString());
        BufferedImage imghoverBuff = ImageIO.read(avatar.getInputStream());
        saveImage.saveImageForUser(imghoverBuff,Paths.get(avatar.getName()).getFileName().toString(),request);
        String firstName = request.getParameter("firstname");
        String lastName = request.getParameter("lastname");
        String moblie = request.getParameter("mobile");
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String group =request.getParameter("group");
        String password = request.getParameter("password").trim();
        String confirmpassword = request.getParameter("confirmpassword");
        String email = request.getParameter("email").trim();
        String confirmemail = request.getParameter("confirmemail");
        try {
            password = HashCode.hashCode(password);
            Connection connection = database.getConnectionSql();
            String checkeMail = "SELECT users.email FROM users WHERE email=?";
            PreparedStatement statement =connection.prepareStatement(checkeMail);
            statement.setString(1,email);
            ResultSet resultSet =statement.executeQuery();
            System.out.println(firstName+lastName+address);
            if(!resultSet.next()) {
                String sql = "INSERT INTO users(avatar,name,fullname,email,phone,gender,address,password,active,`group`)" +
                        "VALUES(?,?,?,?,?,?,?,?,?,?)";
                PreparedStatement pr = connection.prepareStatement(sql);
                pr.setString(1,avatars);
                pr.setString(2,firstName);
                pr.setString(3,firstName+lastName);
                pr.setString(4,email);
                pr.setString(5,moblie);
                pr.setString(6,gender);
                pr.setString(7,address);
                pr.setString(8,password);
                pr.setInt(9,1);
                pr.setInt(10,Integer.parseInt(group));
                int status = pr.executeUpdate();
                if(status==1) {
                    request.setAttribute("status", SIGNIN_SUCCESS);
                    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
                    requestDispatcher.forward(request, response);
                }else{
                    response.sendRedirect(request.getContextPath()+"/Error404");
                }
            }else{
                request.setAttribute("status",EMAIL_EXITS);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
                requestDispatcher.forward(request,response);
            }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            request.setAttribute("status",EMAIL_EXITS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
            requestDispatcher.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        request.setAttribute("status",NOTHING);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/userAdd.jsp");
        requestDispatcher.forward(request,response);
    }
}