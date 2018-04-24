<%-- 
    Document   : altaventa
    Created on : 04-abr-2018, 19:05:40
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
        <title>Alta de Venta</title>
    </head>
    <body>
        <form method="post" action="ServletAltaVenta">
            <h1>Alta de Venta</h1>
            <%
                String mensaje = (String) request.getAttribute("mensaje");
                if(mensaje != null){
                    ArrayList<String> listaErrores = (ArrayList) request.getAttribute("listaErrores");
                    if(listaErrores == null){
                        out.println("<p style='color:green;'>" + mensaje + "</p>");
                    } else{
                        out.println("<p style='color:red;'>" + mensaje + "</p>");
                        for (String m : listaErrores){
                        out.println("<p style='color:red;'>" + m + "</p>");
                        }    
                    }
                }
            %>
            <label>Nombre del cliente:</label>
            <input type="text" name="nombreCliente" value="<%=Util.convertirNullAStringVacio(request.getParameter("nombreCliente"))%>"/><br>
            <label>Apellido del cliente:</label>
            <input type="text" name="apellidoCliente" value="<%=Util.convertirNullAStringVacio(request.getParameter("apellidoCliente"))%>"/><br>
            <label>DNI:</label>
            <input type="text" name="dni" value="<%=Util.convertirNullAStringVacio(request.getParameter("dni"))%>"/><br>
            <label>Ciudad de domicilio:</label>
            <input type="text" name="ciudadDomicilio" value="<%=Util.convertirNullAStringVacio(request.getParameter("ciudadDomicilio"))%>"/><br>
            <label>Forma de pago</label>
                <input type='radio' name='formaPago' value='E'>Efectivo
                <input type='radio' name='formaPago' value='T'>Tarjeta
            <br>
            <label>Disco: </label>
            <select name="discoId">
                <option value="0"></option>
            <%
                Tamara t = new Tamara();
                ArrayList<Disco> listaDiscos = t.leerDiscos();
                for(Disco d : listaDiscos){
                    if (request.getParameter("discoId")!= null){
                        if (request.getParameter("discoId").equals(Integer.toString(d.getDiscoId()))){
                            out.println("<option value='"+d.getDiscoId()+"' selected>"+d.getTitulo()+"</option>");   
                        }else{
                            out.println("<option value='"+d.getDiscoId()+"'>"+d.getTitulo()+"</option>");
                        }
                    }else{
                    out.println("<option value='"+d.getDiscoId()+"'>"+d.getTitulo()+"</option>");        
                    }
                }
            %>
            </select><br>
            
            <input type="submit" value="Aceptar"/>
            <a href="listaVentas.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
    </body>
</html>
