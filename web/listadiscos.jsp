<%-- 
    Document   : listadiscos.jsp
    Created on : 08-may-2018, 18:38:59
    Author     : usuario
--%>
<%@page import="tamara.Usuario"%>
<%@page import="Utilidades.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Tamara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Lista de discos</title>
    </head>
    <body>
        <div id="container">
            <header class="item">
                <h1>Lista de discos</h1>
                <%@include file="includes/menu.jsp" %>
            </header><br>
            <div id="mensaje">
                <%                
                    String mensaje = (String) request.getAttribute("mensaje");
                    if (mensaje != null) {
                        ArrayList<String> listaErrores = (ArrayList) request.getAttribute("listaErrores");
                        if (listaErrores == null) {
                            out.println("<p style='color:green;'>" + mensaje + "</p>");
                        } else {
                            out.println("<p style='color:red;'>" + mensaje + "</p>");
                            for (String m : listaErrores) {
                                out.println("<p style='color:red;'>" + m + "</p>");
                            }

                        }

                    }
                %>
            </div>
            <section id="cuerpo" class="item">
                <table>
                    <tr>
                        <th>Id</th>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Año de publicación</th>
                        <th>Número de canciones</th>
                        <th>EAN</th>
                        <th><a href="altadisco.jsp" ><img src='img/mas.png'></a></th>
                    </tr>
                    <%
                        Disco d = null;
                        Tamara tamara = new Tamara();
                        ArrayList<Disco> listaDiscos = tamara.leerDiscos();
                        int pos = 0;
                        while (pos < listaDiscos.size()) {
                            d = listaDiscos.get(pos);

                            out.println("<tr>");
                            out.println("<td>");
                            out.println(d.getDiscoId());
                            out.println("</td>");
                            out.println("<td>");
                            out.println(d.getTitulo());
                            out.println("</td>");
                            out.println("<td>");
                            out.println(d.getAutor());
                            out.println("</td>");
                            out.println("<td>");
                            out.println(Integer.toString(d.getAnioPublicacion()));
                            out.println("</td>");
                            out.println("<td>");
                            out.println(Integer.toString(d.getNumCanciones()));
                            out.println("</td>");
                            out.println("<td>");
                            out.println(d.getEAN());
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<a href='modificardisco.jsp?discoId=" + d.getDiscoId() + "'><img src='img/editar.png'></a>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<a href='eliminardisco.jsp?discoId=" + d.getDiscoId() + "'><img src='img/borrar.png'></a>");
                            out.println("</td>");
                            out.println("<td>");
                            out.println("<a href='detalledisco.jsp?discoId=" + d.getDiscoId() + "'><img src='img/lupa.png'></a>");
                            out.println("</td>");
                            out.println("</tr>");
                            pos++;
                        }
                    %>
                </table>
            </section>
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>