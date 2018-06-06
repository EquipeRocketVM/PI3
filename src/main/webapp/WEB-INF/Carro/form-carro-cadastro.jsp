<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
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
                <input type="text" class="form-control" name="carro" placeholder="Fusca">
                
                </div>
                <div class="form-group col-md-6">
                <label for="fabricante">Fabricante</label>
                <input type="text" class="form-control" name="fabricante" placeholder="Fiat">
                </div>
                </div>
                
                <div class="form-group">
                <label for="cor">Cor</label>
                <input type="text" class="form-control" name="cor" placeholder="Vermelho">
                
                </div>
                
                <div class="form-group">
                <label for="ano">Ano</label>
                <input type="text" class="form-control" name="ano" placeholder="1999">
                
                </div>
                
                <div class="form-row">
                <div class="form-group col-md-6">
                <label for="valor">Valor</label>
                <input type="text" class="form-control" name="valor" placeholder="20000">
                
                </div>
                    
                <div class="form-group col-md-4">
                <label for="classificacao">Classificação</label>
                <select id="classificacao" class="form-control">
                    
                <option selected>Escolha...</option>
                <option>Hatch</option>
                <option>Sedan</option>
                <option>SUV</option>
                <option>Picapes</option>
                <option>Esportivos</option>
                <option>Vans</option>
                </select>
                
                </div>
                </div>
                
             <button type="submit" class="btn btn-dark">Salvar</button>&nbsp;
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
