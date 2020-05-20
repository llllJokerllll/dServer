<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.ej2.Empleado , java.time.LocalDate" %>	
  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Ejercicio 2 Empregado</h1>
  					<%
						if(request.getParameter("envio")!=null){
							String nombre = request.getParameter("nombre");
							double salario = Double.parseDouble(request.getParameter("salario"));
							int irpf = Integer.parseInt(request.getParameter("irpf"));
							int pagas = Integer.parseInt(request.getParameter("pagas"));
							LocalDate fechaNacimiento = LocalDate.parse(request.getParameter("fechaNacimiento"));
							
							Empleado e = new Empleado(nombre, salario, irpf, pagas, fechaNacimiento);
							out.println("<table class='table table-bordered'>");
							out.println("<tr><th>Nombre</th><th>Salario Bruto Anual</th><th>Salario Neto Mensual</th><th>Num. Pagas</th><th>Tiempo falta para jubilarse</th></tr>");
							out.println("<tr><td>" + e.getNombre() + "</td><td>" + e.getSalario() + " €</td><td>" + e.getSalarioMensualNeto() + " €</td><td>" + e.getPagas() + "</td><td>" + e.getTiempoParaJubilarse() + "</td></tr>");
							out.println("</table>");
		
		
		
						} else {
					%>
  					<form action="<%=request.getRequestURL() %>" method="GET">
						<div class="form-row">
							<div class="form-group col-lg-12">
								<label for="nombre">Nombre</label>
								<input type="text" name="nombre" id="nombre" required class="form-control"/>
							</div>
						</div>
						<div class="form-row">
								<div class="form-group col-md-6">
								<label for="salario">Salario</label>
								<input type="number" name="salario" id="salario" required class="form-control" step="0.01" value="0" min="0"/>
								</div>
								<div class="form-group col-md-6">
								<label for="irpf">IRPF</label>
								<input type="number" name="irpf" id="irpf" required class="form-control" step="1" value="0" min="0" max="100"/>
								</div>
						</div>
						<div class="form-row">
								<div class="form-group col-lg-6">
									<label for="pagas">Numero de pagas</label><br>
									<input name="pagas" id="pagas" type="radio" value="12" checked/> <label for="pagas">12</label>
									<input name="pagas" id="pagas" type="radio" value="14"/> <label for="pagas">14</label>
									<input name="pagas" id="pagas" type="radio" value="15"/> <label for="pagas">15</label>
									<input name="pagas" id="pagas" type="radio" value="16"/> <label for="pagas">16</label>
								</div>
								<div class="form-group col-lg-6">
									<label for="fechaNacimiento">Fecha de nacimiento</label>
									<input type="date" name="fechaNacimiento" id="fechaNacimiento" value="<%=LocalDate.now().minusYears(20) %>"/> 
								</div>
						</div>
						<button name="envio" type="submit" class="btn btn-info">Enviar</button>
					</form>
					<%
						}
					%>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  					<p>Texto</p>
  				</div>
  			</div>
  			<!-- Fin Medio -->
<%@ include file="theme/bottom.jsp" %>