package vn.edu.nlu.servletad;

import com.google.gson.Gson;
import vn.edu.nlu.control.GetUser;
import vn.edu.nlu.fit.model.UserJsonObject;
import vn.edu.nlu.fit.model.Users;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet("/Admin/AjaxUser")
public class AjaxUser extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        response.setContentType("application/json");
        GetUser getUser = new GetUser();
        PrintWriter out = response.getWriter();
        Gson gson = new Gson();
        try {
            ArrayList<Users> users = getUser.getAllUser();
            UserJsonObject userJson = new UserJsonObject();
            userJson.setUsers(users);
            String json = gson.toJson(userJson);
            out.print(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
