<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List"%>
<%@ page import="site.vo.Exame"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<script
	src='http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js'></script>
<script type='text/javascript' src="menu_jquery.js"></script>

<script src="script/jquery-2.1.0.min.js"></script>
<script src="script/jquery.dataTables.js"></script>
<link href="dataTables.css" rel="stylesheet" type="text/css" />
<title>Clinica Lab - Laboratorio Medicinal</title>

<script>
	$(document).ready(function() {
		$('#tabelaresultadoexame').DataTable()({
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
			<h1>Cadastro de Resultado de Exames</h1>
			<p>
				<a href="ExameServlet"><img src="images/botaonovoresultado.png"></img></a>
			</p>
			
			<c:choose>
				<c:when test="${empty exames}">
					<p>Voc� n�o possui nenhum resultado de exame cadastrado!</p>
				</c:when>
				<c:otherwise>
					<table id="tabelaresultadoexame" class="display">
						<thead>
							<tr>
								<th id="paciente_resultado">Paciente</th>
								<th id="exame_resultado">Exame</th>
								<th id="data_exame">Data Exame</th>
								<th>Status</th>
								<th id="acoes">A��es</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="exame" items="${exames}">
								<tr>
									<td>${exame.paciente.nome_paciente}</td>
									<td>${exame.examelab.exame_nome}</td>
									<td>${exame.data_exame}</td>
									<td>${exame.status.status_nome}</td>
									<td><a
										href="ObterExameServlet?exame=${exame.id}"><img
											src="images/botaoeditar.png" id="imagemeditarresultado"></img></a>
											<a
										href="DeletarExameServlet?exame=${exame.id}"><img
											src="images/botaodeletar.png" id="imagemdeletarresultado"></img></a></td>
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