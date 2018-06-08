<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Cadastro Carro</title>

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
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/AtualizarPlanoServlet">Atualizar</a>

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
        </nav><p>

        </p> <!-- navbar com tudo escrito para ver s da certo -->


        <div class="container">
            <div> 
                <h1 style="align-content: center">Cadastre um Carro:</h1><hr>
                <br>
            </div>
            <div style="align-content: center">
                <form action="${pageContext.request.contextPath}/cadastro-carro"
                      method="post">

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="carro">Carro</label>
                            <input type="text" class="form-control" name="carro" placeholder="ex Fusca">

                        </div>
                        <div class="form-group col-md-6">
                            <label for="fabricante">Fabricante</label>
                            <input type="text" class="form-control" name="fabricante" placeholder="ex Fiat">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="cor">Cor</label>
                        <input type="text" class="form-control" name="cor" placeholder="ex Vermelho">

                    </div>

                    <div class="form-group">
                        <label for="ano">Ano</label>
                        <input type="text" class="form-control" name="ano" placeholder="ex 1999">

                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="valor">Valor</label>
                            <input type="text" class="form-control" name="valor" placeholder=" ex 20000">

                        </div>

                        <div class="form-group col-md-4">
                            <label for="classificacao">Classificação</label>
                            <select name="class" class="form-control">

                                <option selected>Escolha...</option>
                                <option value="1">Hatch</option>
                                <option value="2">Sedan</option>
                                <option value="3">SUV</option>
                                <option value="4">Picapes</option>
                                <option value="5">Esportivos</option>
                                <option value="6">Vans</option>
                            </select>

                        </div>
                    </div>

                    <button type="submit" class="btn btn-dark">Salvar</button>&nbsp;
                    
                    <!-- botao novissimo lindissimo pegando -->
                    <button type="submit" class="btn btn-dark"
                            formaction="${pageContext.request.contextPath}/HomePage.jsp">Voltar</button>
                            
                   <!--  esse era o botao que estava <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>  -->
                </form>

            </div>
        </div>


        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
