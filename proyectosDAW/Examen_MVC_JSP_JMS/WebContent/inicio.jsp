<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="javax.naming.InitialContext , javax.naming.Context" %>
<%
	Context ic = new InitialContext();
	String a1 = (String) ic.lookup("java:comp/env/author1");
%>	
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-12" align="center">
  					<h1>Exame de JSP-Servlets. Travelling &amp; browsing</h1>
  					<img alt="Destinos_de_vacaciones" src="theme/imaxes/viajes.jpg" width="600px" height="300px">
  					<p>Creador da páxina, obtido do web.xml: <%= a1 %></p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>