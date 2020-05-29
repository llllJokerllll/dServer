<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, java.util.List, java.util.Collections"%>
	
	<ul id="menuLateral">
<%
	//out.println(paxinaActual);
	
	String[] paxinasVeiculos = {"avion.jsp", "barco.jsp", "coche.jsp"};
	String[] paxinasDestinos = {"londres.jsp", "paris.jsp", "sidney.jsp"};
	List<String> listaPaxinasVeiculos = new ArrayList<String>();
	List<String> listaPaxinasDestinos = new ArrayList<String>();
	Collections.addAll(listaPaxinasVeiculos, paxinasVeiculos);
	Collections.addAll(listaPaxinasDestinos, paxinasDestinos);
	
	String avion = "";
	String barco = "";
	String coche = "";
	String londres = "";
	String paris = "";
	String sidney = "";
	if (paxinaActual.equalsIgnoreCase("avion.jsp")) {
		avion = "activo";
	} else if (paxinaActual.equalsIgnoreCase("barco.jsp")) {
		barco = "activo";
	} else if (paxinaActual.equalsIgnoreCase("coche.jsp")) {
		coche = "activo";
	} else if (paxinaActual.equalsIgnoreCase("londres.jsp")) {
		londres = "activo";
	} else if (paxinaActual.equalsIgnoreCase("paris.jsp")) {
		paris = "activo";
	} else if (paxinaActual.equalsIgnoreCase("sidney.jsp")) {
		sidney = "activo";
	}
	
	if (listaPaxinasVeiculos.contains(paxinaActual)) {	
		out.println("<li><a class='" + avion + "' href='avion'>Avión</a></li>");
		out.println("<li><a class='" + barco + "' href='barco'>Barco</a></li>");
		out.println("<li><a class='" + coche + "' href='coche'>Coche</a></li>");
	} else if (listaPaxinasDestinos.contains(paxinaActual)) {
		out.println("<li><a class='" + londres + "' href='londres'>Londres</a></li>");
		out.println("<li><a class='" + paris + "' href='paris'>París</a></li>");
		out.println("<li><a class='" + sidney + "' href='sidney'>Sidney</a></li>");
	}
%>
	</ul>