<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="pagina">
<div id="conteudo">

<div id="ondestamos">
<h1>Onde estamos?</h1>
<ul>
  <li>Rua: Desconhecida n�40, proximo Av. das Amoreiras</li>
</ul>
<p>Acompanhe o mapa abaixo!</p>
<p>Horario de funcionamento: Seg a Sex das 09h as 17h e Sab e Dom das 08h ao 12h</p>
</div>

<h1>Contato</h1>
<p>Preencha os campos abaixo e envie sua duvida para n�s!</p>

<div id="formulario">


	<form id="duvida" action="DuvidaServlet" method="post">
					
			<c:if test="${not empty duvida}">
			<input type="hidden" name="idDuvida" value="${duvida.id_duvida}"/>
			</c:if>
			<p><label id="nome_contato" for="nome">Nome:</label><input id="nome" type="text" name="nome" value="${empty duvida ? param.nome : duvida.nome }"/></p>
			<p><label id="email_contato" for="email">Email:</label><input id="email" type="text" name="email" value="${empty duvida ? param.email : duvida.email}" /></p>
			<p><label id="mensagem_contato" for="mensagem" >Mensagem:</label>
			<textarea id="mensagem" name="mensagem" rows="6" cols="50" />${empty duvida ? param.mensagem : duvida.mensagem}</textarea></p>
			<input type="hidden" name="status" value="${duvida.status}"/>
			<p><input type="submit" value="Enviar" id="botaum" /></p>
	</form>
</div>
<div id="mapacontato">
<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3675.215546124018!2d-47.05248241050848!3d-22.905419268872684!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94c8c8b741925a85%3A0x7f65542c4ec76958!2sCentro%2C+Campinas+-+SP!5e0!3m2!1spt-BR!2sbr!4v1428498738040" width="800" height="230" frameborder="0" style="border:0"></iframe><!--  <img src="images/mapacontato.png" alt="Mapa contato"></img> -->
</div>
</div>
</div>