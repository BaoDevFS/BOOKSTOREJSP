package vn.edu.nlu.git.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnectDatabase {
    public Connection getConnectionSql() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String hostName ="localhost";
        String dbName ="bqg";
        String userName="root";
        String password="";
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName+"?useUnicode=true&characterEncoding=utf-8";
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }
}
