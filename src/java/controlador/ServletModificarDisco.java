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
public class ServletModificarDisco extends HttpServlet {

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
        ArrayList<String> listaErrores= validarFormulario(request);
        try {
        Disco d = new Disco();
        d.setDiscoId(Integer.parseInt(request.getParameter("discoId")));
        d.setTitulo(request.getParameter("titulo"));
        d.setAutor(request.getParameter("autor"));
        d.setAnioPublicacion(Integer.parseInt(request.getParameter("anioPublicacion")));
        d.setNumCanciones(Integer.parseInt(request.getParameter("numCanciones")));
        d.setEAN(request.getParameter("ean"));
        Tamara t= new Tamara();
            t.modificarDisco(d.getDiscoId(),d);
            request.getRequestDispatcher("listaDiscos.jsp").forward(request,response);
        } catch (ExcepcionTamara ex) {
//            Logger.getLogger(ServletAltaDisco.class.getName()).log(Level.SEVERE, null, ex);
            listaErrores.add(ex.getMensajeErrorUsuario());
        }
        if(listaErrores == null){
        request.setAttribute("mensaje", "La modificación del disco se ha realizado correctamente");
        request.getRequestDispatcher("listaDiscos.jsp").forward(request,response);
        
        }else{
        request.setAttribute("mensaje","La modificación del disco no se ha podido realizar. Errores detectados: "); 
        request.setAttribute("listaErrores", listaErrores);
        request.getRequestDispatcher("modificardisco.jsp").forward(request,response);
        }
    }
        private ArrayList<String> validarFormulario(HttpServletRequest request) {
        ArrayList<String> listaErrores = new ArrayList();
        if(request.getParameter("titulo") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("titulo").length() == 0) listaErrores.add("El titulo es obligatorio");
        else if(request.getParameter("titulo").length() < 3) listaErrores.add("La longitud del titulo debe ser mayor 2");
        
        if(request.getParameter("autor") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("autor").length() == 0) listaErrores.add("El autor es obligatorio");
        else if(request.getParameter("autor").length() < 3) listaErrores.add("La longitud del autor debe ser mayor 2");
        
        if(listaErrores.size() ==0)return null;
        else return listaErrores;
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