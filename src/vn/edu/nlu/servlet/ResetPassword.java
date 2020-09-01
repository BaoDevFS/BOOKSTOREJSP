package vn.edu.nlu.servlet;

import vn.edu.nlu.dao.GetUser;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ResetPassword")
public class ResetPassword extends HttpServlet {
    GetUser getUser;

    public ResetPassword() {
        getUser = new GetUser();
    }
    String token;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String password = request.getParameter("password");
        String rePassword = request.getParameter("abc");
        if (password == "" || rePassword == "") {
            request.setAttribute("message", "Password or Repassword invalid!");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/enterNewPassword.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        if (!password .equals(rePassword)) {
            System.out.println(password+" "+rePassword);
            request.setAttribute("message", "Repassword not same!");
            RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/enterNewPassword.jsp");
            requestDispatcher.forward(request, response);
            return;
        }
        if (token == null) {
            response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                    "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Link expired!</h6>\n" +
                    "</div>");
            return;
        } else {
            try {
                ResultSet rs = getUser.getUserByTokenResset(token);
                if (rs.next()) {
                    if (password.equals(rs.getString("password"))) {
                        request.setAttribute("message", "The new password must not be the same as the old password");
                        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/enterNewPassword.jsp");
                        requestDispatcher.forward(request, response);
                        return;
                    }
                    rs.updateString("tokenreset", null);
                    rs.updateRow();
                    rs.updateString("password",password);
                    rs.updateRow();
                    response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                            "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Set password success. <a href=\"/Login\">Click do login </a></h6>\n" +
                            "</div>");
                    return;
                } else {
                    response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                            "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Resset password fail. <a href=\"/ForgotPassword\"></a>Try Again Or Contact Admin for assistance.</h6>\n" +
                            "</div>");
                    return;
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        token = request.getParameter("token");
        if (token == null || token == "") {
            response.sendRedirect(request.getContextPath() + "/Home");
        }

        try {
            ResultSet rs = getUser.getUserByTokenResset(token);
            if (rs.next()) {
                RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/Public/pages/enterNewPassword.jsp");
                requestDispatcher.forward(request, response);
            } else {
                token = null;
                response.getWriter().write("<div style=\"width: 100%;height: 50px\">\n" +
                        "<h6 style=\"padding: 10px;text-align: center;font-size: 20px;\">Link expired!</h6>\n" +
                        "</div>");
                return;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
