package vn.edu.nlu.servlet;

import vn.edu.nlu.control.ValidateParameter;
import vn.edu.nlu.dao.HashCode;
import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Login")
public class Login extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public Login() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = ValidateParameter.validateParameter(request,"email");
        String passWord = ValidateParameter.validateParameter(request,"pass");
        Users user;
        try {
            passWord = HashCode.hashCode(passWord);
            connection = getConnectDatabase.getConnectionSql();
            String sql= "select  * from  users where email=? and password=? and active=1";
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1,email);
            pre.setString(2,passWord);
            ResultSet set =pre.executeQuery();
            user= new Users();
            while (set.next()){
                user.setId(set.getInt("id"));
                user.setName(set.getString("name"));
                user.setEmail(set.getString("email"));
                user.setAvatar(set.getString("avatar"));
            }
            set.close();
            connection.close();
                if (user.getEmail() != null ) {
                    System.out.println("LOGIN User" );
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    String url = (String) session.getAttribute("url");
                    if(url==null) {
                        response.sendRedirect(request.getContextPath() + "/Home");
                    }else {
                        session.removeAttribute("url");
                        response.sendRedirect(url);
                    }
                } else {
                    request.setAttribute("status",1);
                    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
                    requestDispatcher.forward(request, response);
                }
        } catch (SQLException | NoSuchAlgorithmException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status",0);
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/login.jsp");
        requestDispatcher.forward(request,response);
    }
}