    <%@page import="java.util.ArrayList"%>
<%@page import="tamara.Usuario"%>
        <nav>
            <ul id="nav">
                <%
                    HttpSession sesion = request.getSession();
                    Usuario usuarioSesion = (Usuario)sesion.getAttribute("usuarioSesion");
                    if(usuarioSesion==null){
                            ArrayList<String> listaErrores=new ArrayList();
                            request.setAttribute("listaErrores", listaErrores);
                            request.setAttribute("mensaje", "Acceso no autorizado");
                            request.getRequestDispatcher("index.jsp").forward(request,response);
                        }else{
                            out.println("<span>"+usuarioSesion.getNombre()+"(desconectar)</span>");
                        }
                    if(usuarioSesion.getPerfil().equals("A")){
                %>
                                    <li><a href="listadiscos.jsp">Discos</a></li>    
                <%    }%>
                    

                <li><a href="listaventas.jsp">Ventas</a></li>
                <li><a href="index.jsp">
                    <%

                        
                    %>
                </a></li>
             </ul>
        </nav><br><br>
