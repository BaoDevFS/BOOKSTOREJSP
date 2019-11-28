package vn.edu.nlu.fit.model;

import java.util.ArrayList;

public class UserJsonObject {
    private ArrayList<Users> users;

    public UserJsonObject() {
    }
    public ArrayList<Users> getUsers() {
        return users;
    }

    public void setUsers(ArrayList<Users> users) {
        this.users = users;
    }

    public UserJsonObject(int totalUser, ArrayList<Users> users) {
        this.users = users;
    }
}
