package vn.edu.nlu.control;

import vn.edu.nlu.fit.model.Users;

import javax.servlet.http.HttpSession;

public class GetUser {
    public static Users getUser(HttpSession session){
        return (Users) session.getAttribute("admin");
    }
}
