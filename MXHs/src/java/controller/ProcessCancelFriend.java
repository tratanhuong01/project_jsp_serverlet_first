package controller;

import StringUtil.StringCheck;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Users;

public class ProcessCancelFriend extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        UserDAO u = new UserDAO();
        String s = StringCheck.Check(request.getParameter("ID"));
        HttpSession session = request.getSession();
        Users user  = (Users)session.getAttribute("users");
        if (!s.equals("") && user != null) {
            u.cancelFriends(user.getIdUser(), s, 1);
            u.cancelFriends(s, user.getIdUser(), 2);
            response.sendRedirect("acc?ID=" + s);
        }
        else {
            
        }
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
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
