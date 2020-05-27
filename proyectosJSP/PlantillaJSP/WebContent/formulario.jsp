<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="java.util.Random, com.acarballeira.Persoa" %>		
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-12">
  					<h1>Formulario</h1>
  					<%-- Obxectos implícitos de JSP: out, request, response, session, --%>
  					<%
  						out.println(request.getRemotePort() + " " + request.getRemoteHost() + "<br>");
  						out.println(request.getRemoteAddr() + " " + request.getRemoteUser() + "<br>");
  						out.println(request.getRequestURI() + "<br>"); //Para obtener la dirección parcial de la página web
  						out.println(request.getRequestURL() + "<br>"); //Para obtener la dirección completa de la página web
  						out.println(request.getQueryString() + "<br>"); //Para obtener los valores pasados en la URL
  					%>
  					<%
  						if (request.getParameter("envio") != null) {
  							String nome = request.getParameter("nome");
  							int idade = Integer.parseInt(request.getParameter("idade"));
  							// Creamos a persoa
  							Persoa p = new Persoa(nome, idade);
  							// Gardámola en BD, imprimímola, ...
  							out.println("Persoa cos datos :<br>Nome: " + p.getNome() + ", idade: " + p.getIdade());
  							
  							String[] aficions = request.getParameterValues("aficion[]");
  							if (aficions != null) {
  								for(String af : aficions) {
  	  								out.println("<br>" + af);
  	  							}
  							}
  							
  							String[] marcas = request.getParameterValues("marcasPreferidas");
  							if (marcas != null) {
  								for(String ma : marcas) {
  	  								out.println("<br>" + ma);
  	  							}
  							}
  						} else {
  					%>
  					
  					<form action="formulario.jsp" method="GET">
  						<div class="form-group">
  							<div class="form-group col-lg-10 col-sm-8">
	  							<label for="nome">Nome</label>
	  							<input type="text" name="nome" id="nome" class="form-control" required>
	  						</div>
	  						<div class="form-group col-lg-2 col-sm-4">
	  							<label for="idade">Idade</label>
	  							<input type="number" name="idade" id="idade" class="form-control" required>
	  						</div>
  						</div>
  						<div class="form-group">
  							<label>Fútbol</label><input type="checkbox" name="aficion[]" value="Futbol"/>
  							<label>Baloncesto</label><input type="checkbox" name="aficion[]" value="Baloncesto"/>
  							<label>Tenis</label><input type="checkbox" name="aficion[]" value="Tenis"/>
  							<label>Nada</label><input type="checkbox" name="aficion[]" value="Nada"/>
  						</div>
  						<div class="form-group">
  							<label>Marcas Preferidas</label>
  							<select name="marcasPreferidas" multiple class="form-control">
  								<option value="Honda">Honda</option>
  								<option value="Audi">Audi</option>
  								<option value="BMW">BMW</option>
  								<option value="Mercedes">Mercedes</option>
  							</select>
  						</div>
  						<button type="submit" class="btn btn-primary" name="envio" value="1">Enviar</button>
  					</form>
  					<%
  						}
  					%>
  					
  					
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>