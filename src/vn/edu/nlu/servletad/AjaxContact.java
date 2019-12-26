package vn.edu.nlu.servletad;

import com.google.gson.Gson;
import vn.edu.nlu.fit.model.ContactJsonObject;
import vn.edu.nlu.fit.model.Contacts;
import vn.edu.nlu.git.database.GetConnectDatabase;

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
import java.util.ArrayList;

@WebServlet("/Admin/AjaxContact")
public class AjaxContact extends HttpServlet {
    GetConnectDatabase getConnect;
    Connection connection;
    public AjaxContact(){
        getConnect = new GetConnectDatabase();
    }
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
        try {
            connection= getConnect.getConnectionSql();
            String sql="SELECT * from contacts where active=1";
            PreparedStatement pre = connection.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            ArrayList<Contacts> contacts = new ArrayList<>();
            Contacts contact;
            while (rs.next()){
                contact = new Contacts();
                contact.setId(rs.getInt("id"));
                contact.setFirstname(rs.getString("firstName"));
                contact.setLastName(rs.getString("lastName"));
                contact.setEmail(rs.getString("email"));
                contact.setMessage(rs.getString("message"));
                contact.setId(rs.getInt("active"));
                contact.setSubject(rs.getString("subject"));
                contact.setWebsite(rs.getString("website"));
                contacts.add(contact);
            }
            Gson gson = new Gson();
            ContactJsonObject contactJsonObject = new ContactJsonObject();
            contactJsonObject.setContacts(contacts);
            String json = gson.toJson(contactJsonObject);
            response.getWriter().print(json);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }
}
