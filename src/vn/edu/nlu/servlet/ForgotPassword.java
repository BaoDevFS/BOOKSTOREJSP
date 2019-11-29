package vn.edu.nlu.servlet;

import vn.edu.nlu.control.EmailUtility;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet("/ForgotPassword")
public class ForgotPassword extends HttpServlet {

    private String host;
    private String port;
    private String email;
    private String name;
    private String pass;
    public void init() {
        // reads SMTP server setting from web.xml file
//        ServletContext context = getServletContext();
//        host = context.getInitParameter("host");
//        port = context.getInitParameter("port");
//        email = context.getInitParameter("email");
//        name = context.getInitParameter("name");
//        pass = context.getInitParameter("pass");
    }

    public ForgotPassword() {
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/forgot.jsp");
        requestDispatcher.forward(request,response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

}
}