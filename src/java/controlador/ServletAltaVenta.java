/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Utilidades.Util;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tamara.Disco;
import tamara.ExcepcionTamara;
import tamara.Tamara;
import tamara.Venta;

/**
 *
 * @author usuario
 */
public class ServletAltaVenta extends HttpServlet {

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
        if(listaErrores == null) {
            try {
                Tamara t= new Tamara();
                Venta v = new Venta();
                Disco d = new Disco();
                v.setNombreCliente(request.getParameter("nombreCliente"));
                v.setApellidoCliente(request.getParameter("apellidoCliente"));
                v.setDni(request.getParameter("dni"));
                v.setCiudadDomicilio(request.getParameter("ciudadDomicilio"));
                v.setFormaPago(request.getParameter("formaPago"));
                d.setDiscoId(Integer.parseInt(request.getParameter("discoId")));
                v.setDisco(d);
                t.insertarVenta(v);
                request.setAttribute("mensaje", "La inserción de venta se ha realizado correctamente");
                request.getRequestDispatcher("listaventas.jsp").forward(request,response);    
            
            } catch (ExcepcionTamara ex) {
                listaErrores.add(ex.getMensajeErrorUsuario());
                request.setAttribute("mensaje","La inserción de la venta no se ha podido realizar. Errores detectados: "); 
                request.setAttribute("listaErrores", listaErrores);
                request.getRequestDispatcher("altaventa.jsp").forward(request,response);
            }
            }else{
                request.setAttribute("mensaje","La inserción de la venta no se ha podido realizar. Errores detectados: "); 
                request.setAttribute("listaErrores", listaErrores);
                request.getRequestDispatcher("altaventa.jsp").forward(request,response);
            }
        
        }
      
    

    private ArrayList<String> validarFormulario(HttpServletRequest request) {
        ArrayList<String> listaErrores = new ArrayList();
        if(request.getParameter("nombreCliente") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("nombreCliente").length() == 0) listaErrores.add("El nombre es obligatorio");
        else if(request.getParameter("nombreCliente").length() < 3) listaErrores.add("La longitud del nombre debe ser mayor 2");
        
        if(request.getParameter("apellidoCliente") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("apellidoCliente").length() == 0) listaErrores.add("El apellido es obligatorio");
        else if(request.getParameter("apellidoCliente").length() < 3) listaErrores.add("La longitud del apellido debe ser mayor 2");
        
        if(request.getParameter("dni") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("dni").length() == 0) listaErrores.add("El dni es obligatorio");
        else if(request.getParameter("dni").length() != 9) listaErrores.add("La longitud del dni debe ser 9");
        
        if(request.getParameter("formaPago") == null) listaErrores.add("La forma de pago es obligatoria");
                 
        if(request.getParameter("discoId") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("discoId").length() == 0) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("discoId").equals("0")) listaErrores.add("El disco es obligatorio");
        else if(!Util.esEntero(request.getParameter("discoId"))) listaErrores.add("Acceso no autorizado");
        
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
