<%-- 
    Document   : listaClientes
    Created on : 05-abr-2018, 15:57:32
    Author     : usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Tamara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de discos</h1>
        
        <table align="center" border="2" cellspacing="0">
            <a href="altadisco.jsp">Alta de Disco</a><br>
        <%
            Disco d = null;
            Tamara tamara= new Tamara();
            ArrayList<Disco> listaDiscos= tamara.leerDiscos();
            int pos = 0;
            while(pos <listaDiscos.size()){
                d = listaDiscos.get(pos);
                
                out.println("<tr>");
                out.println("<td>");
                out.println(d.getTitulo());
                out.println("</td>");
                out.println("<td>");
                out.println(d.getAutor());
                out.println("</td>");
                out.println("<td>");
                out.println(d.getAnioPublicacion());
                out.println("</td>");
                out.println("<td>");
                out.println(d.getNumCanciones());
                out.println("</td>");
                out.println("<td>");
                out.println(d.getEAN());
                out.println("</td>");
                out.println("</tr>");
                pos++;
            }

        %>
        </table>
    </body>
</html>
