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

<h3>Produto adicionado com sucesso!</h3>

	<ul>
		<li><a href="<c:url value="/produtos/formulario"/>"> Novo Produto </a></li>
		<li><a href="<c:url value="/produtos/lista"/>"> Lista Produtos </a></li>
	</ul>

</body>
</html>