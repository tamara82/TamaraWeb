<%-- 
    Document   : modificardisco
    Created on : 15-abr-2018, 17:13:25
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="tamara.Tamara"%>
<%@page import="tamara.Disco"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>

            <h1>Modificación de Disco</h1>
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
            if (request.getParameter("titulo") == null){
                Tamara t =new Tamara();
                d = t.leerDisco(Integer.parseInt(request.getParameter("discoId")));
                }else{
                    d = new Disco();
                    d.setDiscoId(Integer.parseInt(request.getParameter("discoId")));
                    d.setTitulo(request.getParameter("titulo"));
                    d.setAutor(request.getParameter("autor"));
                    if (request.getParameter("anioPublicacion").equals("")) d.setAnioPublicacion(null);
                    else d.setAnioPublicacion(Integer.parseInt(request.getParameter("anioPublicacion")));
                    if (request.getParameter("numCanciones").equals("")) d.setNumCanciones(null);
                    else d.setNumCanciones(Integer.parseInt(request.getParameter("numCanciones")));
                    d.setEAN(request.getParameter("ean"));
                }

        %>
            <form method="post" action="ServletModificarDisco">
            <input type="hidden" name="discoId" value="<%= d.getDiscoId() %>">
            <label>Titulo: </label>
            <input type="text" name="titulo" value="<%= d.getTitulo()%>"/><br>
            <label>Autor: </label>
            <input type="text" name="autor" value="<%= d.getAutor()%>"/><br>
            <label>Año de publicacion: </label>
            <input type="number" name="anioPublicacion"  value="<%= d.getAnioPublicacion()%>"/><br>
            <label>Número de canciones: </label>
            <input type="number" name="numCanciones" value="<%= d.getNumCanciones()%>"/><br>
            <label>EAN: </label>
            <input type="text" name="ean" value="<%= d.getEAN()%>"/><br>
            <input type="submit" value="Modificar"/>
            <a href="listaDiscos.jsp"><input type="button" value="Cancelar"/></a><br>
        </form>
    </body>
</html>
