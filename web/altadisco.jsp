<%-- 
    Document   : altaCliente
    Created on : 05-abr-2018, 15:58:14
    Author     : usuario
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="Utilidades.Util"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Alta de disco</title>
    </head>
    <body>
        <form method="post" action="ServletAltaDisco">
            <h1>Alta de Disco</h1>
            <%@include file="includes/menu.jsp" %>
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
            <label>Titulo: </label>
            <input type="text" name="titulo" value="<%=Util.convertirNullAStringVacio(request.getParameter("titulo"))%>"/><br>
            <label>Autor: </label>
            <input type="text" name="autor" value="<%=Util.convertirNullAStringVacio(request.getParameter("autor"))%>"/><br>
            <label>Año de publicacion: </label>
            <input type="number" name="anioPublicacion" value="<%=request.getParameter("anioPublicacion")%>"/><br>
            <label>Número de canciones: </label>
            <input type="number" name="numCanciones" value="<%=request.getParameter("numCanciones")%>"/><br>
            <label>EAN: </label>
            <input type="text" name="ean" value="<%=Util.convertirNullAStringVacio(request.getParameter("ean"))%>"/><br>
            <input type="submit" value="Crear"/>
            <a href="listadiscos.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
        <%@include file="includes/footer.jsp" %>
    </body>
</html>
