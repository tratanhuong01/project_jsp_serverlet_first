package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class DAO {
    private String c = "jdbc:sqlserver://localhost:";
    private String host = "1433";
    private String tenDB = "MXH";
    private String user = "sa";
    private String pass = "sa";
    public boolean addImagesPost(String idImg,String idUser, String linkImg, String isavatar) {
        int count = Integer.parseInt(new UserDAO().countIDImage());
        count++;
        try (Connection conn = openConnection()) {
            String query = "INSERT INTO POST(IDImage ,IDUser,LinkImage,TimeAdded,IsAvatar)"
                    + " VALUES(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idImg);
            ps.setString(2, idUser);
            ps.setString(3, linkImg);
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
            LocalDateTime now = LocalDateTime.now();
            ps.setString(4, dtf.format(now));
            ps.setString(5, isavatar);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    public Connection openConnection() {
        Connection conn = null;
        try {
            String driver = "com.microsoft.sqlserver.jdbc.SQLServerDriver";
            Class.forName(driver).newInstance();
            String url = c + host;
            conn = DriverManager.getConnection(url, user, pass);
            String query = "USE MXH";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.executeUpdate();
        } catch (Exception e) {
        }
        return conn;
    }
    public static void main(String args[]) {
        DAO dao = new DAO();
        dao.addImagesPost("1111111", "1000000002", "ok", String.valueOf(0));
    }
}
