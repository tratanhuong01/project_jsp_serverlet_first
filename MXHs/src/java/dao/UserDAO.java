package dao;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Calendar;
import model.Avatar;
import java.util.Date;
import java.util.List;
import model.Ads;
import model.Users;

public class UserDAO {
    private DAO dao = new DAO();
    public List<Ads> getAds() {
        List<Ads> listAds = new ArrayList<>();
        try (Connection conn = dao.openConnection()){
            String query = "SELECT * FROM Ads ORDER BY TimeCreated DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Ads a = new Ads(rs.getString(1), rs.getString(2), 
                        rs.getString(3), rs.getString(4), rs.getString(5));
                listAds.add(a);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return listAds;
    }
    public String countUser() {
        String s = "";
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT TOP 1 IDUser FROM Users ORDER BY IDUser DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = rs.getString(1);
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public String countPost() {
        String s = "";
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT TOP 1 IDPost FROM POST ORDER BY IDPost DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = rs.getString(1);
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public String countIDImage() {
        String s = "";
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT TOP 1 IDImage FROM ImagesUser ORDER BY IDImage DESC";
            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                s = rs.getString(1);
            }
            return s;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return s;
    }

    public boolean addAvatar(String s, String idUser, String imgBia) {
        try (Connection conn = dao.openConnection()) {
            String query = "UPDATE Users SET " + imgBia + " = ? WHERE IDUser = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, s);
            ps.setString(2, idUser);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addPost(String idpost, String iduser, String content, String idimage) {
        try (Connection conn = dao.openConnection()) {
            String query = "INSERT INTO POST(IDPost ,IDUser,Content,IDImage,IDLove)"
                    + " VALUES(?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idpost);
            ps.setString(2, iduser);
            ps.setString(3, content);
            ps.setString(4, idimage);
            ps.setString(5, idpost);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addImagesPost(String idImg, String idUser, String linkImg, String isavatar) {
        try (Connection conn = dao.openConnection()) {
            String query = "INSERT INTO ImagesUser(IDImage ,IDUser,LinkImage,TimeAdded,IsAvatar)"
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

    public boolean RegisterAccount(String firstName, String lastName, String phone, String email, String pass, String sex, String date) {
        int idUser = Integer.parseInt(countUser());
        idUser += 1;
        Calendar calendar = Calendar.getInstance();
        java.util.Date currentTime = calendar.getTime();
        long time = currentTime.getTime();

        try (Connection conn = dao.openConnection()) {
            String query = "INSERT INTO Users(IDUser ,Ho,Ten,SoDienThoai,Email,PassWords,Gender,DateOfBirth,LinkImageAvatar,TimeCreateAccount)"
                    + " VALUES(?,?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, String.valueOf(idUser));
            ps.setString(2, firstName);
            ps.setString(3, lastName);
            ps.setString(4, phone);
            ps.setString(5, email);
            ps.setString(6, pass);
            ps.setString(7, sex);
            ps.setString(8, date);
            ps.setString(9, Avatar.imgDefault);
            ps.setTimestamp(10, new Timestamp(time));
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean loginAccount(String emailOrPhone, String pass) {
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT * From Users "
                    + "WHERE ( Email = ? OR SoDienThoai = ? OR IDUser = ? ) AND PassWords = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, emailOrPhone);
            ps.setString(2, emailOrPhone);
            ps.setString(3, emailOrPhone);
            ps.setString(4, pass);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public Users getUserByEmailorPhone(String emailOrPhone) {
        Users users = null;
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT * FROM Users WHERE Email = ? OR SoDienThoai = ? OR IDUser = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, emailOrPhone);
            ps.setString(2, emailOrPhone);
            ps.setString(3, emailOrPhone);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
            }
            return users;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public ArrayList getUsersRequestById(String id) {
        ArrayList list = new ArrayList();
//        try (Connection conn = dao.openConnection()) {
//            String query = "SELECT IDRequest FROM FriendWithUser INNER JOiN Users "
//                    + "ON Users.IDUser = FriendWithUser.IDUser WHERE Users.IDUser = ? AND FriendWithUser.States = 2 ";
//            PreparedStatement ps = conn.prepareStatement(query);
//            ps.setString(1, id);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                list.add(rs.getString(1));
//            }
//            return list;
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
        return list;
    }

    public Users getUserById(String id) {
        Users users = null;
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT * FROM Users WHERE IDUser = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                users = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                        rs.getString(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
            }
            return users;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public boolean checkStateRequest(String idrequest, String iduser, int num) {
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT IDRequest From FriendWithUser WHERE IDRequest = ? AND IDUSer = ? AND States = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idrequest);
            ps.setString(2, iduser);
            ps.setInt(3, num);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean addFriends(String idUser, String idRequest, int states) {
        try (Connection conn = dao.openConnection()) {
            String query = "INSERT INTO FriendWithUser(IDUser,IDRequest,States)VALUES "
                    + "(?,?,?)  ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ps.setString(2, idRequest);
            ps.setInt(3, states);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean cancelFriends(String idUser, String idRequest, int states) {
        try (Connection conn = dao.openConnection()) {
            String query = "DELETE FROM FriendWithUser WHERE IDUser = ? AND IDRequest = ? AND States = ?";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ps.setString(2, idRequest);
            ps.setInt(3, states);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean accpFriend(String idFriend, String idUser) {
        try (Connection conn = dao.openConnection()) {
            String query = "UPDATE FriendWithUser SET IDFriend"
                    + " = ? , IDRequest = NULL , States = 3 WHERE IDUser = ? AND IDRequest = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idFriend);
            ps.setString(2, idUser);
            ps.setString(3, idFriend);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkF(String idUser, String idFriend, String s) {
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT IDFriend FROM FriendWithUser WHERE IDUSer = ? AND IDFriend = ? AND IDRequest IS NULL AND States = ? ";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ps.setString(2, idFriend);
            ps.setString(3, s);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Users> getUserByIDFriend(String idUser) {
        String[] arrIDFriend = getIDFriendsByIDUser(idUser);
        List<Users> listUser = new ArrayList<Users>();
        if (arrIDFriend.length != 0) {
            for (int i = 0; i < arrIDFriend.length; i++) {
                try (Connection conn = dao.openConnection()) {
                    String query = "SELECT * FROM Users WHERE IDUSer = ?";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, arrIDFriend[i]);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next()) {
                        Users user = new Users(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                                rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9),
                                rs.getString(10), rs.getString(11), rs.getInt(12), rs.getString(13), rs.getString(14), rs.getString(15), rs.getString(16));
                        listUser.add(user);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return listUser;
    }

    public String[] getIDFriendsByIDUser(String idUser) {
        int num = 0;
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT COUNT(*) FROM FriendWithUser WHERE IDUser = ? AND IDFriend IS NOT NULL";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                num = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        String[] arrIDFriend = new String[num];
        try (Connection conn = dao.openConnection()) {
            String query = "SELECT IDFriend FROM FriendWithUser WHERE IDUser = ? AND IDFriend IS NOT NULL";
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, idUser);
            ResultSet rs = ps.executeQuery();
            int i = 0;
            while (rs.next()) {
                arrIDFriend[i] = rs.getString(1);
                i++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return arrIDFriend;
    }

    public int countMutualFriends(String idUser, String idFriend) {
        int count = 0;
        String[] arrIDFriend = getIDFriendsByIDUser(idUser);
        if (arrIDFriend.length == 0) {
            count = 0;
        } else {
            for (int i = 0; i < arrIDFriend.length; i++) {
                try (Connection conn = dao.openConnection()) {
                    String query = "SELECT IDFriend FROM FriendWithUser WHERE "
                            + "IDUser = ? AND IDFriend IS NOT NULL AND "
                            + "IDFriend != ? AND IDFriend = ? ";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setString(1, idFriend);
                    ps.setString(2, idUser);
                    ps.setString(3, arrIDFriend[i]);
                    ResultSet rs = ps.executeQuery();
                    if (rs.next()) {
                        count++;
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return count;
    }
    public static void main(String args[]) {
        UserDAO userDAO = new UserDAO();
        System.out.println();
    }
}
