package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Produto;
import com.acarballeira.model.ProdutoDAO;

public class CreateProdutoServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("title", "Creando Produto");
		
		String accion = request.getServletPath();
		
		switch(accion) {
		case "/formNewProduto":
			atendePeticionFormNewProduto(request, response);
			break;
		case "/createProduto":
			atendePeticionCreateProduto(request, response);
			break;
		default:
			response.sendRedirect("listProduto");
		}
	}

	private void atendePeticionCreateProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdutoDAO pDAO = new ProdutoDAO();
		String nome = request.getParameter("nome");
		double prezo = Double.parseDouble(request.getParameter("prezo"));
		String descricion = request.getParameter("descricion");
		int stockMinimo = Integer.parseInt(request.getParameter("stockMinimo"));
		int stockActual = Integer.parseInt(request.getParameter("stockActual"));
		
		Produto p = new Produto(nome, prezo, descricion, stockMinimo, stockActual);
		if (pDAO.save(p)) {
			request.setAttribute("ok", "Produto dado de alta correctamente");
		} else {
			request.setAttribute("error", "Problemas dando de alta produto");
		}
		request.getRequestDispatcher("/listProduto").forward(request, response);
	}

	private void atendePeticionFormNewProduto(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/formProduto.jsp").forward(request, response);
	}
}
