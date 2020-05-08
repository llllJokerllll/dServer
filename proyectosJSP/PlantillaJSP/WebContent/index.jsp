<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="java.util.Random, com.acarballeira.Persoa" %>		
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Título da Páxina</h1>
  					<%
  						Random aleatorio = new Random();
  						int a = aleatorio.nextInt();
  						out.println(a);
  					%>
  					
  					<p><%= a %></p>
  					
  					<p>Máis cousas</p>
  					
  					<%
  						Persoa p = new Persoa("Julio", 34);
  						out.println(p);
  					%>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>