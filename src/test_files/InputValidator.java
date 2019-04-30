package test_files;


import java.sql.SQLException;
import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

// Must be a Singleton
public class InputValidator {

    private static InputValidator soleInstance;

    private static String username = "root";
    private static String password = "";
    // Added url suffix to fix time zone error
    // https://stackoverflow.com/questions/26515700/mysql-jdbc-driver-5-1-33-time-zone-issue
    private static String url = "jdbc:mysql://localhost:3306/booking_info?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC&useSSL=false";
    //private static Connection connection;

    public static String successMsg = "Success";
    public static String timeConflictMsg = "This booking conflicts with an existing reservation at: ";
    public static String existingBookingMsg = "Booking already registered with this email at: ";

    private InputValidator(){
    }

    public static InputValidator getInstance(){
        if (soleInstance == null){
            soleInstance = new InputValidator();
        }
        return soleInstance;
    }

    public String validateEntry(String firstName, String lastName, String email, String dateTimeStr){
        // First, check if this email is already associated with a booking
        try{
            Connection connection = getConnection();
            String query = "SELECT * FROM users WHERE email='" + email + "'";
            Statement st = connection.createStatement();
            ResultSet existing_booking = st.executeQuery(query);
            if (existing_booking.next()){
                return existingBookingMsg + existing_booking.getObject("slot").toString();
            }
        } catch (Exception e){
            e.printStackTrace();
            return "Failure";
        }

        // Next, check if this booking would overlap with an existing reservation
        try {
            Connection connection = getConnection();
            Statement st = connection.createStatement();
            ResultSet results = st.executeQuery("SELECT * FROM users");
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            Date formatted = df.parse(dateTimeStr);
            while (results.next()){
                String dateTime = results.getObject("slot").toString();
                Date entryDate = df.parse(dateTime);
                long duration = Math.abs(formatted.getTime() - entryDate.getTime());
                // Determine if two times would overlap by an hour or less
                if (TimeUnit.MILLISECONDS.toMinutes(duration) <60){
                    return timeConflictMsg + entryDate;
                }
            }
        } catch (Exception e){
            e.printStackTrace();
            return "Failure";
        }
        enterBooking(firstName, lastName, email, dateTimeStr);
        return successMsg;
    }

    public boolean deleteRecord(String email){
        try{
            Connection connection = getConnection();
            Statement st = connection.createStatement();
            st.executeUpdate("DELETE FROM users WHERE email='"+email+"'");
            return true;
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet retrieveRecord(String email){
        try{
            Connection connection = getConnection();
            Statement st = connection.createStatement();
            ResultSet resultSet= st.executeQuery("SELECT * FROM users WHERE email='" + email + "'");
            return resultSet;
        } catch (SQLException e){
            e.printStackTrace();
            return null;
        }
    }

    public Connection getConnection(){
        try {
            Class.forName("com.mysql.jdbc.Driver");
            System.out.println("Driver loaded!");
        } catch (ClassNotFoundException e) {
            throw new IllegalStateException("Cannot find the driver in the classpath!", e);
        }
        System.out.println("Connecting database...");

        try {
            return DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
        throw new IllegalStateException("Cannot connect the database!", e);
    }

    }

    public boolean enterBooking(String firstName, String lastName, String email, String dateTimeStr){
        try {
            Connection connection = getConnection();
            PreparedStatement ps = connection.prepareStatement("INSERT INTO users(email, first_name, last_name, slot) " + "VALUES (?,?,?,?)");
            ps.setString(1, email);
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setObject(4, dateTimeStr);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
            return false;
        }
        return true;
    }


}
