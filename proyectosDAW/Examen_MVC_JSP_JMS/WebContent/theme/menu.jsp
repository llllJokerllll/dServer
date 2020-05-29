<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
            <!-- Cabeza -->
  			<div class="row align-items-center">
  				<div class="col-sm-2">
  					<img alt="Logotipo" src="theme/imaxes/logo.png" width="72px" height="72px">
  				</div>
  				<div class="col-sm-7">
  					<ul id="menu">
  					<%
  					String paxinaActual = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/") + 1).toString();
  					
  						String index = "";
  						String destinos = "";
  						String veiculos = "";
  						String visitas = "";
						if (paxinaActual.equalsIgnoreCase("inicio.jsp")) {
							index = "activo";
						} else if (paxinaActual.equalsIgnoreCase("avion.jsp") || paxinaActual.equalsIgnoreCase("barco.jsp") || paxinaActual.equalsIgnoreCase("coche.jsp")) {
							veiculos = "activo";
						} else if (paxinaActual.equalsIgnoreCase("londres.jsp") || paxinaActual.equalsIgnoreCase("paris.jsp") || paxinaActual.equalsIgnoreCase("sidney.jsp")) {
							destinos = "activo";
						} else if (paxinaActual.equalsIgnoreCase("visitaPaxinaView.jsp")) {
							visitas = "activo";
						}
  					%>
  						<li><a class="<%= index %>" href="inicio">INICIO</a></li>
  						<li><a class="<%= destinos %>" href="londres">DESTINOS</a></li>
  						<li><a class="<%= veiculos %>" href="avion">VEÍCULOS</a></li>
  						<li><a class="<%= visitas %>" href="visitaPaxinaView">VER VISITAS DE PÁXINAS</a></li>
  					</ul>
  				</div>
  				<div class="col-sm-3">
  				<p>Ola, usuario</p>
  				</div>
  			</div>
  			<!-- Fin Cabeza -->