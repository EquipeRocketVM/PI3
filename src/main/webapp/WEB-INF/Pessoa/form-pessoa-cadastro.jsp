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
            
            <!-- navbar adicionada-->
        </p>


        <div class="container">
        
        <div> 
            <h1 style="align-content: center">Cadastre um Cliente: </h1><hr>
            <br>
        </div>
        
            <div style="align-content: center">
            <form action="${pageContext.request.contextPath}/cadastro-cliente"
                  method="post">
              <div class="form-group">
                <label for="nome">Nome</label>
                <input type="email" class="form-control" name="nome" placeholder="Ex José">
        </div>
        <div class="form-group">
                <label for="sobrenome">Sobrenome</label>
                <input type="password" class="form-control" name="sobrenome" placeholder="Ex Ernaldo">
        </div>
        
        <div class="form-group">
                <label for="endereço">Endereço Residêncial</label>
                <input type="text" class="form-control" name="inputAddress" placeholder=" Ex Sto Amaro n° 1234 ">
        </div>
        
        <div class="form-row">
        <div class="form-group col-md-6">
                 <label for="cidade">Cidade</label>
                <input type="text" class="form-control" name="cidade">
        </div>
        <div class="form-group col-md-4">
             <label for="estado">Estado</label>
                 <select name="estado" class="form-control">
                    <option selected>Escolha o Estado...</option>
                    <option> AC </option>
                    <option> AL </option>
                    <option> AP </option>
                    <option> AM </option>
                    <option> BA </option>
                    <option> CE </option>
                    <option> DF </option>
                    <option> ES </option>
                    <option> GO </option>
                    <option> MA </option>
                    <option> MT </option>
                    <option> MS </option>
                    <option> MG </option>
                    <option> PA </option>
                    <option> PB </option>
                    <option> PR </option>
                    <option> PE </option>
                    <option> PI </option>
                    <option> RJ </option>
                    <option> RN </option>
                    <option> RS </option>
                    <option> RO </option>
                    <option> RR </option>
                    <option> SC </option>
                    <option> SP </option>
                    <option> SE </option>
                    <option> TO </option>
                    
                    
                 </select>
        </div>
        <div class="form-group col-md-2">
                     <label for="cep">CEP</label>
                 <input type="text" class="form-control" name="cep">
        </div>
        </div>
                <div class="form-group">
                <label for="email"> Email </label>
                <input type="text" class="form-control" name="email" placeholder="Ex jose.oliveira@gmail.com">
        </div>
                <!--  não sei colocar o calendário do lado-->
                <div class="form-row">
                     <div class="form-group col-md-6">
                <label for="data">Data Nascismento</label>
                <input type="date" class="form-control" name="data">
        </div>
                   <div class="form-group col-md-6">
                <label for="cpf">Cpf</label>
                <input type="text" class="form-control" name="cpf" placeholder=" ex 47602342844">
                </div>  
                </div>
                 <div class="form-group">
                <label for="telefone"> Telefone </label>
                <input type="text" class="form-control" name="telefone" placeholder="Ex 953247642">
        </div>
               
                 <div class="form-group">
                <label for="cnh"> CNH </label>
                <input type="text" class="form-control" name="cnh">
        </div>
                 <div class="form-group">
                <label for="renda"> Renda Mensal </label>
                <input type="text" class="form-control" name="renda">
        </div>                              
                <button type="button" class="btn btn-dark">Salvar</button>&nbsp;
                 <button type="submit" class="btn btn-dark"
                            formaction="${pageContext.request.contextPath}/HomePage.jsp">Voltar</button>
                            
                <!--<a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>-->
                            
                            
                    
        </form>
        </div>
        </div> 
        
    
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
