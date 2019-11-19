package vn.edu.nlu.servletad;
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
import java.sql.*;

@WebServlet("/Admin/Login")
public class Login extends HttpServlet {
    GetConnectDatabase database;
    Connection connection;
    public Login(){
        database = new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password= request.getParameter("password");
        try {
            connection = database.getConnectionSql();
            String sql ="SELECT * from users where email=? and password=? and `group` =? and active= 1";
            PreparedStatement pr = connection.prepareStatement(sql);
            pr.setString(1,email);
            pr.setString(2,password);
            pr.setInt(3,0);
            ResultSet st= pr.executeQuery();
            Users admin = new Users();
            if (st.next()){
                admin.setId(st.getInt("id"));
                admin.setFullname(st.getString("fullname"));
                admin.setName(st.getString("name"));
                admin.setEmail(st.getString("email"));
                admin.setAvatar(st.getString("avatar"));
                admin.setPasswork(st.getString("password"));
                admin.setGender(st.getString("gender"));
                admin.setAddress(st.getString("address"));
                admin.setGroup(st.getInt("group"));
                admin.setPhone(st.getString("phone"));
                admin.setActive(st.getInt("active"));
            }
            st.close();
            connection.close();
            System.out.println(admin.toString());
            if (admin.getEmail() != null && admin.getPasswork() != null) {
                System.out.println("LOGINADMIN" + admin.toString());
                HttpSession session = request.getSession();
                session.setAttribute("admin", admin);
                response.sendRedirect(request.getContextPath() + "/Admin/Index");
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