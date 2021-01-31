package controller;

import StringUtil.StringCheck;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

public class ProcessRegister extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email_again = request.getParameter("email-again");
        String emailOrPhone = request.getParameter("emailOrPhone");
        String passWord = request.getParameter("passWord");
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");
        String date =  year + "-" + month + "-" + day;
        String GioiTinh = request.getParameter("GioiTinh");
        UserDAO u = new UserDAO();
        if (firstName.equals("") && lastName.equals("") && emailOrPhone.equals("")
            && passWord.equals("")) {
            request.setAttribute("errorRegister", "Các trường không được để trống");
        }
        else {
            if (StringCheck.Check(email_again).equals("")) {
                u.RegisterAccount(firstName, lastName, emailOrPhone,null , passWord,GioiTinh,date);
            }
            else {
                u.RegisterAccount(firstName, lastName, null, emailOrPhone, passWord,GioiTinh,date);
            }
            response.sendRedirect("login.jsp");
        }
        
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
