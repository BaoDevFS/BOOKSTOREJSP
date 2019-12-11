package vn.edu.nlu.servletad;

import vn.edu.nlu.control.ValidateParameter;
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
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin/Login")
public class Login extends HttpServlet {
    GetConnectDatabase database;
    Connection connection;
    public Login(){
        database = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = ValidateParameter.validateParameter(request,"email");
        String password= ValidateParameter.validateParameter(request,"password");
        try {
            connection = database.getConnectionSql();
            String sql ="SELECT * from users where email=? and password=? and `group` =? and active= 1";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1,email);
            pr.setString(2,password);
            pr.setInt(3,1);
            ResultSet st= pr.executeQuery();
            Users admin = new Users();
            if (st.next()){
                admin.setEmail(st.getString("email"));
                admin.setFullname(st.getString("fullname"));
                admin.setAvatar(st.getString("avatar"));
                admin.setGroup(st.getInt("group"));
            }
            st.close();
            connection.close();
            if (admin.getEmail() != null ) {
                System.out.println("LOGINADMIN");
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                String url = (String) session.getAttribute("urlAd");
                if(url==null) {
                    response.sendRedirect(request.getContextPath() + "/Admin/Index");
                }else {
                    session.removeAttribute("urlAd");
                    response.sendRedirect(url);
                }
            } else {
                request.setAttribute("status",1);
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/login.jsp");
                requestDispatcher.forward(request,response);
            }
        } catch (SQLException e) {
            response.sendRedirect(request.getContextPath()+"/Error404");
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("status",0);
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/login.jsp");
        requestDispatcher.forward(request,response);
    }
}