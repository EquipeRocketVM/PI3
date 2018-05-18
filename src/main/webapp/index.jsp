<%-- 
    Document   : index
    Created on : 15/05/2018, 14:13:24
    Author     : Matheus Maia
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
     <!-- esses links estão na pasta Includes, TEM QUE CHAMAR EM TODOS OS
     CÓDIGOS!!!  DENTRO DO HEADER ESTÁ O BOOSTRAP CSS -->
    <%@include file="WEB-INF/Includes/header.jsp" %>
    <body>
        <div class="container">
            <div class="row justify-content-md-center" style="margin-top: 50px">
                <div class="col-md-auto">
                    <h1>Locadora de Veiculos</h1>
                    <form action="${pageContext.request.contextPath}/Autenticar" method="post">

                        <div class="form-group">
                            <label>Login:</label>
                            <input type="text" class="form-control" name="login" />
                        </div>
                        <div class="form-group">
                            <label>Senha:</label>
                            <input type="password" class="form-control" name="senha" />
                        </div>
                        <div>
                            <button type="submit" class="btn btn-primary">Enviar</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
                    <!-- esses links estão na pasta script, colocar em todos os códigos -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    </body>
</html>
