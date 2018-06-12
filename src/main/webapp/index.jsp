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
            <div class="row justify-content-md-center" style="margin-top: 100px">
                <div class="col-md-auto">
                    
                    <!-- arrumar para colocar a img -->
                    <a class="navbar-brand">
                        <img src="img/logopi.png" />
                    </a>
                    
                    <h1>Equipe Rocket</h1>
                    <br><br><br><br><br>
                    <form action="${pageContext.request.contextPath}/Autenticar" method="post">


                        <div class="form-label-group">
                            <input type="text" name="login" class="form-control" placeholder="Login" required autofocus>
                            <label for="inputEmail"></label>
                        </div>
                        <div class="form-label-group">
                            <input type="password" name="senha" class="form-control" placeholder="Senha" required>
                            <label for="inputPassword"></label>
                        </div>
                        <div>
                            <button class="btn btn-lg btn-primary btn-block" type="submit">Entrar</button>
                            <p class="mt-5 mb-3 text-muted text-center">&copy; Equipe Rocket 2018</p>

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
