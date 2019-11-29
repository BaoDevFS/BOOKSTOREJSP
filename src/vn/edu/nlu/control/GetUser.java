package vn.edu.nlu.control;

import vn.edu.nlu.fit.model.Users;
import vn.edu.nlu.git.database.GetConnectDatabase;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class GetUser {
    public static Users getUser(HttpSession session){
        return (Users) session.getAttribute("admin");
    }
    public ArrayList<Users> getAllUser() throws SQLException {
        GetConnectDatabase getCon = new GetConnectDatabase();
        ArrayList<Users> users = new ArrayList<>();
        Connection connect = getCon.getConnectionSql();
        String sql ="SELECT * from users";
        PreparedStatement pr = connect.prepareStatement(sql);
        ResultSet rs = pr.executeQuery();
        Users user;
        while (rs.next()){
            user= new Users();
            user.setId(rs.getInt("id"));
            user.setName(rs.getString("name"));
            user.setFullname(rs.getString("fullname"));
            user.setEmail(rs.getString("email"));
            user.setAvatar(rs.getString("avatar"));
            user.setAddress(rs.getString("address"));
            user.setPhone(rs.getString("phone"));
            user.setPassword(rs.getString("password"));
            user.setGroup(rs.getInt("group"));
            user.setGender(rs.getString("gender"));
            user.setActive(rs.getInt("active"));
            users.add(user);
        }
        return  users;
    }
}
