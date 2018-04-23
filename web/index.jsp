<%-- 
    Document   : index
    Created on : 23-abr-2018, 14:36:58
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
        <h1>Introduce tu usuario y contraseña</h1>
        <form method="post" action="ServletAutenticador">
            <label>Usuario: </label>
            <input type="text" name="usuario"><br>
            <label>Contraseña: </label>
            <input type="password" name="contrasena"><br>
            <input type="submit" value="Acceder"><br>
            <a href="altausuario.jsp">Dar de alta nuevo usuario</a>
        </form>
    </body>
</html>
