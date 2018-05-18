<%-- 
    Document   : PessoaInicio
    Created on : 07/05/2018, 20:09:33
    Author     : Matheus Maia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Pedido</h1>
        <ul>
            
        
            <li><h3><a href="http://localhost:8080/agendaweb-1.0-SNAPSHOT/Filial/TipoCarro.jsp"> Inserir Pedido </a></h3></li>
            <li><h3><a href="http://localhost:8080/agendaweb-1.0-SNAPSHOT/ListarPedidoServlet"> Listar Todos </a></h3></li>
            
            <h5><a href="${pageContext.request.contextPath}/CarregaOp"> Voltar </a></h5>
        </ul>  
    </body>
</html>
