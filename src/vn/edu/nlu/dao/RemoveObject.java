package vn.edu.nlu.dao;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

public class RemoveObject {
    GetConnectDatabase database;
    public RemoveObject(){
        database = new GetConnectDatabase();
    }
    public boolean removeUser(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM users WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    public boolean removeBooktype(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM booktypes WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    public boolean removeAuthor(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM authors WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    public boolean removeProduct(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM books WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    public boolean removeOrder(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM orders WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
    public boolean removeDiscount(String id) throws SQLException {
        Connection con = database.getConnectionSql();
        String sql="DELETE FROM discounts WHERE id="+id;
        PreparedStatement st = con.prepareStatement(sql);
        int a=st.executeUpdate();
        if(a==1){
            return true;
        }else{
            return false;
        }
    }
}
