<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="site.vo.Paciente"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script type='text/javascript' src="menu_jquery.js"></script>
<link rel="stylesheet" type="text/css" href="estilos.css" />

<script src="script/jquery-2.1.0.min.js"></script>
<script src="script/jquery.dataTables.js"></script>
<link href="dataTables.css" rel="stylesheet" type="text/css" />


<title>Clinica Lab - Laboratorio Medicinal</title>

<script>
	$(document).ready(function() {
		$('#tabelagestor').DataTable()({
			"pagingType" : "full_numbers",
			"lengthMenu" : "Display 10 records"

		});
	});
</script>


</head>
<body>

	<%@include file="inicio.jsp"%>
	<%@include file="paginasjsp/menu.jsp"%>

	<c:if test="${empty loginUsuario}">
		<jsp:forward page="index.jsp" />
	</c:if>

	<div id="pagina">
		<div id="conteudo">
		<h1>Cadastro de Gestor</h1>
			<p>
				<a href="montaGestor.jsp"><img src="images/botaogestor.png"></img></a>
			</p>

			<c:choose>
				<c:when test="${empty usuarios}">
					<p>Nenhum Gestor cadastrado!</p>
				</c:when>
				<c:otherwise>
					<table id="tabelagestor" class="display">
						<thead>
							<tr>
								<th>Nome/Login</th>
								<th>Telefone</th>
								<th>Email</th>

								<th >A��es</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="gestor" items="${usuarios}">

								<tr>
									<td>${gestor.nome}</td>
									<td>${gestor.telefone}</td>
									<td>${gestor.email}</td>
									<td><a
										href="ObterGestorServlet?gestor=${gestor.id_usuario}"><img
											src="images/botaoeditar.png"></img></a>
											<a
										href="DeletarGestorServlet?gestor=${gestor.id_usuario}"><img
											src="images/botaodeletar.png"></img></a></td>
								</tr>

							</c:forEach>
						</tbody>

					</table>

				</c:otherwise>
			</c:choose>


		</div>
	</div>
	<%@include file="paginas/rodape.html"%>
</body>
</html>