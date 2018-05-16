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
        <div id="container">
            <header class="item">
                <h1>Lista de Ventas</h1>
                <%@include file="includes/menu.jsp" %>
            </header>
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
                %>
                </div>
                <%
                    String filtroNombre = Util.convertirStringNull(request.getParameter("filtroNombre"));
                    String filtroDni = Util.convertirStringNull(request.getParameter("filtroDni"));
                    String maniobra = Util.convertirStringNull(request.getParameter("filtroDiscoId"));
                    String maniobra2 = Util.convertirStringNull(request.getParameter("filtroFormaPago"));
                    
                %>
            
                <form method="post" action="listaventas.jsp">
                <p class="derecha">
                <label>Ordenar por</label>
                        <select name="criterioOrdenacion">
                            <option value=""></option>
                            <option value="<%=Tamara.NOMBRE_CLIENTE %>">Nombre</option>
                            <option value="<%=Tamara.APELLIDO_CLIENTE %>">Apellido</option>
                        </select> 
                        <select name="orden">
                            <option value=""></option>
                            <option value="<%= Tamara.ASCENDING%>">Ascendente</option>
                            <option value="<%= Tamara.DESCENDING%>">Descendente</option>
                        </select> 
                    <input type="submit" value="Aplicar Filtro"/>
                </p>
                
                <table>
                    <tr>
                        <th>Nombre</th>
                        <th>Apellido</th>
                        <th>DNI</th>
                        <th>Ciudad</th>
                        <th>Forma de pago</th>
                        <th>Disco</th>
                        <th><a href="altaventa.jsp" ><img src='img/mas.png'></a></th>
                        
                    </tr>
                    
                    <%
                        Tamara t = new Tamara();
                        ArrayList<Venta> listaVentas=t.leerVentas();
                        if(!Util.convertirNullAStringVacio(filtroNombre).equals("")){
                            listaVentas = t.leerVentas(filtroNombre,null,null,null,null,null);
                        }
                        if(!Util.convertirNullAStringVacio(filtroDni).equals("")){
                            listaVentas = t.leerVentas(null,filtroDni,null,null,null,null);
                        }
                        Integer filtroDiscoId;
                        if(maniobra == null)filtroDiscoId=null;
                        else filtroDiscoId=Integer.parseInt(maniobra);
                        listaVentas = t.leerVentas(null,null,null,filtroDiscoId,null,null);
                        
                        String filtroFormaPago;
                        if(maniobra2==null) filtroFormaPago=null;
                        else filtroFormaPago=maniobra2;
                        listaVentas = t.leerVentas(null,null,filtroFormaPago,null,null,null);
                        
                        Integer orden;
                        maniobra = Util.convertirStringNull(request.getParameter("criterioOrdenacion"));
                        if(maniobra==null) orden=null;
                        else orden=Integer.parseInt(maniobra);
                        listaVentas = t.leerVentas(null,null,null,null,maniobra,orden);
                        
                    %>
                        <tr>
                        <td>
                        <input type="text" name="filtroNombre"  id="pequeno" value="<%=Util.convertirNullAStringVacio(filtroNombre)%>"/>
                        </td>
                        <td></td>
                        <td><input type="text" name="filtroDni" id="pequeno" value="<%=Util.convertirNullAStringVacio(filtroDni)%>"/>
                        </td>
                        <td></td>
                        <td><select name="filtroFormaPago">
                            <option value=""></option>
                            <option value="E">Efectivo</option>
                            <option value="T">Tarjeta</option>
                        </select>
                        </td>
                        <td>
                        <select name="filtroDiscoId">
                            <option value=""></option>
                        <%
                            ArrayList<Disco> listaDiscos = t.leerDiscos();
                                for (Disco d : listaDiscos) {
                                    if(d.getDiscoId()==filtroDiscoId){
                                        out.println("<option value='" + d.getDiscoId() + "' selected>" + d.getTitulo() + "</option>");                                        
                                    }else{
                                        out.println("<option value='" + d.getDiscoId() + "'>" + d.getTitulo() + "</option>");
                                    }

                                }
                        %>
                        </select></td></tr>
                        <%
                            Venta v = null;
                            int pos = 0;
                            while (pos < listaVentas.size()) {
                                v = listaVentas.get(pos);
                        %>
                            <tr>
                            <td><%=v.getNombreCliente()%></td>
                            <td><%=v.getApellidoCliente()%></td>
                            <td><%=v.getDni()%></td>
                            <td><%=Util.convertirNullAStringVacio(v.getCiudadDomicilio())%></td>
                            <td><%=Util.traducirPago(v.getFormaPago())%></td>
                            <td><%=v.getDisco().getDiscoId()%></td>
                            <td><a href="modificarventa.jsp?ventaId=<%=v.getVentaId()%>"><img src="img/editar.png"></a></td>
                            <td><a href="eliminarventa.jsp?ventaId=<%=v.getVentaId()%>"><img src="img/borrar.png"></a></td>
                            <td><a href="detalleventa.jsp?ventaId=<%=v.getVentaId()%>"><img src="img/lupa.png"></a></td>
                            </tr>
                            <%
                            pos++;
                        }

                    %>
                </table>
                </form>
            </div>
                        
            <%@include file="includes/footer.jsp" %>
    </body>
</html>
