<%-- 
    Document   : detalledisco
    Created on : 18-abr-2018, 19:16:53
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
        <title>Detalle Disco</title>
    </head>
    <body>
        <h1>Detalle Disco</h1>

        <%
            Disco d;
            Tamara t =new Tamara();
            d = t.leerDisco(Integer.parseInt(request.getParameter("discoId")));
        %>
            <form method="post">
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
            <a href="listadiscos.jsp"><input type="button" value="Volver"/></a><br>
        </form>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>

