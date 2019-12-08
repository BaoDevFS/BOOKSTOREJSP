package vn.edu.nlu.dao;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetUser {
    GetConnectDatabase getConnectDatabase;
    Connection connection;
    public GetUser(){
        getConnectDatabase = new GetConnectDatabase();
    }
    public ResultSet getUserByTokenResset(String tokenResset) throws SQLException {
        connection = getConnectDatabase.getConnectionSql();
        String sql = "SELECT * from users where tokenreset=?";
        PreparedStatement pre = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        pre.setString(1,tokenResset);
        ResultSet rs = pre.executeQuery();
        return rs;
    }
    public ResultSet getUserById(int id) throws SQLException {
        connection = getConnectDatabase.getConnectionSql();
        String sql = "SELECT * from users where id=?";
        PreparedStatement pre = connection.prepareStatement(sql,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_UPDATABLE);
        pre.setInt(1,id);
        ResultSet rs = pre.executeQuery();
        return rs;
    }
}
