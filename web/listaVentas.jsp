<%-- 
    Document   : listaDiscos
    Created on : 03-abr-2018, 19:01:40
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Venta"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Tamara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de Ventas</h1>
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if(mensaje != null){
            out.println("<p style='color:green;'>" + mensaje + "</p>");
            }
        %>
        <table align="center" border="2" cellspacing="0">
            <a href="altaventa.jsp">Alta de Venta</a><br>
        <%
            
            Tamara tamara= new Tamara();
            ArrayList<Venta> listaVentas= tamara.leerVentas();
            
            Venta v = null;
            int pos = 0;
            while(pos <listaVentas.size()){
                v = listaVentas.get(pos);
                
                out.println("<tr>");
                out.println("<td>");
                out.println(v.getNombreCliente());
                out.println("</td>");
                out.println("<td>");
                out.println(v.getApellidoCliente());
                out.println("</td>");
                out.println("<td>");
                out.println(v.getDni());
                out.println("</td>");
                out.println("<td>");
                out.println(Util.convertirNullAStringVacio(v.getCiudadDomicilio()));
                out.println("</td>");
                out.println("<td>");
                out.println(Util.traducirPago(v.getFormaPago()));
                out.println("</td>");
                out.println("</tr>");
                pos++;
            }

        %>
        </table>
    </body>
</html>
