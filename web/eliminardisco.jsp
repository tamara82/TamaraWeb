<%-- 
    Document   : eliminardisco
    Created on : 18-abr-2018, 18:42:04
    Author     : usuario
--%>

<%@page import="tamara.Tamara"%>
<%@page import="tamara.Disco"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Eliminar Disco</title>
    </head>
    <body>
        <h1>Eliminar Disco</h1>
        <%@include file="includes/menu.jsp" %>
        <%@include file="includes/controlacceso.jsp" %>
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
            Disco d;
            Tamara t =new Tamara();
            d = t.leerDisco(Integer.parseInt(request.getParameter("discoId")));
        %>
            <form method="post" action="ServletEliminarDisco">
            <input type="hidden" name="discoId" value="<%= d.getDiscoId() %>">
            <label>Titulo: </label>
            <input type="text" name="titulo" disabled value="<%= d.getTitulo()%>"/><br>
            <label>Autor: </label>
            <input type="text" name="autor" disabled value="<%= d.getAutor()%>"/><br>
            <label>Año de publicacion: </label>
            <input type="number" name="anioPublicacion" disabled value="<%= d.getAnioPublicacion()%>"/><br>
            <label>Número de canciones: </label>
            <input type="number" name="numCanciones" disabled value="<%= d.getNumCanciones()%>"/><br>
            <label>EAN: </label>
            <input type="text" name="ean" disabled value="<%= d.getEAN()%>"/><br>
            <input type="submit" value="Eliminar"/>
            <a href="listadiscos.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
