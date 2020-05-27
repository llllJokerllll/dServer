<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="com.acarballeira.model.Produto , com.acarballeira.model.ProdutoDAO , java.util.ArrayList" %>		
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">
  					<h1>Produtos - Crear produto</h1>
  					
  					<%
  					Produto p = null;
  						if (request.getParameter("envio") != null) {
  							String nome = request.getParameter("nome");
  							double prezo = Double.parseDouble(request.getParameter("prezo"));
  							int stockMinimo = Integer.parseInt(request.getParameter("stockMinimo"));
  							int stockActual = Integer.parseInt(request.getParameter("stockActual"));
  							String descricion = request.getParameter("descricion");
  							
  							p = new Produto(nome, prezo, descricion.equals("") ? null : descricion , stockMinimo, stockActual);
  							ProdutoDAO pDAO = new ProdutoDAO();
  							if (pDAO.save(p)) {
  								//out.println("Todo foi ben");
  								response.sendRedirect("listarProdutos.jsp?mensaxe=Todo foi ben");
  							} else {
  								//out.println("Todo foi mal");
  								response.sendRedirect("listarProdutos.jsp?erro=Todo foi mal");
  							}
  						} else {
  					%>
  						<%@ include file="_formProduto.jsp" %>	
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