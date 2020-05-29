<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.model.PaxinaVisita , java.util.ArrayList" %>
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-12">
  					<h1>Visualizacións ordeadas por data descendente</h1>
  					<% 
  						ArrayList<PaxinaVisita> listado = (ArrayList<PaxinaVisita>) request.getAttribute("listadoVisitas");
  						if (listado.size() == 0) {
  							out.println("<h3>Non hai visitas que mostrar</h3>");
  						} else {
  							%>
  							<table class="table table-striped">
  		   						<tr>
  		   							<th>Data</th>
  		   							<th>Hora</th>
  		   							<th>URL</th>
  		   							<th>Servlet</th>
  		   							<th>Ruta servlet</th>
  		   							<th>JSP Vista</th>
  		   						</tr>
  		   						<%
  		   							for (PaxinaVisita p : listado) {
  		   							%>
  		   								<tr>
  				   							<td><%= p.getData() %></td>
  				   							<td><%= p.getHora() %></td>
  				   							<td><%= p.getUrlsolicitude() %></td>
  				   							<td><%= p.getClaseservlet() %></td>
  				   							<td><%= p.getRutaservlet() %></td>
  				   							<td><%= p.getJspvista() %></td>
  				   						</tr>
  		   							<%
  		   							}
  		   						%>
  		   					</table>	
  							<%
  						}
  					%>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>