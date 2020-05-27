<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="com.acarballeira.model.Produto , com.acarballeira.model.ProdutoDAO , java.util.ArrayList" %>		
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">
  					<h1>Produtos - Listado de Produtos</h1>
  					<%
  						if (request.getParameter("mensaxe") != null) {
  							out.println("<div class='alert alert-success'>" + request.getParameter("mensaxe") + "</div>");
  						}
	  					if (request.getParameter("erro") != null) {
							out.println("<div class='alert alert-danger'>" + request.getParameter("erro") + "</div>");
						}
  						
  						ProdutoDAO pDAO = new ProdutoDAO();
  						ArrayList<Produto> lista = pDAO.getAll();
  						if (lista.size() == 0) {
  							out.println("<h3>Non hay produtos que mostrar</h3>");
  						} else {
  							%>
  		   					<table class="table table-striped">
  		   						<tr>
  		   							<th>#</th>
  		   							<th>Nome</th>
  		   							<th>Prezo</th>
  		   							<th>Stock Actual</th>
  		   							<th>Accións</th>
  		   						</tr>
  		   						<%
  		   							for (Produto p : lista) {
  		   							%>
  		   								<tr>
  				   							<td><%= p.getId() %></td>
  				   							<td><%= p.getNome() %></td>
  				   							<td><%= p.getPrezo() %></td>
  				   							<td><%= p.getStockActual() %></td>
  				   							<td><a href="deleteProduto.jsp?id=<%= p.getId()%>">Eliminar </a><a href="updateProduto.jsp?id=<%= p.getId()%>"> Editar</a></td>
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