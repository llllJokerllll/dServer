<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.model.Produto , java.util.ArrayList" %>	
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">
  					<h1>Listado de Produtos</h1>
  					<% 
  					if (request.getAttribute("ok") != null) {
  						out.println("<div class='alert alert-success'>" + request.getAttribute("ok") + "</div>");
  					}
  					
  					if (request.getAttribute("error") != null) {
  						out.println("<div class='alert alert-danger'>" + request.getAttribute("error") + "</div>");
  					}
  						ArrayList<Produto> listado = (ArrayList<Produto>) request.getAttribute("listadoProdutos");
  						if (listado.size() == 0) {
  							out.println("<h3>Non hai produtos que mostrar</h3>");
  						} else {
  							%>
  							<table class="table table-striped">
  		   						<tr>
  		   							<th>ID</th>
  		   							<th>Nome</th>
  		   							<th>Prezo</th>
  		   							<th>Stock Mínimo</th>
  		   							<th>Stock Actual</th>
  		   							<th>Accións</th>
  		   						</tr>
  		   						<%
  		   							for (Produto p : listado) {
  		   							%>
  		   								<tr>
  				   							<td><%= p.getId() %></td>
  				   							<td><%= p.getNome() %></td>
  				   							<td><%= p.getPrezo() %></td>
  				   							<td><%= p.getStockMinimo() %></td>
  				   							<td><%= p.getStockActual() %></td>
  				   							<td><a href="deleteProduto?id=<%= p.getId()%>">Eliminar </a><a href="formUpdateProduto?id=<%= p.getId()%>"> Editar</a></td>
  				   						</tr>
  		   							<%
  		   							}
  		   						%>
  		   					</table>	
  							<%
  						}
  					%>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
					<%@ include file="menuLateral.jsp" %>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>