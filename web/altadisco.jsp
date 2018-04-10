<%-- 
    Document   : altaCliente
    Created on : 05-abr-2018, 15:58:14
    Author     : usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form method="post" action="ServletAltaDisco">
            <h1>Alta de Disco</h1>
            <label>Titulo: </label>
            <input type="text" name="titulo"/><br>
            <label>Autor: </label>
            <input type="text" name="autor"/><br>
            <label>Año de publicacion: </label>
            <input type="text" name="anioPublicacion"/><br>
            <label>Número de canciones: </label>
            <input type="text" name="numCanciones"/><br>
            <label>EAN: </label>
            <input type="text" name="ean"/><br>
            <input type="submit" value="Aceptar"/>
            <a href="listaDiscos.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
    </body>
</html>
