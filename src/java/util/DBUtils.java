package util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtils {

    public static Connection getConnection() throws ClassNotFoundException, SQLException {
        Connection conn = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String url = "jdbc:sqlserver://localhost:1433;databaseName=HealthyMeatball5;useUnicode=true;characterEncoding=UTF-8";
        conn = DriverManager.getConnection(url, "sa", "12345");
        return conn;
    }

}
