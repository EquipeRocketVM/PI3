<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        <%@include file="WEB-INF/Includes/navbar.jsp" %>
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
                <!--<button type="button" class="btn btn-dark" <a href="${pageContext.request.contextPath}/HomePage.jsp"></a>>Voltar</button>
-->
 <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>
                    
        </form>
        </div>
        </div> 
        
    
          <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
