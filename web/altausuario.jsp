<%-- 
    Document   : altausuario
    Created on : 23-abr-2018, 14:49:13
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alta de Usuario</title>
    </head>
    <body>
        <h1>Alta de Usuario</h1>
        <form method="post" action="ServletAltaUsuario">
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
        
            <label>Usuario: </label>
            <input type="text" name="nombre" value="<%=Util.convertirNullAStringVacio(request.getParameter("nombre"))%>"/><br>
            <label>Contraseña: </label>
            <input type="password" name="contrasena" value="<%=Util.convertirNullAStringVacio(request.getParameter("contrasena"))%>"><br>
            <label>Repetir contraseña: </label>
            <input type="password" name="repetirContrasena" value="<%=Util.convertirNullAStringVacio(request.getParameter("repetirContrasena"))%>"><br>
            <label>Perfil: </label>
            <input type="radio" name="perfil" value="A">Administrador
            <input type="radio" name="perfil" value="N">Usuario normal<br>
            <input type="submit" value="Crear usuario">
            <a href="index.jsp">Cancelar</a><br>
        </form>
    </body>
</html>
