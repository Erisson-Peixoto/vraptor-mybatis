<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Cadastro de Produto</title>
</head>
<body>

	<ul>
		<li><a href="<c:url value="/produtos"/>"> Voltar</a></li>
	</ul>

	<div style="width: 10%">
	<form action="<c:url value="/produtos"/>" method="POST"> 
		<fieldset>
			<legend>Adicionar Produto</legend>
			
			<label for="nome">Nome:</label> 
			<input id="nome" type="text" name="produto.nome" value="${produto.nome }"/> 
			
			<label for="descricao">Descrição:</label>
			<textarea id="descricao" name="produto.descricao">${produto.descricao }</textarea> <br>
			
			<label for="preco">Preço:</label> 
			<input id="preco" type="text" name="produto.preco" value="${produto.preco }"/>
			
			<label for="loteNum">Nº Lote:</label> 
			<input id="loteNum" type="text" name="produto.lote.numero" value="${produto.lote.numero }"/>
			
			<label for="loteData">Data Lote:</label> 
			<input id="loteData" type="text" name="produto.lote.data" value="${produto.lote.data }"/>
			
			<button type="submit">Salvar</button>
		</fieldset>
	</form>
</div>
	
	<div id="erros">
		<ul>
			<c:forEach items="${errors}" var="error">
				<li>${error.category } - ${error.message }</li>
			</c:forEach>
		</ul>
	</div>
	
</body>
</html>