<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ page import="com.acarballeira.model.Produto , com.acarballeira.model.ProdutoDAO" %>		
  				
  				<%
  					if (request.getParameter("id") == null) {
  						response.sendRedirect("listarProdutos.jsp?erro=Non estás pasando un id");
  					} else {
  						ProdutoDAO pDAO = new ProdutoDAO();
  						Produto p = pDAO.get(Integer.parseInt(request.getParameter("id")));
  						if (pDAO.delete(p)) {
  							response.sendRedirect("listarProdutos.jsp?mensaxe=Eliminado guai");
  						} else {
  							response.sendRedirect("listarProdutos.jsp?erro=Non se deu eliminado");
  						}
  					}
  				%>
  					