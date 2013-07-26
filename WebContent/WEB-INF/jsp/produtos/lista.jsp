<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Produtos</title>

<style type="text/css">
.link {
	text-decoration: underline;
	border: none;
	background: none;
	color: red;
	cursor: pointer;
}
</style>

</head>
<body>
	<c:if test="${not empty mensagemCadastrar}">

		<script>
			alert("${mensagemCadastrar}");
		</script>

	</c:if>

	<c:if test="${not empty mensagemAlterar}">

		<script>
			alert("${mensagemAlterar}");
		</script>

	</c:if>
	<h3 align="center">Cadastro simples usando Framework de
		persitência MyBatis!!!</h3>
	<ul>
		<li><a href="<c:url value="/produtos/novo"/>">Novo Produto</a></li>
	</ul>
	<table border="1px">
		<thead>
			<tr class="odd">
				<th width="15%">Nome</th>
				<th width="25%">Descrição</th>
				<th width="20%" colspan="2">Preço</th>
				<th width="10%">Nº Lote</th>
				<th width="10%">Data Lote</th>
				<th width="10%">Editar</th>
				<th width="10%">Remover</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${produtoList}" var="produto">
				<tr>
					<td>${produto.nome }</td>
					<td>${produto.descricao }</td>
					<td align="left">R$</td>
					<td align="right">${produto.preco }</td>
					<td>${produto.lote.numero }</td>
					<td><fmt:formatDate pattern="dd/MM/yyyy" value="${produto.lote.data }" /> </td>
					<td><a href="<c:url value="/produtos/${produto.id}"/>">Editar</a></td>
					<td>
						<form action="<c:url value="/produtos/${produto.id}"/>"
							method="POST">
							<button class="link" name="_method" value="DELETE">Remover</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<br>
	<br>
	<form action="<c:url value="/produtos/pesquisa"/>" method="GET">
		Busca <input id="nomeBusca" type="text" name="nomeBusca" />
		<button type="submit">Buscar</button>
	</form>

	<c:if test="${not empty nomeDigitado}">
		<h5>Nome encontrado: '${nomeDigitado}'</h5>
	</c:if>
	
	<table border="1px">
		<thead>
			<tr class="odd">
				<th width="15%">Nome</th>
				<th width="25%">Descrição</th>
				<th width="20%" colspan="2">Preço</th>
				<th width="10%">Nº Lote</th>
				<th width="10%">Data Lote</th>
				<th width="10%">Editar</th>
				<th width="10%">Remover</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${buscaLista}" var="produto">
				<tr>
					<td>${produto.nome }</td>
					<td>${produto.descricao }</td>
					<td align="left">R$</td>
					<td align="right">${produto.preco }</td>
					<td>${produto.lote.numero }</td>
					<td>  <fmt:formatDate value="${produto.lote.data }" type="both" pattern="dd/MM/yyyy" /> </td>
					<td><a href="<c:url value="/produtos/${produto.id}"/>">Editar</a></td>
					<td>
						<form action="<c:url value="/produtos/${produto.id}"/>"
							method="POST">
							<button class="link" name="_method" value="DELETE">Remover</button>
						</form>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

</body>
</html>