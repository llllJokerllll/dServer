<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.ej1.Tarot" %>	
  			
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Ejercicio 1 Tarot</h1>
  					<%
  					if (request.getParameter("envio") != null){
  						String fecha = request.getParameter("fecha");
  						if (fecha != null && fecha.matches("[0-9]{4}-[0-9]{2}-[0-9]{2}")){
  							Tarot t = new Tarot(fecha);
  							out.println("<p>El número del tarot de la fecha " + fecha + " es " + t.getNumero() + "</p>");
  						}
  						

  					} else {	
   					%>
  					<form action="<%=request.getRequestURL() %>" method="GET">
						<div class="form-group">
							<label for="fecha">Fecha</label>
							<input type="date" name="fecha" id="fecha" required class="form-control"/>
						</div>
						<button name="envio" type="submit" class="btn btn-info">Enviar</button>
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