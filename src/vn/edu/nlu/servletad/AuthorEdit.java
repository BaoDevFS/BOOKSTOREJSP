package vn.edu.nlu.servletad;

import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/Admin/AuthorEdit")
public class AuthorEdit extends HttpServlet {
    String id;
    GetConnectDatabase getConnect;
    Connection con ;
    public static int EMAIL_EXITS = 0;
    public static int SIGNIN_SUCCESS = 1;
    public static int NOTHING = 2;
    public AuthorEdit(){
         getConnect= new GetConnectDatabase();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = (String) request.getParameter("name");
        try {
            con = getConnect.getConnectionSql();
            String sql = "UPDATE authors set NAME= ? where booktypes.id =?";
            PreparedStatement pre = con.prepareStatement(sql);
            pre.setString(1,name);
            pre.setString(2,id);
            int a=pre.executeUpdate();
            System.out.println(a);
        if(a>0){
            request.setAttribute("status",SIGNIN_SUCCESS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/AuthorEdit.jsp");
            requestDispatcher.forward(request,response);
        }else{
            request.setAttribute("status",EMAIL_EXITS);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/AuthorEdit.jsp");
            requestDispatcher.forward(request,response);
        }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        id = request.getParameter("id");
        request.setAttribute("status",NOTHING);
        try {
            Connection con2 = getConnect.getConnectionSql();
//            Statement st2 = con2.createStatement();
            String sql2 = "SELECT * FROM authors where id=?";
            PreparedStatement pre1 = con2.prepareStatement(sql2);
            pre1.setString(1,id);
            ResultSet rs1 = pre1.executeQuery();
            request.setAttribute("booktype",rs1);
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/admin/pages/AuthorEdit.jsp");
            requestDispatcher.forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath()+"/Error404");
        }
    }
}