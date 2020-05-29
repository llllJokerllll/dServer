package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Produto;
import com.acarballeira.model.ProdutoDAO;

public class UpdateProdutoServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("title", "Actualización de Produto");
		
		String accion = request.getServletPath();
		
		switch(accion) {
		case "/formUpdateProduto":
			atendePeticionFormUpdateProduto(request, response);
			break;
		case "/updateProduto":
			atendePeticionUpdateProduto(request, response);
			break;
		default:
			response.sendRedirect("listProduto");
		}
	}

	private void atendePeticionUpdateProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdutoDAO pDAO = new ProdutoDAO();
		String nome = request.getParameter("nome");
		double prezo = Double.parseDouble(request.getParameter("prezo"));
		String descricion = request.getParameter("descricion");
		int stockMinimo = Integer.parseInt(request.getParameter("stockMinimo"));
		int stockActual = Integer.parseInt(request.getParameter("stockActual"));
		int id = Integer.parseInt(request.getParameter("id"));
		
		Produto p = new Produto(id, nome, prezo, descricion, stockMinimo, stockActual);
		
		if (pDAO.update(p)) {
			request.setAttribute("ok", "Produto actualizado correctamente");
		} else {
			request.setAttribute("error", "Problemas actualizando produto");
		}
		request.getRequestDispatcher("/listProduto").forward(request, response);
	}

	private void atendePeticionFormUpdateProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("id") != null) {
			ProdutoDAO pDAO = new ProdutoDAO();
			Produto p = pDAO.get(Integer.parseInt(request.getParameter("id")));
			request.setAttribute("produto", p);
			request.getRequestDispatcher("/formProduto.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "Non estás pasando un Id válido");
		}
		
		request.getRequestDispatcher("/listProduto").forward(request, response);
	}
}