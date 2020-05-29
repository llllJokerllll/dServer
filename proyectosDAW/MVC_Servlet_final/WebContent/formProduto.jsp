<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="theme/top.jsp" %>
<%@ include file="theme/menu.jsp" %>	
<%@ page import="com.acarballeira.model.Produto , com.acarballeira.model.ProdutoDAO , java.util.ArrayList" %>	
  			
  			<!-- Medio -->
  			<div class="row my-2">
  				<div class="col-md-9">  					
  					<%
  						Produto p = (Produto)request.getAttribute("produto");
  					%>
  					<h1><%= p == null ? "Creación de Produto" : "Actualización de Produto"%></h1>
  						<!-- Conto coa variable de produto p -->
    				
					<form action="<%= p == null ? "createProduto" : "updateProduto"%>" method="POST" class="mb-3">
  						<div class="form-row">
  							<div class="form-group col-sm-6">
  								<label for="nome">Nome</label>
  								<input type="text" id="nome" name="nome" class="form-control" maxlength="50" value="<%= p != null ? p.getNome() : "" %>" autofocus required/>
  							</div>
  							<div class="form-group col-sm-6">
  								<label for="prezo">Prezo</label>
  								<input type="number" id="prezo" name="prezo" class="form-control" value="<%= p != null ? p.getPrezo() : "0.00" %>" max="9999999" step="0.01" required/>
  							</div>
  						</div>
  						<div class="form-row">
  							<div class="form-group col-sm-6">
  								<label for="stockMinimo">Stock Mínimo</label>
  								<input type="number" id="stockMinimo" name="stockMinimo" class="form-control" value="<%= p != null ? p.getStockMinimo() : "0" %>" max="9999999" required/>
  							</div>
  							<div class="form-group col-sm-6">
  								<label for="stockActual">Stock Actual</label>
  								<input type="number" id="stockActual" name="stockActual" class="form-control" value="<%= p != null ? p.getStockActual() : "0" %>" max="9999999" required/>
  							</div>
  						</div>
  						<div class="form-group">
  							<label for="descricion">Descrición</label>
  							<textarea class="form-control" id="descricion" name="descricion" maxlength="300"><%= p != null ? p.getDescricion() : "" %></textarea>
  						</div>

						<%
							if (p != null) {
								out.println("<input type='hidden' name='id' value='" + p.getId() + "'/>");
							}
						%>

  						<button type="submit" name="envio" class="btn btn-primary">Enviar</button>
  						<button type="reset" class="btn btn-warning">Eliminar</button>
  					</form>

  				</div>
  				<div class="col-md-3">
  					<h2>Lateral</h2>
					<%@ include file="menuLateral.jsp" %>
  				</div>
  			</div>
  			<!-- Fin Medio -->
  			
<%@ include file="theme/bottom.jsp" %>