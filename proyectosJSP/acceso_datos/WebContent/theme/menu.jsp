<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!-- Cabeza -->
  			<div class="row align-items-center">
  				<div class="col-sm-2">
  					<img alt="Logotipo" src="theme/imaxes/logo.png">
  				</div>
  				<div class="col-sm-7">
  					<ul id="menu">
  					<%
  					String paxinaActual = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).toString();
  					
  						String index = "";
  						String listarM = "";
						if (paxinaActual.equalsIgnoreCase("index.jsp")) {
							index = "activo";
						} else if (paxinaActual.equalsIgnoreCase("listarProdutos.jsp")) {
							listarM = "activo";
						}
  					%>
  						<li><a class="<%= index %>" href="index.jsp">Inicio</a></li>
  						<li><a class="<%= listarM %>" href="listarProdutos.jsp">Listado Produtos</a></li>
  						<li><a href="#">Offtopic</a></li>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  				</div>
  			</div>
  			<!-- Fin Cabeza -->