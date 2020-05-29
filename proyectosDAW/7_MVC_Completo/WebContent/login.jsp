<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
	
	<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">
  					<h1>Formulario Login</h1>
  					
  					<form action="tramitaLogin" method="post">
						<label for="username">Nome de usuario</label>
						<input type="text" class="form-control" name="username" id="username" required/>
						<label for="pass">Password</label>
						<input type="password" class="form-control" name="pass" id="pass" required/>
						<br>
						<button type="submit" class="btn btn-primary">Enviar</button>
					</form>
  					
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>

  				</div>
  			</div>
  			<!-- Fin Medio -->
	
<%@ include file="theme/bottom.jsp" %>