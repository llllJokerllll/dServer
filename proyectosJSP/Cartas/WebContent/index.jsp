<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="java.util.*, com.acarballeira.*" %>		

  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Cartas</h1>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>

  				</div>
  			</div>
  			<div class="col-md-12">
  				<table>
  					<tr>
	  			<% 
	  			int contador = 1;
					Baralla b = new Baralla();
					b.barallar();
					for(Carta c : b.getBaralla()){
						out.println("<td><img src='" + c + "' width='100px' height='150px'></td>");
						if (contador == 10) {
							contador = 0;
							out.println("</tr>");
						}
						contador++;
					}
				%>
				</table>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>