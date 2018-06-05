<%-- 
    Document   : TipoCarro
    Created on : 10/05/2018, 16:23:32
    Author     : victor.galvao
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" integrity="sha384-WskhaSGFgHYWDcbwN70/dfYBj47jz9qbsMId/iRN3ewGhXQFZCSftd1LZCfmhktB" crossorigin="anonymous">
    </head>
    <body>
        <form action="${pageContext.request.contextPath}/CarregaOp"
              method="post">
            
                <div>
                Classificação:
                <select name="valor">
                    <option value="1">Hatch</option>
                    <option value="2">Sedan</option>
                    <option value="3">SUV</option>
                    <option value="4">Picapes</option>
                    <option value="5">Esportivos</option>
                    <option value="6">Vans</option>
                </select>
                </div>

            <button type="submit">Enviar</button>
            <p>
        </form>
               <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js" integrity="sha384-smHYKdLADwkXOn1EmN1qk/HfnUcbVRZyYmZ4qpPea6sjB/pTJ0euyQp0Mk8ck+5T" crossorigin="anonymous"></script>
    
    </body>
</html>
