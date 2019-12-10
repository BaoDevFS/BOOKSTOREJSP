package vn.edu.nlu.dao;

import vn.edu.nlu.fit.model.Booktypes;
import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BooksTypeDAO {
    GetConnectDatabase getConnectDatabase= new GetConnectDatabase();


    public ArrayList<Booktypes> getListBooktypes() {
        ArrayList<Booktypes> arr = new ArrayList<>();
        Connection cn = null;

        String sql = "select * from booktypes WHERE active = 1";
        try {
            cn = getConnectDatabase.getConnectionSql();
            PreparedStatement pre = cn.prepareStatement(sql);
            ResultSet rs = pre.executeQuery();
            while (rs.next()) {
                Booktypes s = new Booktypes();
                s.setId(rs.getInt(1));
                s.setName(rs.getString(2));
                arr.add(s);
            }
            cn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return arr;
    }

    public static void main(String[] args) {
        BooksTypeDAO bt = new BooksTypeDAO();
        ArrayList<Booktypes> l = bt.getListBooktypes();
        System.out.println(l.size());
        for (Booktypes b : l) {
            System.out.println(b.getId()+","+b.getName());
        }
    }
}
