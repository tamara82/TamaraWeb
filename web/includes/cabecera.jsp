<%
    String usuarioSession=(String)session.getAttribute("usuarioSesion");
%>
<div id="banner">
    <span>Usuario Actual: <%=usuarioSession%></span>
</div>
