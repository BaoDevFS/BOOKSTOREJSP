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

@WebServlet("/Admin/PackageCartEdit")
public class PackageCartEdit extends HttpServlet {
    String id;
    GetConnectDatabase getConnect;
    Connection con ;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    public PackageCartEdit(){
         getConnect= new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

//        String name = (String) request.getAttribute("name");
//        try {
//            con = getConnect.getConnectionSql();
//        Statement statement = con.createStatement();
//        String sql = "INSERT INTO booktypes(name) values ("+name+")where id="+id;
//        int a=statement.executeUpdate(sql);
//        if(a>0){
//            request.setAttribute("status",SIGNIN_SUCCESS);
//        }else{
//            request.setAttribute("status",EMAIL_EXITS);
//        }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            response.sendRedirect(request.getContextPath()+"/Error404");
//        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        id = request.getParameter("id");
        request.setAttribute("status",NOTHING);
        try {
            Connection con2 = getConnect.getConnectionSql();
//            Statement st2 = con2.createStatement();
            String sql2 = "SELECT * FROM booktypes where booktypes.id=?";
            PreparedStatement pre1 = con2.prepareStatement(sql2);
            pre1.setString(1,id);
            ResultSet rs1 = pre1.executeQuery();
//            ResultSet rs = st2.executeQuery(sql2);
            request.setAttribute("booktype",rs1);
//            response.getWriter().write(pre1.toString());
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/packageCartEdit.jsp");
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }
}