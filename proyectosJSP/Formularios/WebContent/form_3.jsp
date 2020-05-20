<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.ej3.Jugador , java.time.LocalDate" %>	

  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Ejercicio 3 Jugador en Paro</h1>
  					<%
						if(request.getParameter("envio")!=null){
							String nombre = request.getParameter("nombre");
							String apellido = request.getParameter("apellido");
							int telefono = Integer.parseInt(request.getParameter("telefono"));
							int movil = Integer.parseInt(request.getParameter("movil"));
							String email = request.getParameter("email");
							double estatura = Double.parseDouble(request.getParameter("estatura"));
							String posicion = request.getParameter("posicion");
							String[] idiomas = request.getParameterValues("idioma");
							String[] meritos = request.getParameterValues("meritos");
							String observaciones = request.getParameter("observaciones");
							
							Jugador j = new Jugador(nombre, apellido, telefono, movil, email, estatura, posicion, idiomas, meritos, observaciones);
							out.println("<ul>");
							out.println("<li><b>Nombre: </b>" + j.getNombre() + "</li><br>");
							out.println("<li><b>Apodo: </b>" + j.getApellido() + "</li><br>");
							out.println("<li><b>Teléfono: </b>" + j.getTelefono() + "</li><br>");
							out.println("<li><b>Móvil: </b>" + j.getMovil() + "</li><br>");
							out.println("<li><b>Email: </b>" + j.getEmail() + "</li><br>");
							out.println("<li><b>Estatura: </b>" + j.getEstatura() + "</li><br>");
							out.println("<li><b>Idiomas: </b>" + j.idiomasToString() + "</li><br>");
							out.println("<li><b>Posición: </b>" + j.getPosicion() + "</li><br>");
							out.println("<li><b>Guapo: </b>" + j.getMerito("Guapo") + "</li><br>");
							out.println("<li><b>Inteligente: </b>" + j.getMerito("Listo") + "</li><br>");
							out.println("<li><b>Salgo de noche: </b>" + j.getMerito("No salgo de noche") + "</li><br>");
							out.println("<li><b>Observaciones: </b>" + j.getObsevaciones() + "</li><br>");
							out.println("</ul>");
						} else {
				
					%>
					<form action="<%=request.getRequestURL() %>" method="GET">
						<div class="form-row">
							<div class="form-group col-lg-6">
								<label for="nombre">Nombre</label>
								<input type="text" maxlength="50" name="nombre" id="nombre" class="form-control" required/>
							</div>
							<div class="form-group col-lg-6">
								<label for="apellido">Apodo</label>
								<input type="text" maxlength="50" name="apellido" id="apellido" class="form-control" required/>
							</div>
						</div>
						<div class="form-row">
								<div class="form-group col-md-6">
								<label for="telefono">Teléfono</label>
								<input type="number" name="telefono" id="telefono" class="form-control" value="0" min="100000000" max="999999999" required/>
								</div>
								<div class="form-group col-md-6">
								<label for="movil">Móvil</label>
								<input type="number" name="movil" id="movil" class="form-control" value="0" min="100000000" max="999999999" required/>
								</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-6">
								<label for="email">Email</label>
								<input type="email" name="email" id="email" class="form-control" required/>
							</div>
								<div class="form-group col-md-6">
								<label for="estatura">Estatura</label>
								<input type="number" name="estatura" id="estatura" class="form-control" step="0.01" max="2.80" min="0" value="0" required/>
								</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-6">
								<label for="idioma">Idiomas(Elige uno o varios)</label>
								<select name="idioma" id="idioma" multiple class="form-control" required>
									<option value="Español">Español</option>
									<option value="Gallego">Gallego</option>
									<option value="Ingles">Inglés</option>
									<option value="Frances">Francés</option>
								</select>
							</div>
							<div class="form-group col-lg-6">
								<label for="posicion">Posición preferida</label>
								<select name="posicion" class="form-control">
									<option value="Delantero">Delantero</option>
									<option value="Defensa">Defensa</option>
									<option value="Centro">Centro</option>
									<option value="Portero">Portero</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-6">
								<label>Otros méritos</label><br>
								<input type="checkbox" name="meritos"  value="Guapo"/> <label> Soy guapo</label><br>
								<input type="checkbox" name="meritos"  value="Listo"/> <label> Soy inteligente</label><br>
								<input type="checkbox" name="meritos" value="No salgo de noche"/> <label>No salgo por la noche</label><br>
								
								
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-lg-12">
								<label for="observaciones">Observaciones</label>
								<textarea name="observaciones" id="observaciones" class="form-control"></textarea>
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