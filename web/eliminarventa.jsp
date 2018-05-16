<%-- 
    Document   : elliminarventa
    Created on : 18-abr-2018, 19:34:09
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Tamara"%>
<%@page import="tamara.Venta"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Eliminar Venta</title>
    </head>
    <body>
        <div id="container">
            <header class="item">        
                <h1>Eliminar Venta</h1>
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

                    Venta v;
                    Tamara t = new Tamara();
                    v = t.leerVenta(Integer.parseInt(request.getParameter("ventaId")));
                %>
            </div>
            <section id="cuerpo" class="item">
                <form method="post" action="ServletEliminarVenta">
                    <input type="hidden" name="ventaId" value="<%= v.getVentaId()%>">
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
                        <%   
                            ArrayList<Disco> listaDiscos = t.leerDiscos();
                            for (Disco s : listaDiscos) {
                                if (v.getDisco().getDiscoId() == s.getDiscoId()) {
                                    out.println("<option value='" + s.getDiscoId() + "'selected>" + s.getTitulo() + "</option>");
                                } else {
                                    out.println("<option value='" + s.getDiscoId() + "'>" + s.getTitulo() + "</option>");
                                }
                            }

                        %>
                    </select><br>
                    <input type="submit" value="Eliminar"/>
                    <a href="listaventas.jsp"><input type="button" value="Cancelar"/></a><br>
                </form>
            </section>
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>
