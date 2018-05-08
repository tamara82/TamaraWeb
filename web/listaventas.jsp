<%-- 
    Document   : listaventas.jsp
    Created on : 08-may-2018, 18:59:36
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
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Lista de Ventas</title>
    </head>
    <body>
        <h1>Lista de Ventas</h1>
        <%@include file="includes/menu.jsp" %>
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
        <table>
            <tr>
            <th>Id</th>
            <th>Nombre</th>
            <th>Apellido</th>
            <th>DNI</th>
            <th>Ciudad</th>
            <th>Forma de pago</th>
            <th>Disco</th>
            <th><a href="altaventa.jsp" ><img src='img/mas.png'></a></th>
            </tr>
        <%
            
            Tamara tamara= new Tamara();
            ArrayList<Venta> listaVentas= tamara.leerVentas();
            
            Venta v = null;
            int pos = 0;
            while(pos <listaVentas.size()){
                v = listaVentas.get(pos);
                out.println("<tr>");
                out.println("<td>");
                out.println(v.getVentaId());
                out.println("</td>");
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
                out.println("<td>");
                out.println(v.getDisco().getDiscoId());
                out.println("</td>");
                out.println("<td>");
                out.println("<a href='modificarventa.jsp?ventaId="+ v.getVentaId()+"'><img src='img/editar.png'></a></a>");
                out.println("</td>");
                out.println("<td>");
                out.println("<a href='eliminarventa.jsp?ventaId="+ v.getVentaId()+"'><img src='img/borrar.png'></a></a>");
                out.println("</td>");
                out.println("<td>");
                out.println("<a href='detalleventa.jsp?ventaId="+ v.getVentaId()+"'><img src='img/lupa.png'></a>");
                out.println("</td>");
                out.println("</tr>");
                pos++;
            }

        %>
        </table>
    <%@include file="includes/footer.jsp" %>
    </body>
</html>
