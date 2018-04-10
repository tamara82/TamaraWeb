<%-- 
    Document   : altaventa
    Created on : 04-abr-2018, 19:05:40
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
        <form method="post" action="ServletAltaVenta">
            <h1>Alta de Venta</h1>
        <%
            String mensaje = (String) request.getAttribute("mensaje");
            if(mensaje != null){
                out.println("<p style='color:red;'>" + mensaje + "</p>");
                ArrayList<String> listaErrores = (ArrayList) request.getAttribute("listaErrores");
                for (String m : listaErrores){
                    out.println("<p style='color:green;'>" + m + "</p>");
                }
            }
        %>
            <label>Nombre del cliente:</label>
            <input type="text" name="nombreCliente"/><br>
            <label>Apellido del cliente:</label>
            <input type="text" name="apellidoCliente"/><br>
            <label>DNI:</label>
            <input type="text" name="dni"/><br>
            <label>Ciudad de domicilio:</label>
            <input type="text" name="ciudadDomicilio"/><br>
            <label>Forma de pago</label>
            <select name="formaPago">
                <option value="T">Tarjeta</option>
                <option value="E">Efectivo</option>
            </select><br>
            <label>Disco: </label>
            <select name="discoId">
            <%
                Tamara t = new Tamara();
                ArrayList<Disco> listaDiscos = t.leerDiscos();
                for(Disco d : listaDiscos){
                    out.println("<option value='"+d.getDiscoId()+"'>"+d.getTitulo()+"</option>");
                }
            %>
            </select><br>
            
            <input type="submit" value="Aceptar"/>
            <a href="listaVentas.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
    </body>
</html>
