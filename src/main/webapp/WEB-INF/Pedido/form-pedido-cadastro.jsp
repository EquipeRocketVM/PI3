<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div>
            <h1>Cadastre um Pedido!</h1>
        </div>
         <div style="align-content: center">
        <div>
            <form action="${pageContext.request.contextPath}/cadastro-pedido"
                  method="post">

                <div>
                    Planos:
                    <select name="id_plano">
                    <c:forEach items="${listaPlano2}" var="p">                                    
                    <option value="${p.idplano}"> ${p.plano}</option>                    
                    </c:forEach>
                            </select>
                </div> <p>

                <div>
                    Carros:
                    <select name="idcarro">
                        <c:forEach items="${listaCarro2}" var="p">
                            <option value="${p.idcarro}"> ${p.carro}</option>                 
                        </c:forEach>
                    </select>
                </div>
                <!--<div>
                    Id Funcionario: <input type="text" name="id_funcionario" />
                </div> a definir ainda a classe de pessoa--> 


                <div>
                    Filiais:
                    <select name="idfilial">
                    <c:forEach items="${listaFilial}" var="p">
                      <option value="${p.id}"> ${p.nomeUnidade}</option>     
                    </c:forEach>
                     </select>
                </div>


                <div>
                    Data Locação: <input type="date" name="dtlocacao" />
                </div>
                <div>
                    Data Devolução: <input type="date" name="dtdevolucao" />
                </div>

                <button type="submit">Enviar</button>
                <p>
                    
            </form>
        </div>
            <a href= "http://localhost:8080/agendaweb-1.0-SNAPSHOT/HomePage.jsp" > Voltar </a>  
 <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>

    </body>
</html>
