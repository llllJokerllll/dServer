<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="com.acarballeira.model.Produto , com.acarballeira.model.ProdutoDAO , java.util.ArrayList" %>		
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">
  				
  				<%
  					if (request.getParameter("id") == null) {
  						response.sendRedirect("listarProdutos.jsp?erro=Non estás pasando un id");
  					} else {
  						ProdutoDAO pDAO = new ProdutoDAO();
  						Produto p = pDAO.get(Integer.parseInt(request.getParameter("id")));
  				%>
  					<h1>Produtos - Actualizar produto <%= p.getId() %></h1>
  					
  					<%
  						if (request.getParameter("envio") != null) {
  							String nome = request.getParameter("nome");
  							double prezo = Double.parseDouble(request.getParameter("prezo"));
  							int stockMinimo = Integer.parseInt(request.getParameter("stockMinimo"));
  							int stockActual = Integer.parseInt(request.getParameter("stockActual"));
  							String descricion = request.getParameter("descricion");
  							
  							p = new Produto(nome, prezo, descricion == "" ? null : descricion , stockMinimo, stockActual);
  							pDAO = new ProdutoDAO();
  							p.setId(Integer.parseInt(request.getParameter("id")));
  							if (pDAO.update(p)) {
  								response.sendRedirect("listarProdutos.jsp?mensaxe=Produto actualizado correctamente");
  							} else {
  								response.sendRedirect("listarProdutos.jsp?erro=Produto non actualizado");
  							}
  						} else {
  					%>
  						<%@ include file="_formProduto.jsp" %>
  					<%
  						} // else2
  					} // else1
  					%>				
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<%@ include file="menuLateral.jsp" %>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>