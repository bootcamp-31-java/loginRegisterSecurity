/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import controllers.impl.RegionController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tools.HibernateUtil;

/**
 *
 * @author Aseprudin
 */
@WebServlet(name = "RegionServlet", urlPatterns = {"/regionservlet"})
public class RegionServlet extends HttpServlet {

  private RegionController rc = new RegionController(HibernateUtil.getSessionFactory());

  /**
   * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
   * methods.
   *
   * @param request servlet request
   * @param response servlet response
   * @throws ServletException if a servlet-specific error occurs
   * @throws IOException if an I/O error occurs
   */
  protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      request.getSession().setAttribute("regions", rc.getAll());
      response.sendRedirect("index.jsp");
    }

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
    String id = request.getParameter("id") + "";
    String action = request.getParameter("action") + "";
//        if (action != null) {
    if (action.equals("update")) {
      request.getSession().setAttribute("region", rc.getById(id));
    } else if (action.equals("delete")) {
      request.getSession().setAttribute("status", rc.delete(id));
    }
//        }
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
    String regionId = request.getParameter("regionId");
    String regionName = request.getParameter("regionName");
    //rc.save(regionId, regionName);

    try (PrintWriter out = response.getWriter()) {
      //if (username.equals(password)) {

      out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js\"></script>");
      out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>");
      out.println("<script>");
      out.println("$(document).ready(function (){");
      out.println("swal ( 'Saved' ,  '" + rc.save(regionId, regionName) + "' ,  'success' )");
      out.println("});");
      out.println("</script>");

      RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
      rd.include(request, response);

//      response.sendRedirect("index.jsp");
    }

//        } else {
//            out.println("<script src=\"https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/6.11.4/sweetalert2.all.js\"></script>");
//            out.println("<script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js\"></script>");
//            out.println("<script>");
//            out.println("$(document).ready(function (){");
//            out.println("swal ( 'Oops' ,  'Something went wrong!' ,  'error' )");
//            out.println("});");
//            out.println("</script>");
//            
//            RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
//            rd.include(request, response);
//        }
    processRequest(request, response);
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
