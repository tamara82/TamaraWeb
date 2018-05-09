/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Utilidades.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import tamara.Disco;
import tamara.ExcepcionTamara;
import tamara.Tamara;
import tamara.Usuario;


/**
 *
 * @author usuario
 */
public class ServletAltaDisco extends HttpServlet {

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
        HttpSession ssesion = request.getSession();
        Usuario usuarioSSesion = (Usuario)ssesion.getAttribute("usuarioSesion");
        if(usuarioSSesion.getPerfil().equals("N")){
            request.setAttribute("mensaje", "Acceso no autorizado");
            request.getRequestDispatcher("listaventas.jsp").forward(request,response);
        } 
            try {
                listaErrores= validarFormulario(request);
                    if(listaErrores == null){
                        Disco d = new Disco();
                        d.setTitulo(request.getParameter("titulo"));
                        d.setAutor(request.getParameter("autor"));
                        d.setAnioPublicacion(Integer.parseInt(request.getParameter("anioPublicacion")));
                        d.setNumCanciones(Integer.parseInt(request.getParameter("numCanciones")));
                        d.setEAN(request.getParameter("ean"));
                        Tamara t =new Tamara();
                        t.insertarDisco(d);
                        request.setAttribute("mensaje", "La inserción de disco se ha realizado correctamente");
                        request.getRequestDispatcher("listadiscos.jsp").forward(request,response);
                    }else{
                        request.setAttribute("mensaje","La inserción del disco no se ha podido realizar. Errores detectados: "); 
                        request.setAttribute("listaErrores", listaErrores);
                        request.getRequestDispatcher("altadisco.jsp").forward(request,response);
                    }
            } catch (ExcepcionTamara ex) {
                listaErrores = new ArrayList(); 
                listaErrores.add(ex.getMensajeErrorUsuario());
                request.setAttribute("mensaje","La inserción del disco no se ha podido realizar. Errores detectados: "); 
                request.setAttribute("listaErrores", listaErrores);
                request.getRequestDispatcher("altadisco.jsp").forward(request,response);
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
        
        if(request.getParameter("anioPublicacion") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("anioPublicacion").length() == 0) listaErrores.add("El año de publicación es obligatorio");
        else if(request.getParameter("anioPublicacion").length() > 4) listaErrores.add("El año de publicación es de 4 cifras");
        
        if(request.getParameter("numCanciones") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("numCanciones").length() == 0) listaErrores.add("El numero de canciones es obligatorio");
        else if(Integer.parseInt(request.getParameter("numCanciones")) == 0) listaErrores.add("El numero de canciones debe ser mayor que cero");
        
        if(request.getParameter("ean") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("ean").length() == 0) listaErrores.add("El EAN es obligatorio");
        else if(request.getParameter("ean").length() != 13) listaErrores.add("El numero de digitos del EAN debe ser 13");
        
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
