package vn.edu.nlu.git.database;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import java.util.Stack;

public class GetConnectDatabase implements  ConnectionPool {
    //Thong tin account truy cap db.
    private String username;
    private String password;
    // Thong tin trinh dieu khien
    private String driver;
    // Thong tin duong dan toi CSDL trong MYSQL
    private String url;
    // Ngan xep luu tru cac ket noi
    private Stack<Connection> pool;

    public GetConnectDatabase() {
        Properties p = new Properties();
        try {
            p.load(Thread.currentThread().getContextClassLoader()
                    .getResourceAsStream("database_info.properties"));
            this.username = p.getProperty("USER");
            this.password = p.getProperty("PASSWORD");
            this.url = p.getProperty("URL");
            // Thong tin chinh dieu khien
            this.driver = "com.mysql.jdbc.Driver";
            // Khoi tao Stack lưu cac connection
            this.pool = new Stack<Connection>();
            // load JDBC driver
            Class.forName(this.driver).newInstance();
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (InstantiationException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Connection getConnectionSql() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        String hostName ="localhost";
        String dbName ="book";
        String userName="root";
        String password="";
        String connectionURL = "jdbc:mysql://" + hostName + ":3306/" + dbName+"?useUnicode=true&characterEncoding=utf-8";
        Connection conn = DriverManager.getConnection(connectionURL, userName, password);
        return conn;
    }

    @Override
    public void releaseConnection(Connection connection) throws SQLException {

    }

    @Override
    public void refreshConnectionPool() {

    }
}
