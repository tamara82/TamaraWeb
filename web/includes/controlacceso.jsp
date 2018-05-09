<%@page import="tamara.Usuario"%>
<%
HttpSession ssesion = request.getSession();
Usuario usuarioSSesion = (Usuario)ssesion.getAttribute("usuarioSesion");
    if(usuarioSSesion.getPerfil().equals("N")){
        request.setAttribute("mensaje", "Acceso no autorizado");
        request.getRequestDispatcher("listaventas.jsp").forward(request,response);
    } 
%>