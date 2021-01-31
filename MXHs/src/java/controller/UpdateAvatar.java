package controller;

import dao.UserDAO;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import static java.lang.System.out;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.servlet.http.HttpSession;
import model.Users;
import javax.servlet.annotation.MultipartConfig;

@MultipartConfig
public class UpdateAvatar extends HttpServlet {
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    public boolean upload(InputStream is , String path,String nameFile) {
        try {
            byte[] buffer = new byte[1024];
            int length;
            FileOutputStream fos = new FileOutputStream(new File(path + nameFile));
            while ((length = is.read(buffer)) > 0) {
                fos.write(buffer, 0, length);
            }
            fos.flush();
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        Part part = request.getPart("files");
        String path = "D:\\MXHs\\web\\";
        InputStream is = part.getInputStream();
        int idPost = Integer.parseInt(new UserDAO().countPost());
        idPost++;
        int idImgPost = Integer.parseInt(new UserDAO().countIDImage());
        idImgPost++;
        HttpSession session = request.getSession();
        Users user = (Users)session.getAttribute("users");
        String id = request.getParameter("ID");
        String content = request.getParameter("content");
        UserDAO userDao = new UserDAO();
        String nameFile = "\\img\\avatarImage\\" + user.getIdUser() + String.valueOf(idImgPost) + ".jpg";
        userDao.addAvatar(nameFile,user.getIdUser(),"LinkImageAvatar");
        Users users1 = userDao.getUserById(user.getIdUser());
        session.setAttribute("users", users1);
        userDao.addImagesPost(String.valueOf(idImgPost), user.getIdUser(), nameFile, String.valueOf(1));
        upload(is, path,nameFile);
        userDao.addPost(String.valueOf(idPost), user.getIdUser(), content, String.valueOf(idImgPost));
        response.sendRedirect("acc?ID=" + user.getIdUser());
        request.getRequestURL();
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
