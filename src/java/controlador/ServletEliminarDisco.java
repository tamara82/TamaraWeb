/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tamara.Disco;
import tamara.ExcepcionTamara;
import tamara.Tamara;

/**
 *
 * @author usuario
 */
public class ServletEliminarDisco extends HttpServlet {

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
        ArrayList<String> listaErrores = null;
        try {
            Disco d = new Disco();
            d.setDiscoId(Integer.parseInt(request.getParameter("discoId")));
            Tamara t = new Tamara();
            t.eliminarDisco(d.getDiscoId());
            request.setAttribute("mensaje", "La eliminación del disco se ha realizado correctamente");
            request.getRequestDispatcher("listaDiscos.jsp").forward(request, response);
        } catch (ExcepcionTamara ex) {
            listaErrores.add(ex.getMensajeErrorUsuario());
            request.setAttribute("mensaje", "La eliminación del disco no se ha podido realizar. Errores detectados: ");
            request.setAttribute("listaErrores", listaErrores);
            request.getRequestDispatcher("eliminardisco.jsp").forward(request, response);
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
