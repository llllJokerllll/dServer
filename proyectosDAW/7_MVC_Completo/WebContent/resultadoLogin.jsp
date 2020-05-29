<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>

				<!-- Medio -->
	  			<div class="row my-2">
	  				<div class="col-md-9">
	  					<h1>Formulario Login Resultado</h1>
						Mostra éxito ou fracaso
						<%
							//String exito = (String) request.getAttribute("exito");
							//out.println(exito);
						%>
						${exito} <!-- EL: expression language. JSTL: Java Standard Tag Library -->
					</div>
			  			<div class="col-md-3">
			  				<h2>Lateral</h2>
			
			  			</div>
			  		</div>
			  		<!-- Fin Medio -->

<%@ include file="theme/bottom.jsp" %>