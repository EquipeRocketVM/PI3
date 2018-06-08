<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Carros Disponiveis</h1>
    <div>
        
        <!-- estou testando aqui para ver o botao de pesquisar por nome precisa fazer um novo select varias coisas
         TUDO NO:FORM-CARRO-CADASTRO; LISTAR CARRO; BUSCARCARROSERVLET;
        DAOCARRO;FORM-CARRO-RESULTADO;RESULTADOATUALIZAR--> 
        <form action="${pageContext.request.contextPath}/buscar-carro?idcarro=" 
                  method="post">
       <input type="text" name="carro">  
       <button type="submit">Pesquisar</button>
        </form>
        <label id="labelPesquisaCarro" text="Teste"></label>
        
        
      <ul>
	<c:forEach items="${lista}" var="p">
	  <li>
	    <h2><a href='http://localhost:8080/agendaweb-1.0-SNAPSHOT/buscar-carro?idcarro="${p.idcarro}"'> Carro: <c:out value="${p.carro}" /> </a></h2>
	    <h2>Fabricante: <c:out value="${p.fabricante}" /></h2>
            <h2>Cor: <c:out value="${p.cor}" /></h2>
            <h2>Ano: <c:out value="${p.ano}" /></h2>
            <h2>Valor: <c:out value="${p.valor}" /></h2>
            <h2>Classificao <c:out value="${p.classificacao}" /></h2>
	  </li>
	</c:forEach>
      </ul> <p>
        <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a> 
    </div>
  </body>
</html>
