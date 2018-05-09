<%-- 
    Document   : modificarventa
    Created on : 12-abr-2018, 14:58:17
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Venta"%>
<%@page import="tamara.Tamara"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Modificar Venta</title>
    </head>
    <body>
        <h1>Modificar Venta</h1>
        <%@include file="includes/menu.jsp" %>    
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
            <%
                Venta v;
                if (request.getParameter("nombreCliente") == null){
                Tamara t =new Tamara();
                v = t.leerVenta(Integer.parseInt(request.getParameter("ventaId")));
                }else{
                    v = new Venta();
                    v.setVentaId(Integer.parseInt(request.getParameter("ventaId")));
                    v.setNombreCliente(request.getParameter("nombreCliente"));
                    v.setApellidoCliente(request.getParameter("apellidoCliente"));
                    v.setDni(request.getParameter("dni"));
                    v.setCiudadDomicilio(request.getParameter("ciudadDomicilio"));
                    v.setFormaPago(request.getParameter("formaPago"));
                    Disco d = new Disco();
                    d.setDiscoId(Integer.parseInt(request.getParameter("discoId")));
                    v.setDisco(d);
                }
                
                %>
            <form method="post" action="ServletModificarVenta">
            <input type="hidden" name="ventaId" value="<%= v.getVentaId() %>">
            <label>Nombre del cliente:</label>
            <input type="text" name="nombreCliente" value="<%= v.getNombreCliente() %>"/><br>
            <label>Apellido del cliente:</label>
            <input type="text" name="apellidoCliente" value="<%= v.getApellidoCliente() %>"/><br>
            <label>DNI:</label>
            <input type="text" name="dni" value="<%= v.getDni() %>"/><br>
            <label>Ciudad de domicilio:</label>
            <input type="text" name="ciudadDomicilio" value="<%= Util.convertirNullAStringVacio(v.getCiudadDomicilio()) %>"/><br>
            <label>Forma de pago</label>
            <%
                String formapago=v.getFormaPago();
                if (formapago.equals("T")){
                    out.println("<input type='radio' name='formaPago' value='T' checked>Tarjeta");   
                }else{
                    out.println("<input type='radio' name='formaPago' value='T'>Tarjeta" );
                }
                if (formapago.equals("E")){
                    out.println("<input type='radio' name='formaPago' value='E' checked>Efectivo ");  
                }else{
                out.println("<input type='radio' name='formaPago' value='E'>Efectivo");        
                }
                
            %>
                <br>
            <label>Disco: </label>
            <select name="discoId">
                <option value="0"></option>
            <%
                Tamara t = new Tamara();
                ArrayList<Disco> listaDiscos= t.leerDiscos();
                for(Disco d : listaDiscos){
                    if (v.getDisco().getDiscoId()==d.getDiscoId()){
                            out.println("<option value='"+d.getDiscoId()+"' selected>"+d.getTitulo()+"</option>");   
                    }else{
                            out.println("<option value='"+d.getDiscoId()+"'>"+d.getTitulo()+"</option>");
                    }
                }
                
            %>
            </select><br>
            
            <input type="submit" value="Aceptar"/>
            <a href="listaventas.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
