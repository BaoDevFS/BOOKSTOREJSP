package vn.edu.nlu.git.database;

import java.sql.SQLException;

import java.sql.Connection;

public interface ConnectionPool {
    public Connection getConnectionSql() throws SQLException;
    //lay lii ket noi
    public void releaseConnection(Connection connection) throws SQLException;
    //lam moi pool
    public void refreshConnectionPool();
}
