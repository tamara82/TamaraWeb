<%-- 
    Document   : listadiscos.jsp
    Created on : 08-may-2018, 18:38:59
    Author     : usuario
--%>
<%@page import="tamara.Usuario"%>
<%@page import="Utilidades.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page import="tamara.Disco"%>
<%@page import="tamara.Tamara"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Lista de discos</title>
    </head>
    <body>
        <div id="container">
            <header class="item">
                <h1>Lista de discos</h1>
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
                %>
                </div>
                <%
                    String filtroTitulo = Util.convertirStringNull(request.getParameter("filtroTitulo"));
                    String filtroAutor = Util.convertirStringNull(request.getParameter("filtroAutor"));
                    String maniobra = Util.convertirStringNull(request.getParameter("filtroAnio"));
                    Tamara t = new Tamara();
                        ArrayList<Disco> listaDiscos=t.leerDiscos();
                        if(filtroTitulo==null)filtroTitulo=null;
                        else listaDiscos = t.leerDiscos(filtroTitulo,null,null,null,null,null,null);
                        
                        if(filtroAutor==null)filtroAutor=null;
                        else listaDiscos = t.leerDiscos(null,filtroAutor,null,null,null,null,null);
                        
                        Integer filtroAnio;
                        if(maniobra==null){
                            filtroAnio = null;
                        }else{
                            filtroAnio=Integer.parseInt(maniobra);
                            listaDiscos = t.leerDiscos(null,null,filtroAnio,null,null,null,null);
                        }
                        
                        maniobra=Util.convertirStringNull(request.getParameter("min"));
                        String maniobra2=Util.convertirStringNull(request.getParameter("max"));
                        Integer min;
                        Integer max;
                        if(maniobra==null && maniobra2==null){
                            min=null;
                            max=null;
                        }else{
                            min=Integer.parseInt(maniobra);
                            max=Integer.parseInt(maniobra2);
                            listaDiscos = t.leerDiscos(null,null,null,min,max,null,null);
                        }
                        
                    maniobra=Util.convertirStringNull(request.getParameter("criterioOrdenacion"));
                    maniobra2 = Util.convertirStringNull(request.getParameter("orden"));
                    Integer orden;
                    Integer criterioOrdenacion=null;
                        if(maniobra==null){
                            orden=null;
                        }else{
                            criterioOrdenacion=Integer.parseInt(maniobra);
                            orden=Integer.parseInt(Util.convertirStringNull(request.getParameter("orden")));
                            listaDiscos = t.leerDiscos(null,null,null,null,null,criterioOrdenacion,orden);
                        }
                        
                    
                %>
            <form method="post" action="listadiscos.jsp" id="grande">
                <p id="derecha">
                    <label>Ordenar por</label>
                        <select name="criterioOrdenacion">
                            <option value=""></option>
                            <option value="<%=Tamara.TITULO %>" <%if (Tamara.TITULO == criterioOrdenacion) out.print("selected='selected'");%>>Nombre</option>
                            <option value="<%=Tamara.AUTOR %>" <%if (Tamara.AUTOR == criterioOrdenacion) out.print("selected='selected'");%>>Apellido</option>
                        </select> 
                        <select name="orden">
                            <option value=""></option>
                            <option value="<%= Tamara.ASCENDING%>" <%if (Tamara.ASCENDING == orden) out.print("selected='selected'");%>>Ascendente</option>
                            <option value="<%= Tamara.DESCENDING%>" <%if (Tamara.DESCENDING == orden) out.print("selected='selected'");%>>Descendente</option>
                        </select> 
                </p>
            <section id="cuerpo" class="item">
                <table>
                    <tr>
                        <th>Titulo</th>
                        <th>Autor</th>
                        <th>Año de publicación</th>
                        <th>Número de canciones</th>
                        <th>EAN</th>
                        <th><a href="altadisco.jsp" ><img src='img/mas.png'></a></th>
                    </tr>
                    <tr>
                        <td><input type="text" name="filtroTitulo"  id="pequeno" value="<%=Util.convertirNullAStringVacio(filtroTitulo)%>"/></td>
                        <td><input type="text" name="filtroAutor"  id="pequeno" value="<%=Util.convertirNullAStringVacio(filtroAutor)%>"/></td>
                        <td><select name="filtroAnio" id="pequeno">
                            <option value=""></option>
                            <%
                                for (Disco disco : listaDiscos) {
                                if(disco.getAnioPublicacion()==filtroAnio){
                                            out.println("<option value='" + disco.getAnioPublicacion() + "' selected>" + disco.getAnioPublicacion() + "</option>");                                        
                                        }else{
                                            out.println("<option value='" + disco.getAnioPublicacion() + "'>" + disco.getAnioPublicacion() + "</option>");
                                        }
                                }
                                    
                            %>
                            </select></td>
                            <td><input type="number" name="min"  id="pequeno" placeholder="Minimo"/></td>
                            <td><input type="number" name="max"  id="pequeno" placeholder="Máximo"/></td>
                            <td colspan="3"><input type="submit" value="Aplicar Filtro"/></td>
                    </tr>
                    <%
                        Disco d = null;
                        Tamara tamara = new Tamara();
                        int pos = 0;
                        while (pos < listaDiscos.size()) {
                            d = listaDiscos.get(pos);
                    %>
                    <tr>
                    <td><%=d.getTitulo()%></td>
                    <td><%=d.getAutor()%></td>
                    <td><%=Integer.toString(d.getAnioPublicacion())%></td>
                    <td><%=Integer.toString(d.getNumCanciones())%></td>
                    <td><%=d.getEAN()%></td>
                    <td><a href="modificardisco.jsp?discoId=<%=d.getDiscoId()%>"><img src="img/editar.png"></a></td>
                    <td><a href="eliminardisco.jsp?discoId=<%=d.getDiscoId()%>"><img src="img/borrar.png"></a></td>
                    <td><a href="detalledisco.jsp?discoId=<%=d.getDiscoId()%>"><img src="img/lupa.png"></a></td>
                    </tr>
                    <%
                            pos++;
                        }
                    %>
                    </table>
                </section>
               </form>
            <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>