<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="java.util.Random, com.acarballeira.Persoa" %>		
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Formulario</h1>
  					<%-- Obxectos implícitos de JSP: out, request, response, session, --%>
  					<%
  						if (request.getParameter("envio") != null) {
  							String nome = request.getParameter("nome");
  							int idade = Integer.parseInt(request.getParameter("idade"));
  							// Creamos a persoa
  							Persoa p = new Persoa(nome, idade);
  							// Gardámola en BD, imprimímola, ...
  							out.println("Persoa cos datos :<br>Nome: " + p.getNome() + ", idade: " + p.getIdade());
  						} else {
  					%>
  					
  					<form action="formulario.jsp" method="GET">
  						<div class="form-group">
  							<label for="nome">Nome</label>
  							<input type="text" name="nome" id="nome" class="form-control" required>
  						</div>
  						<div class="form-group">
  							<label for="idade">Idade</label>
  							<input type="number" name="idade" id="idade" class="form-control" required>
  						</div>
  						<button type="submit" class="btn btn-primary" name="envio" value="1">Enviar</button>
  					</form>
  					<%
  						}
  					%>
  					
  					
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>