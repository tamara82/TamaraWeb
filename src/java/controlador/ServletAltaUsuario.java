/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import Utilidades.Util;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tamara.ExcepcionTamara;
import tamara.Tamara;
import tamara.Usuario;

/**
 *
 * @author usuario
 */
public class ServletAltaUsuario extends HttpServlet {

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
        if(listaErrores == null){
            try {
                Tamara t =new Tamara();
                Usuario u= new Usuario();
                u = t.leerUsuario(request.getParameter("nombre"));
                if(u.getContrasena().equals("")){
                    Usuario usuario= new Usuario();
                    usuario.setNombre(request.getParameter("nombre"));
                    usuario.setContrasena(Util.calcularHash(request.getParameter("contrasena")));
                    usuario.setPerfil(request.getParameter("perfil"));
                    t.insertarUsuario(usuario);
                    request.setAttribute("mensaje", "La creación del usuario se ha realizado correctamente");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }
            } catch (ExcepcionTamara ex) {
                listaErrores.add(ex.getMensajeErrorUsuario());
                request.setAttribute("mensaje","La creación del usuario no se ha podido realizar. Errores detectados: "); 
                request.setAttribute("listaErrores", listaErrores);
                request.getRequestDispatcher("altausuario.jsp").forward(request,response);
            }
        }else{
            request.setAttribute("mensaje","La inserción del disco no se ha podido realizar. Errores detectados: "); 
            request.setAttribute("listaErrores", listaErrores);
            request.getRequestDispatcher("altausuario.jsp").forward(request,response);
        }
    }
        private ArrayList<String> validarFormulario(HttpServletRequest request) {
        ArrayList<String> listaErrores = new ArrayList();
        if(request.getParameter("nombre") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("nombre").length() == 0) listaErrores.add("El nombre es obligatorio");
        else if(request.getParameter("nombre").length() < 3) listaErrores.add("La longitud del nombre debe ser mayor 2");
        
        if(request.getParameter("contrasena") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("contrasena").length() == 0) listaErrores.add("La contraseña es obligatoria");
        else if(request.getParameter("contrasena").length() < 3) listaErrores.add("La longitud de la contraseña debe ser mayor 2");
        
        if(request.getParameter("repetirContrasena") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("repetirContrasena").length() == 0) listaErrores.add("Repetir contraseña es obligatorio");
        else if(!request.getParameter("contrasena").equals(request.getParameter("repetirContrasena")) ) listaErrores.add("Contraseña y repetir cpntraseña no coinciden");
        
        if(request.getParameter("perfil") == null) listaErrores.add("Acceso no autorizado");
        else if(request.getParameter("perfil").length() == 0) listaErrores.add("La contraseña es obligatoria");
        
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
