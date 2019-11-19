package vn.edu.nlu.servletad;

import vn.edu.nlu.dao.RemoveObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/Admin/Delete")
public class Delete extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String id = request.getParameter("id");
        String type= request.getParameter("type");
        RemoveObject rm = new RemoveObject();
        switch (type){
            case "booktypes":
                try {
                    boolean status= rm.removeBooktype(id);
                    if(status){
                        response.sendRedirect(request.getContextPath()+"/Admin/PackageCartAll");
                    }
                } catch (SQLException e) {
                    response.sendRedirect(request.getContextPath()+"/Error404");
                    e.printStackTrace();
                }
                break;
            case "users":
                try {
                    boolean status= rm.removeUser(id);
                    if(status){
                        response.sendRedirect(request.getContextPath()+"/Admin/UserAll");
                    }
                } catch (SQLException e) {
                    response.sendRedirect(request.getContextPath()+"/Error404");
                    e.printStackTrace();
                }
                break;
            case "products":
                try {
                    boolean status= rm.removeProduct(id);
                    if(status){
                        response.sendRedirect(request.getContextPath()+"/Admin/PackageAll");
                    }
                } catch (SQLException e) {
                    response.sendRedirect(request.getContextPath()+"/Error404");
                    e.printStackTrace();
                }
                break;
        }

    }
}
