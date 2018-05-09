<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Usuario"%>
        <nav>
            <ul id="nav">
                <%
                    HttpSession sesion = request.getSession();
                    Usuario usuarioSesion = (Usuario)sesion.getAttribute("usuarioSesion");
                    if(usuarioSesion == null){
                        ArrayList<String> listaErrores = new ArrayList();
                        request.setAttribute("listaErrores", listaErrores);
                        request.setAttribute("mensaje", "Acceso no autorizado");
                        request.getRequestDispatcher("index.jsp").forward(request,response);
                    }    
                %>
                    
                <li><a href="listaventas.jsp">Ventas</a></li>
                <%
                    if(usuarioSesion.getPerfil().equals("A")){
                        out.println("<li><a href='listadiscos.jsp'>Discos</a></li>");
                        out.println("<li><a href='index.jsp'>"+usuarioSesion.getNombre()+"(desconectar)</a></li>");
                    }else{
                        out.println("<li><a href='index.jsp'>"+usuarioSesion.getNombre()+"(desconectar)</a></li>");
                    } 
                %>
                
            </ul>
        </nav><br><br>
