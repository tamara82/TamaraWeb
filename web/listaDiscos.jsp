<%-- 
    Document   : listaClientes
    Created on : 05-abr-2018, 15:57:32
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Tamara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de discos</title>
    </head>
    <body>
        <h1>Lista de discos</h1>
         <%
            String mensaje = (String) request.getAttribute("mensaje");
            if(mensaje != null){
                ArrayList<String> listaErrores = (ArrayList) request.getAttribute("listaErrores");
                if(listaErrores == null){
                    out.println("<p style='color:green;'>" + mensaje + "</p>");
                }else{
                    out.println("<p style='color:red;'>" + mensaje + "</p>");
                    for (String m : listaErrores){
                        out.println("<p style='color:red;'>" + m + "</p>");
                        }
                    
                }
                
             }
        %>
        <table align="center" border="2" cellspacing="0">
            <a href="altadisco.jsp">Alta de Disco</a><br>
            <tr>
            <th>Id</th>
            <th>Titulo</th>
            <th>Autor</th>
            <th>Año de publicación</th>
            <th>Número de canciones</th>
            <th>EAN</th>
        </tr>
        <%
            Disco d = null;
            Tamara tamara= new Tamara();
            ArrayList<Disco> listaDiscos= tamara.leerDiscos();
            int pos = 0;
            while(pos <listaDiscos.size()){
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
                out.println("<a href='modificardisco.jsp?discoId="+ d.getDiscoId()+"'>Modificar</a>");
                out.println("</td>");
                out.println("</tr>");
                pos++;
            }

        %>
        </table>
    </body>
</html>
