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
        <p>

        </p>
        <h1>Carros Disponiveis</h1><p>

        </p>
        <div>

            <!-- estou testando aqui para ver o botao de pesquisar por nome precisa fazer um novo select varias coisas
             TUDO NO:FORM-CARRO-CADASTRO; LISTAR CARRO; BUSCARCARROSERVLET;
            DAOCARRO;FORM-CARRO-RESULTADO;RESULTADOATUALIZAR--> 
            <form action="${pageContext.request.contextPath}/buscar-carro?idcarro=" 
                  method="post">
                <div class="container">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" name="ds_carro" placeholder="Pesquisar..." aria-label="Recipient's username" aria-describedby="basic-addon2">
                        <div class="input-group-append">
                            <button class="btn btn-outline-secondary" type="submit" onclick="">Buscar</button>
                        </div>
                    </div>
                </div>
            </form>


            <ul>
                <div class="container">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Nome</th>
                                <th scope="col">Fabricante</th>
                                <th scope="col">Plano</th>
                              
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${lista}" var="p">
                                <tr>
                                    <td><c:out value="${p.idcarro}" /></td>

                                    <th> <a href='http://localhost:8080/agendaweb-1.0-SNAPSHOT/buscar-carro?idcarro="${p.idcarro}"'> <c:out value="${p.carro}" /> </a></th>
                                    <td><c:out value="${p.fabricante}" /></td>
                                    <td><c:out value="${p.idplano}" /></td>
                                    <td>
                                         <form action="${pageContext.request.contextPath}/buscar-carro?idcarro=" 
                                               method="post">
                                        <button type="submit" value="${p.idcarro}" class="btn btn-success btnEdit">Editar</button>
                                        <button type="button" value="${p.idcarro}" class="btn btn-danger btnDelete">Deletar</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>    
                    </table>
                </div>
            </ul> <p> 
        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
         <script>
        $(".btnDelete").click(function(){
            var id = $(this).value("id");
            var row = $(this).parent().parent();
            
            bootbox.confirm({
                title: "Remover produto",
                message: "Você quer mesmo remover este produto?",
                buttons: {
                    confirm: {
                        label: 'Confirmar',
                        className: 'btn-success'
                    },
                    cancel: {
                        label: 'Cancelar',
                        className: 'btn-default'
                    }
                },
                callback: function(result){
                    if (result != 1)
                        return;
                    $.ajax({
                        url: "RemoveProduct?id=" + id,
                        method: "GET",
                        success: function(result) {
                            $("#alert").removeClass("alert-danger").addClass("alert-success");
                            $("#alert").text("Removido com sucesso!").show();
                            row.remove();
                            
                        },
                        error: function(){
                            $("#alert").removeClass("alert-success").addClass("alert-danger");
                            $("#alert").text("Ocorreu um erro ao remover o produto!").show();
                        }
                    });
                }
            });
            
        });
        
    $(".btnEdit").click(function(){
            var id = $(this).data("id");
            $.ajax({
                url: "EditProduct?id=" + id,
                method: "GET",
                success: function(result){
                    console.log(result);
                    var body = $("#editProductModal .modal-body");
                    body.find("input[name='idcarro']").val(result.idcarro);
                    body.find("input[name='carro']").val(result.name);
                    body.find("input[name='fabricante']").val(result.fabricante);
                    body.find("input[name='idplano']").val(result.idplano);                    
                    
                    $("#editProductModal").modal('show');
                },
                error: function() {
                }
            });
        });
    
    </body>
</html>
