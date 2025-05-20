package model;

import java.sql.Connection;
import java.sql.DriverManager;

public class DataCon {
    private Connection conn;

    public DataCon() {
        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(
                "jdbc:postgresql://localhost:5432/chatdb", // your DB URL
                "postgres", // your DB user
                "root"      // your DB password
            );
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public Connection getConn() {
        return conn;
    }
}
