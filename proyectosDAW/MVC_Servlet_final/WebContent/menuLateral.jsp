<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Collections"%>
	
	<ul id="menuLateral">
<%
	//out.println(paxinaActual);
	
	String[] paxinasProdutos = {"listProduto.jsp", "updateProduto.jsp", "formProduto.jsp", "deleteProduto.jsp", "inicio.jsp"};
	List<String> listaPaxinasProdutos = new ArrayList<String>();
	Collections.addAll(listaPaxinasProdutos, paxinasProdutos);
	
	String crear = "";
	String listar = "";
	if (paxinaActual.equalsIgnoreCase("formProduto.jsp")) {
		crear = "activo";
	} else if (paxinaActual.equalsIgnoreCase("listProduto.jsp")) {
		listar = "activo";
	}
	
	//if (paxinaActual.equalsIgnoreCase("listarProdutos.jsp") || paxinaActual.equalsIgnoreCase("createProduto.jsp") || paxinaActual.equalsIgnoreCase("index.jsp") || paxinaActual.equalsIgnoreCase("updateProduto.jsp") ) {
	if (listaPaxinasProdutos.contains(paxinaActual)) {	
		out.println("<li><a class='" + crear + "' href='formNewProduto'>Crear produto</a></li>");
		out.println("<li><a class='" + listar + "' href='listProduto'>Listar produtos</a></li>");
	}
%>
	</ul>