<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/HomeServlet">ERocket Locadora</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Carros
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastro-carro">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarCarrosServlet">Pesquisar</a>

                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Colaboradores
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastro-funcionario">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarFuncionarioServlet">Pesquisar</a>

                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Filiais
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastro-filial">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarFiliaisServlet">Pesquisar</a>

                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Clientes
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastro-cliente">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarClientesServlet">Pesquisar</a>

                        </div>
                    </li>  
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Planos
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/cadastro-plano">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarPlanosServlet">Listar Planos</a>


                        </div>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Locações
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <!--  esse aqui está dando erro, eu não sei por que -->
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/CarregaOp">Cadastrar</a>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarPedidosServlet">Pesquisar</a>

                        </div>
                    </li>
                </ul>
            </div>
        </nav>

        <h1>Unidades Disponíveis</h1>
        <div>



            <!-- adicionada agora -->
            <form action="${pageContext.request.contextPath}/buscar-filial?idfilial=" 
                  method="post">
                <div class="container">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="id" placeholder="Pesquisar..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit">Buscar</button>
                        </div>
                    </div>
                </div>
            </form>

            <ul>
                <!-- adicionada agora-->
                <div class="container">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nome Unidade</th>
                                <th scope="col">Telefone</th>
                                <th scope="col">Gerente</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="p">
                                <tr>
                                    <td><c:out value="${p.id}" /></td>
                                    <th> <a href='http://localhost:8080/agendaweb-1.0-SNAPSHOT/buscar-filial?idfilial="${p.id}"'>
                                            <c:out value="${p.nomeUnidade}" /> </a></th>
                                    <td><c:out value="${p.telefone}" /></td>
                                    <td><c:out value="${p.gerente}" /></td>
                                </tr>
                            </c:forEach>
                        </tbody>    
                    </table>
                </div>
            </ul> <p>
                <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a> 
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
