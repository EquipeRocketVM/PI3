<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
          <a class="dropdown-item" href="${pageContext.request.contextPath}/ListarPlanosServlet">Pesquisar</a>
         
 
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
        </nav> <p>
            
            
        </p>


        
        
        <div class="container">
            <div style="align-content: center">
        <div> 
            <h1>Cadastre uma Filial</h1><hr>
            <br>
        </div>
        <div>
            <form action="${pageContext.request.contextPath}/cadastro-filial"
                  method="post">
                
                 
            
                <div class="form-row">
                <div class="form-group col-md-6">
                <label for="carro">Nome da Filial:</label>
                <input type="text" class="form-control" name="nome" placeholder="Exemplo: Matriz São Paulo">
                
                </div>
                     
                     <div class="form-group col-md-6">
                <label for="valor">Telefone da Filial:</label>
                <input type="text" class="form-control" name="telefone" placeholder="Apenas números">
                
                </div>
                </div>
                    
                <div class="form-group">
                <label for="fabricante">Nome Rua:</label>
                <input type="text" class="form-control" name="rua" placeholder="Exemplo: José de Abreu">
                </div>
                
                
                      <div class="form-row">
                <div class="form-group col-md-6">
                <label for="cor">Número:</label>
                <input type="text" class="form-control" name="numero" placeholder="Exemplo: N° 1234 ">
                
                </div>
                
                <div class="form-group col-md-6">
                <label for="ano">CEP:</label>
                <input type="text" class="form-control" name="cep" placeholder="Exemplo: 04952120">
                
                </div>
                      </div>
                
                <div class="form-group">
                <label for="classificacao">Gerente</label>
               <input type="text" class="form-control" name="gerente">
                </div>
                
                
                    <button type="submit" class="btn btn-dark">Salvar</button>&nbsp;
                   <button type="submit" class="btn btn-dark"
                            formaction="${pageContext.request.contextPath}/HomePage.jsp">Voltar</button>
                            
                            
                       <!-- botão que estava <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>-->
            </form>
      
                
                  
            </div>
            </div> 
            </div>
                  
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
    </body>
</html>
