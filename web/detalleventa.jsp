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
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Detalle Venta</title>
    </head>
    <body>
        <div id="container">
            <header class="item">
                <h1>Detalle Venta</h1>
                <%@include file="includes/menu.jsp" %>
            </header><br>
            <div id="mensaje">
                <%                    
                    Venta v;
                    Tamara t = new Tamara();
                    v = t.leerVenta(Integer.parseInt(request.getParameter("ventaId")));
                %>
            </div>
            <section id="cuerpo" class="item">
                <form method="post">
                    <input type="hidden" name="ventaId" value="<%= v.getVentaId()%>"/>
                    <label>Nombre del cliente:</label>
                    <input type="text" name="nombreCliente" disabled value="<%= v.getNombreCliente()%>"/><br>
                    <label>Apellido del cliente:</label>
                    <input type="text" name="apellidoCliente" disabled value="<%= v.getApellidoCliente()%>"/><br>
                    <label>DNI:</label>
                    <input type="text" name="dni" disabled value="<%= v.getDni()%>"/><br>
                    <label>Ciudad de domicilio:</label>
                    <input type="text" name="ciudadDomicilio" disabled value="<%= Util.convertirNullAStringVacio(v.getCiudadDomicilio())%>"/><br>
                    <label>Forma de pago</label>
                    <%
                        String formapago = v.getFormaPago();
                        if (formapago.equals("T")) {
                            out.println("<input type='radio' name='formaPago' disabled value='T' checked>Tarjeta");
                        } else {
                            out.println("<input type='radio' name='formaPago' disabled value='T'>Tarjeta");
                        }
                        if (formapago.equals("E")) {
                            out.println("<input type='radio' name='formaPago' disabled value='E' checked>Efectivo ");
                        } else {
                            out.println("<input type='radio' name='formaPago' disabled value='E'>Efectivo");
                        }

                    %>
                    <br>
                    <label>Disco: </label>
                    <select name="discoId" disabled>
                        <option value="0"></option>
                        <%                
                            ArrayList<Disco> listaDiscos = t.leerDiscos();
                            for (Disco d : listaDiscos) {
                                if (v.getDisco().getDiscoId() == d.getDiscoId()) {
                                    out.println("<option value='" + d.getDiscoId() + "' selected>" + d.getTitulo() + "</option>");
                                } else {
                                    out.println("<option value='" + d.getDiscoId() + "'>" + d.getTitulo() + "</option>");
                                }
                            }

                        %>
                    </select><br>
                    <a href="listaventas.jsp"><input type="button" value="Volver"/></a><br>
                </form>
            </section>
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
