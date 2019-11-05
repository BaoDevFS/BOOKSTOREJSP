package vn.edu.nlu.git.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class GetConnectDatabase {
    public Connection getConnectionSql() throws SQLException {
        String hostName ="localhost";
        String dbName ="bqg";
        String userName="root";
        String password="special45";
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName;
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }
}
