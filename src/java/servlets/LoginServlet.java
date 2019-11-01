/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.impl.AccountController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import models.Account;
import tools.HibernateUtil;

/**
 *
 * @author Rezaditya
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/loginservlet"})
public class LoginServlet extends HttpServlet {

  private AccountController ac = new AccountController(HibernateUtil.getSessionFactory());

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    response.sendRedirect("index.jsp");
  }

  // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
  /**
   * Handles the HTTP <code>GET</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {
    processRequest(request, response);
  }

  /**
   * Handles the HTTP <code>POST</code> method.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
          throws ServletException, IOException {

    String email = request.getParameter("inputEmail" + "");
    String password = request.getParameter("inputPassword" + "");

    Account account;
    
    if (ac.login(email, password)) {
      account = ac.getByEmail(email);
      if (account.getStatus().getId() < 0) {
        try (PrintWriter out = response.getWriter()) {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Verify your account first');");
          out.println("location='login.jsp';");
          out.println("</script>");
        }
      } else if (account.getStatus().getId() == 3) {
        try (PrintWriter out = response.getWriter()) {
          out.println("<script type=\"text/javascript\">");
          out.println("alert('Your account have been locked. Please reset your password first to login.');");
          out.println("location='forgot_password.jsp';");
          out.println("</script>");
        }
      } else {
        //Login NORMAL
        //Start session ----------
        HttpSession session = request.getSession();
        session.setAttribute("user", "REZADITYA-setAttribute");
        //setting session to expiry in 30 mins
        session.setMaxInactiveInterval(30 * 60);
        Cookie userName = new Cookie("user", email);
        userName.setMaxAge(30 * 60);
        response.addCookie(userName);
        //next session ---- to index.jsp
        
        ac.updateStatus(account.getEmployeeId() + "", account.getEmail(), account.getPassword(), account.getToken(), "0");
        processRequest(request, response);
      }
    } else {
      account = ac.getByEmail(email);
      int status = (int) (long) account.getStatus().getId();
      if (status >= 0) {
        status++;
        ac.updateStatus(account.getEmployeeId() + "", account.getEmail(), account.getPassword(), "", status + "");
        if (status > 2) {
          try (PrintWriter out = response.getWriter()) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Your account have been locked. Forgot password for recovery');");
            out.println("location='forgot_password.jsp';");
            out.println("</script>");
          }
        }
      }
      try (PrintWriter out = response.getWriter()) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('User or password incorrect');");
        out.println("location='login.jsp';");
        out.println("</script>");
      }

    }
  }

  /**
   * Returns a short description of the servlet.
   *
   * @return a String containing servlet description
   */
  @Override
  public String getServletInfo() {
    return "Short description";
  }// </editor-fold>

}
