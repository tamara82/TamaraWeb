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
import javax.servlet.ServletContext;
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
public class ServletAutenticador extends HttpServlet {

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
        ServletContext contexto = request.getServletContext();
        String uE = contexto.getInitParameter("usuarioEmergencia");
        String cE = contexto.getInitParameter("contrasenaEmergencia");
        String us = request.getParameter("usuario");
        String c = request.getParameter("contrasena");
            if(uE.equals(us)&& cE.equals(c))request.getRequestDispatcher("listaDiscos.jsp").forward(request,response);
            else{
                try {
                    String cuenta = request.getParameter("usuario");
                    String lacontrasena = Util.calcularHash(request.getParameter("contrasena"));
                    Tamara t = new Tamara();
                    Usuario u = t.leerUsuario(cuenta);
                        if(cuenta.equals("")){
                            request.setAttribute("mensaje","El usuario es obligatorio"); 
                            request.getRequestDispatcher("index.jsp").forward(request,response);
                        }else if(u==null){
                            request.setAttribute("mensaje","El usuario no existe"); 
                            request.getRequestDispatcher("index.jsp").forward(request,response);    
                        }else if(!u.getContrasena().equals(lacontrasena)){
                            request.setAttribute("mensaje", "Contraseña incorrecta");
                            request.getRequestDispatcher("index.jsp").forward(request,response);
                        }else{
                            request.setAttribute("mensaje", "Bienvenido/a");
                            request.getRequestDispatcher("listaDiscos.jsp").forward(request,response);
                        } 
                } catch (ExcepcionTamara ex) {
                    request.setAttribute("mensaje","Hola"); 
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }
        
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
