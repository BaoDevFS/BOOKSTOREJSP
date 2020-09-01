package vn.edu.nlu.servlet;

import vn.edu.nlu.control.PathAbsolute;
import vn.edu.nlu.control.SaveImage;
import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.dao.GetUser;
import vn.edu.nlu.dao.HashCode;
import vn.edu.nlu.fit.model.Users;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/UserProfile")
@MultipartConfig
public class UserProfile extends HttpServlet {
    GetUser getUser;
    int id;
    ResultSet resultSet;

    public UserProfile() {
        getUser = new GetUser();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String type = ValidateParameter.validateParameter(request,"type");
        System.out.println(type);
        System.out.println(resultSet.toString());
        if (type.equals("contact")) {
            String firstName = ValidateParameter.validateParameter(request, "name");
            String fullname = ValidateParameter.validateParameter(request, "fullname");
            String phone = ValidateParameter.validateParameter(request, "phone");
            String gender = ValidateParameter.validateParameter(request, "gender");
            System.out.println(gender+"="+fullname);
            try {
                if (resultSet.next()) {
                    resultSet.updateString("name", firstName);
                    resultSet.updateString("fullname", fullname);
                    resultSet.updateString("phone", phone);
                    resultSet.updateString("gender", gender);
                    resultSet.updateRow();
                    resultSet.beforeFirst();
                    response.getWriter().write("{\"message\":\"1\"}");
                }else {
                    response.getWriter().write("{\"message\":\"0\"}");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        else if (type.equals("address")) {
            String address = ValidateParameter.validateParameter(request, "address");
            System.out.println(address);
            try {
                if (resultSet.next()) {
                    resultSet.updateString("address", address);
                    resultSet.updateRow();
                    resultSet.beforeFirst();
                    response.getWriter().write("{\"message\":\"1\"}");
                }else {
                    response.getWriter().write("{\"message\":\"0\"}");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if(type.equals("password")) {
            String oldPassword = ValidateParameter.validateParameter(request, "oldPassword").trim();
            String newPassword = ValidateParameter.validateParameter(request, "newPassword").trim();
            String confirmPassword = ValidateParameter.validateParameter(request, "rePassword").trim();
            System.out.println(newPassword+"-"+confirmPassword);
            try {
                if (resultSet.next()) {
                    // check password same password
                    if (HashCode.hashCode(oldPassword).equals(resultSet.getString("password"))){
                        if(newPassword.equals(confirmPassword)){
                            resultSet.updateString("password",HashCode.hashCode(newPassword));
                            resultSet.updateRow();
                            resultSet.beforeFirst();
                            response.getWriter().write("{\"message\":\"Change password success\"}");
                        }else {
                            response.getWriter().write("{\"message\":\"Repassword not same new password!\"}");
                        }
                    }else {
                        response.getWriter().write("{\"message\":\"Old password not same!\"}");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }
        }
        else {
            System.out.println("avatar cahnge");
            Part avatar = request.getPart("avatar");
            System.out.println(avatar.getName());
            SaveImage saveImage = new SaveImage();
            String avatars= PathAbsolute.getPath("admin/images/user/"+ Paths.get(avatar.getName()).getFileName().toString());
            BufferedImage imghoverBuff = ImageIO.read(avatar.getInputStream());
            saveImage.saveImageForUser(imghoverBuff,Paths.get(avatar.getName()).getFileName().toString(),request);
            try {
                if (resultSet.next()) {
                    resultSet.updateString("avatar", avatars);
                    resultSet.updateRow();
                    resultSet.beforeFirst();
                    response.getWriter().write("{\"message\":\"1\"}");
                }else {
                    response.getWriter().write("{\"message\":\"0\"}");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        Users user = (Users) session.getAttribute("user");
        System.out.println(user.toString());
        id = user.getId();
        try {
            resultSet = getUser.getUserById(id);
            request.setAttribute("rs", resultSet);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/userProfile.jsp");
            requestDispatcher.forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/Error404");
        }
    }
}