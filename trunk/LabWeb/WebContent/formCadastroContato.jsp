<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:include page="mensagem.jsp"/>
<div id="pagina">
<div id="conteudo">
<div id="formulario">


	<form id="duvida" action="DuvidaServlet" method="post">
					
			<c:if test="${not empty duvida}">
			<input type="hidden" name="idDuvida" value="${duvida.id_duvida}"/>
			</c:if>
			<p><label for="nome">Nome</label><br/> <input type="text" name="nome" value="${empty duvida ? param.nome : duvida.nome }"/></p>
			<p><label for="email">Email</label> <br /> <input type="text" name="email" value="${empty duvida ? param.email : duvida.email}" /></p>
			<p><label for="mensagem">Mensagem</label><br/><textarea rows="4" cols="50" id="mensagem" name="mensagem" value="${empty duvida ? param.mensagem : duvida.mensagem}"/></textarea></p>
			<input type="hidden" name="status" value="${duvida.status}"/>
			
			<input type="submit" value="Enviar" />
	</form>
</div>
</div>
</div>