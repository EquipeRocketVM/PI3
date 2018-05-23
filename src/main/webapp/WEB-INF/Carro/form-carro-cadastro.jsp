<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        
        <div> 
            <h1 style="align-content: center">Cadastre um Carro:</h1><hr>
        </div>
        <div>
        <form>
                <div class="form-row">
                <div class="form-group col-md-6">
                <label for="carro">Carro</label>
                <input type="text" class="form-control" id="carro" placeholder="Carro">
                
                </div>
                <div class="form-group col-md-6">
                <label for="fabricante">Fabricante</label>
                <input type="text" class="form-control" id="fabricante" placeholder="Fabricante">
                </div>
                </div>
                
                <div class="form-group">
                <label for="cor">Cor</label>
                <input type="text" class="form-control" id="cor" placeholder="1234 Main St">
                
                </div>
                
                <div class="form-group">
                <label for="ano">Ano</label>
                <input type="text" class="form-control" id="ano" placeholder="Ano do carro">
                
                </div>
                
                <div class="form-row">
                <div class="form-group col-md-6">
                <label for="valor">Valor</label>
                <input type="text" class="form-control" id="valor">
                
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
                
            </form>

      
                <button type="submit">Enviar</button>
                <p>
            </form>
                  <p>
                  <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>      
                 
                  
        </div>
                  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
