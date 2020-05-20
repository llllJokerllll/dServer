<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>
<%@ page import="com.acarballeira.Palabra , java.util.ArrayList" %>	

  			<!-- Medio -->
  			<div class="row my-5">
  				<div class="col-md-9">
  					<h1>Sesiones Palabras</h1>
  					<%
						ArrayList<Palabra> palabras = (ArrayList<Palabra>) session.getAttribute("palabras");
						if(palabras == null){
							palabras = new ArrayList<Palabra>();
						}
							if(request.getParameter("envio")!=null){
								String palabra = request.getParameter("palabra");
								if(palabra != null && !palabra.equals(""));
								palabras.add(palabras.size(), new Palabra(palabra)); 
								session.setAttribute("palabras", palabras);
							} 
						
						%>
						<form action="<%=request.getRequestURL() %>" method="GET">
								<div class="form-group">
									<label for="palabra">Palabra</label>
									<input type="text" name="palabra" id="palabra" required/>
									<button name="envio" type="submit" class="btn btn-info">Añadir</button>
								</div>
						</form>
						<%
						
						if(palabras.size()>0){
							out.println("<ul class='list-group'>");
							for(Palabra p : palabras){
								out.println("<li class='lista'>" + p + "</li>");
							}
							out.println("</ul>");
						}
					%>
  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>