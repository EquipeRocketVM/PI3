<%-- 
    Document   : PlanoInicio
    Created on : 30/04/2018, 16:17:38
    Author     : Vitória Cristina
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Planos</h1><p>
        <ul>
            <li><h3><a href="${pageContext.request.contextPath}/cadastro-plano"> Cadastro </a></h3></li>
            <li><h3><a href="${pageContext.request.contextPath}/ListarPlanosServlet"> Listar Planos </a></h3></li>
            <li><h3><a href="${pageContext.request.contextPath}/AtualizarPlano"> Atualizar Plano </a></h3></li>
        </ul> 
        <h5><a href="${pageContext.request.contextPath}/HomePage.jsp"> Voltar </a></h5>
    </body>
</html>
