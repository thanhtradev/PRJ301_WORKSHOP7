/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AccountDao;
import util.Validation;

/**
 *
 * @author thanh
 */
public class registerServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String email = request.getParameter("txtemail");
            String password = request.getParameter("txtpassword");
            String fullname = request.getParameter("txtfullname");
            String phone = request.getParameter("txtphone");
            // validate
            String msg = "";
            if (!Validation.emailValidate(email))
                msg = msg + "<br/>" + Validation.emailValidateFailedMsg;
            if (!Validation.passwordValidate(password))
                msg = msg + "<br/>" + Validation.passwordValidateFailedMsg;
            if (!Validation.fullnameValidate(fullname))
                msg = msg + "<br/>" + Validation.fullnameValidateFailedMsg;
            if (!Validation.phoneNumberValidate(phone))
                msg = msg + "<br/>" + Validation.phoneNumberValidateFailedMsg;
            if (!msg.isEmpty()) {
                request.setAttribute("validateMsg", msg);
                request.getRequestDispatcher("registration.jsp").forward(request, response);
            } else {
                int status = 1;
                int role = 0;
                if (AccountDao.insertAccount(email, password, fullname, phone, status, role)) {
                    // response.sendRedirect("index.html");
                    request.setAttribute("email_newAccount", email);
                    request.getRequestDispatcher("sendOTP").forward(request, response);
                } else
                    response.sendRedirect("errorpage.html");
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the
    // + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request  servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException      if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
