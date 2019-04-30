package test_files;

import java.sql.SQLException;
import java.sql.*;

public class Main {

    private static String username = "root";
    private static String password = "";
    // Added url suffix to fix time zone error
    // https://stackoverflow.com/questions/26515700/mysql-jdbc-driver-5-1-33-time-zone-issue
    private static String url = "jdbc:mysql://localhost:3306/booking_info?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
    private static Connection connection;

    public static void main(String[] args) {
//        try{
//           // Class.forName("com.mysql.jdbc.Driver");
//            connection = DriverManager.getConnection(url, username, password);
//            System.out.println(connection);
//            Statement command = connection.createStatement();
//            PreparedStatement ps = connection.prepareStatement("INSERT INTO users(user_email, user_password, user_birthday) " + "VALUES (?,?,?)");
//            // email
//            ps.setString(1, "test4@gmail.com");
//
//            // password
//            ps.setString(2, "test");
//
//            // date
//            ps.setDate(3, Date.valueOf("2005-01-01"));
//            ps.execute();
////            command.execute("INSERT INTO users VALUES ('test3@gmail.com', 'test', '2001-01-01')");
//        } catch (SQLException e ){
//            e.printStackTrace();
//        } catch (Exception e){
//
//        }

        System.out.println("Connecting database...");

        try (Connection connection = DriverManager.getConnection(url, username, password)) {
            System.out.println("Database connected!");
        } catch (SQLException e) {
            throw new IllegalStateException("Cannot connect the database!", e);
        }

    }

}
