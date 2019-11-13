package vn.edu.nlu.control;

import vn.edu.nlu.git.database.GetConnectDatabase;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GetListProductType {
    public static ResultSet getListProductType() throws SQLException {
        GetConnectDatabase getConnectDatabase = new GetConnectDatabase();
        Connection connection = null;
        ResultSet resultSet2;
        String sql2 = "SELECT * from booktypes";
        connection = getConnectDatabase.getConnectionSql();
        Statement statement2 = connection.createStatement();
        resultSet2 = statement2.executeQuery(sql2);
        return resultSet2;
    }
}
