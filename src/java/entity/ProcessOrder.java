/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package entity;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author amilb
 */
@WebServlet(name = "ProcessOrder", urlPatterns = {"/ProcessOrder"})
@MultipartConfig
public class ProcessOrder extends HttpServlet {

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
        
        boolean checkArr = false;
        ArrayList<Order> orders = (ArrayList<Order>)request.getSession().getAttribute("orders");
        ArrayList<Order> checkout = new ArrayList<>();
        int quantity = 0;
        for(int i = 0; i < orders.size(); i++){
            Object q = request.getParameter("quantity" + i);
            System.out.println("*********************"+q);
            try{
                if(Integer.parseInt(q.toString()) > 0){
                checkArr = true;
                orders.get(i).setQuantity(Integer.parseInt(q.toString()));
                checkout.add(orders.get(i));
            }
            }
            catch(Exception e)
            {
                System.out.print(e);
            }
        }
//        for(Order o: checkout){
//            System.out.println("xxxxxxxxxxxxxxx" +o);
//        }
        double totalP = 0;
        double hst = 0.15;
        for (Order o: checkout) {
        totalP += o.getMonitor().getPrice() * o.getQuantity();
        }
        double total = totalP+(totalP*hst);
        String path;
        if(checkArr == false){
            path = "/showOrders.jsp";
        }
        else{
            path = "/checkout.jsp";
            request.getSession().setAttribute("checkout", checkout);
            request.setAttribute("totalP", totalP);
            request.setAttribute("hst", total*hst);
            request.getSession().setAttribute("total", total);
        }
        RequestDispatcher dispatcher = request.getRequestDispatcher(path);
        dispatcher.forward(request, response);
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
