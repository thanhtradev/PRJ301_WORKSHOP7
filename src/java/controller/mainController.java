
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

/**
 *
 * @author thanh
 */
public class mainController extends HttpServlet {

    String url = "errorpage.html";

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
            String action = request.getParameter("action");
            if (null == action) {
                url = "index.jsp";
            } else {
                switch (action) {
                    case "":
                    case "search":
                        url = "index.jsp";
                        break;
                    case "login":
                        url = "loginServlet";
                        break;
                    case "register":
                        url = "registerServlet";
                        break;
                    case "logout":
                        url = "logoutServlet";
                        break;
                    case "reorder":
                        url = "reorderServlet";
                        break;
                    case "update":
                        url = "updateProfileServlet";
                        break;
                    case "addtocart":
                        url = "addToCartServlet";
                        break;
                    case "updatecart":
                        url = "updateCartServlet";
                        break;
                    case "delete":
                        url = "deleteCartServlet";
                        break;
                    case "viewcart":
                        url = "viewCart.jsp";
                        break;
                    case "saveOrder":
                        url = "saveShoppingCartServlet";
                        break;
                    case "Filter Orders":
                        url = "filterOrdersByDateServlet";
                        break;
                    case "manageAccounts":
                        url = "manageAccountServlet";
                        break;
                    case "manageOrders":
                        url = "manageOrderServlet";
                        break;
                    case "updateStatusAccount":
                        url = "updateStatusAccountServlet";
                        break;
                    case "searchAccount":
                        url = "searchAccountServlet";
                        break;
                    default:
                        break;
                }
            }
            request.getRequestDispatcher(url).forward(request, response);
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
