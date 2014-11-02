<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script type='text/javascript' src="menu_jquery.js"></script>
<link rel="stylesheet" type="text/css" href="estilos.css"/>
<title>Hue - Laboratorio Medicinal</title>
</head>
<body>
<div id="cabecalho">
	<%@include file="inicio.jsp" %>
	<%@include file="paginasjsp/menu.jsp" %>


</div>
<div id="pagina">
<div id="conteudo">
		<div id="verificarcod">
		<fieldset>
			<label><b>Deseja verificar um exame ?</b></label><br/>
			<label class="requerido" id="labelCodigo" for="codigo">Insira seu c�digo abaixo: </label><br/>
			<input type="text" id="codigo"></input><br/>
			<a href='consultaCod.html'><input type="submit" value="Buscar"/></a>
		</fieldset>
		</div>
</div>
	
	<%@include file="paginas/rodape.html" %>
</div>	
	
</body>
</html>