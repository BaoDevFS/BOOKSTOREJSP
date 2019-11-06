package vn.edu.nlu.servlet;
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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
@WebServlet("/Home")
public class Home extends HttpServlet {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    Users user;

    public Home() {
        getConnectDatabase = new GetConnectDatabase();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("email");
        String passWord = request.getParameter("pass");
        try {
            connection = getConnectDatabase.getConnectionSql();
            Statement statement = connection.createStatement();
            String sql = "SELECT * FROM users WHERE users.email="+"'"+userName+"'"+" AND users.passwork="+"'"+passWord+"'";
            ResultSet set =statement.executeQuery(sql);
            user = new Users();
            while (set.next()){
                user.setActive(set.getInt("active"));
                user.setEmail(set.getString("email"));
                user.setPasswork(set.getString("passwork"));
            }
            set.close();
            connection.close();
            System.out.println(user.toString());
            HttpSession session = request.getSession();
            session.setAttribute("user",user);
            response.sendRedirect(request.getContextPath()+"/Home");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/Home.jsp");
        requestDispatcher.forward(request,response);
    }
}