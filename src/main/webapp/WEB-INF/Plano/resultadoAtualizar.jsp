<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
  </head>
  <body>
    <h1>Plano: <c:out value="${planoUpdate.plano}" /> atualizada com sucesso</h1>
    <p>
        <a href= "${pageContext.request.contextPath}/HomePage.jsp" > Voltar </a>     
  </body>
</html>
