<%-- 
    Document   : index
    Created on : 23-abr-2018, 14:36:58
    Author     : usuario
--%>

<%@page import="Utilidades.Util"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" rel="stylesheet" type="text/css" />
        <title>Login</title>
    </head>
    <body>
        <div id="container">
            <header class="item">
                <h2>Introduce tu usuario y contraseña</h2>
            </header><br>
            <div id="mensaje">
                <%
                    String mensaje = (String) request.getAttribute("mensaje");
                    ArrayList<String> listaErrores=new ArrayList();
                        if(mensaje == null){
                            listaErrores = (ArrayList) request.getAttribute("listaErrores");
                        }else if(mensaje.equals("La creación del usuario se ha realizado correctamente")){
                            out.println("<p style='color:green;'>" + mensaje + "</p>");
                        }else if(mensaje != null){
                            out.println("<p style='color:red;'>" + mensaje + "</p>");
                            for (String m : listaErrores){
                                out.println("<p style='color:red;'>" + m + "</p>");
                            }
                        }    
                %>
            </div><br>
            <section id="cuerpo" class="item">
                <form method="post" action="ServletAutenticador">
                    <label>Usuario: </label>
                    <input type="text" name="usuario" value="<%=Util.convertirNullAStringVacio(request.getParameter("usuario"))%>"><br>
                    <label>Contraseña: </label>
                    <input type="password" name="contrasena"><br>
                    <input type="submit" value="Acceder"><br>
                    <a href="altausuario.jsp">Dar de alta nuevo usuario</a>
                </form>
            </section>
        <%@include file="includes/footer.jsp" %>
        </div>
    </body>
</html>

