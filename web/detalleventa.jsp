<%-- 
    Document   : detalleventa
    Created on : 18-abr-2018, 19:32:41
    Author     : usuario
--%>

<%@page import="tamara.Disco"%>
<%@page import="Utilidades.Util"%>
<%@page import="tamara.Tamara"%>
<%@page import="tamara.Venta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Eliminar Venta</h1>
            

            <%
                Venta v;
                Tamara t =new Tamara();
                v = t.leerVenta(Integer.parseInt(request.getParameter("ventaId")));
            %>
            <form method="post">
            <input type="hidden" name="ventaId" value="<%= v.getVentaId() %>">
            <label>Nombre del cliente:</label>
            <input type="text" name="nombreCliente" disabled value="<%= v.getNombreCliente() %>"/><br>
            <label>Apellido del cliente:</label>
            <input type="text" name="apellidoCliente" disabled value="<%= v.getApellidoCliente() %>"/><br>
            <label>DNI:</label>
            <input type="text" name="dni" disabled value="<%= v.getDni() %>"/><br>
            <label>Ciudad de domicilio:</label>
            <input type="text" name="ciudadDomicilio" disabled value="<%= Util.convertirNullAStringVacio(v.getCiudadDomicilio()) %>"/><br>
            <label>Forma de pago</label>
            <%
                String formapago=v.getFormaPago();
                if (formapago.equals("T")){
                    out.println("<input type='radio' name='formaPago' disabled value='T' checked>Tarjeta");   
                }else{
                    out.println("<input type='radio' name='formaPago' disabled value='T'>Tarjeta" );
                }
                if (formapago.equals("E")){
                    out.println("<input type='radio' name='formaPago' disabled value='E' checked>Efectivo ");  
                }else{
                out.println("<input type='radio' name='formaPago' disabled value='E'>Efectivo");        
                }
                
            %>
                <br>
            <label>Disco: </label>
            <select name="discoId">
                <option value="0"></option>
            <%
                ArrayList<Disco> listaDiscos= t.leerDiscos();
                for(Disco s : listaDiscos){
                    if (v.getDisco().getDiscoId()==s.getDiscoId()){
                            out.println("<option value='"+s.getDiscoId()+"' selected>"+s.getTitulo()+"disabled</option>");   
                    }else{
                            out.println("<option value='"+s.getDiscoId()+"'>"+s.getTitulo()+"disabled</option>");
                    }
                }
                
            %>
            </select><br>
            <a href="listaVentas.jsp"><input type="button" value="Volver"/></a><br>
        </form>
    </body>
    </body>
</html>
