<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="java.util.*, com.acarballeira.ProbasContexto" %>
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Título da Páxina</h1>
  					<!-- JNDI -->
  					<%
  						//out.println(ProbasContexto.probas());
  						ServletContext sc = this.getServletContext();
  						out.println(sc.getRealPath(""));
  						out.println(sc.getRealPath("/WEB-INF/"));
  						out.println(sc.getSessionTimeout());
  						
  						// Objeto implícito
  						sc = config.getServletContext();
  					%>
  					
  					<p>Máis cousas</p>
  					
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>