<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table border="1px">
		<thead>
			<tr class="odd">
				<th width="20%">Nome</th>
				<th width="40%">Descrição</th>
				<th width="20%" colspan="2">Preço</th>
				<th width="10%">Editar </th> 
				<th width="10%">Remover </th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${produtoList}" var="produto">
				<tr>
					<td>${produto.nome }</td>
					<td>${produto.descricao }</td>
					<td align="left">R$</td>
					<td align="right">${produto.preco }</td>
					<td><a href="<c:url value="/produtos/${produto.id}"/>">Editar</a></td>
					<td>
						<form action="<c:url value="/produtos/${produto.id}"/>" method="POST">
							<button class="link" name="_method" value="DELETE">Remover</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>