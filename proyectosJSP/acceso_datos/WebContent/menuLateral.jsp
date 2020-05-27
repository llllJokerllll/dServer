<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Collections"%>
	
	<ul id="menuLateral">
<%
	//out.println(paxinaActual);
	
	String[] paxinasProdutos = {"listarProdutos.jsp", "updateProduto.jsp", "createProduto.jsp", "deleteProduto.jsp", "index.jsp"};
	List<String> listaPaxinasProdutos = new ArrayList<String>();
	Collections.addAll(listaPaxinasProdutos, paxinasProdutos);
	
	String crear = "";
	String listar = "";
	if (paxinaActual.equalsIgnoreCase("createProduto.jsp")) {
		crear = "activo";
	} else if (paxinaActual.equalsIgnoreCase("listarProdutos.jsp")) {
		listar = "activo";
	}
	
	//if (paxinaActual.equalsIgnoreCase("listarProdutos.jsp") || paxinaActual.equalsIgnoreCase("createProduto.jsp") || paxinaActual.equalsIgnoreCase("index.jsp") || paxinaActual.equalsIgnoreCase("updateProduto.jsp") ) {
	if (listaPaxinasProdutos.contains(paxinaActual)) {	
		out.println("<li><a class='" + crear + "' href='createProduto.jsp'>Crear produto</a></li>");
		out.println("<li><a class='" + listar + "' href='listarProdutos.jsp'>Listar produtos</a></li>");
	}
%>
	</ul>