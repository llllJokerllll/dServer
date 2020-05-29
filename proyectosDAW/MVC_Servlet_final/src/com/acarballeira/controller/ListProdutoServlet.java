package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Produto;
import com.acarballeira.model.ProdutoDAO;

public class ListProdutoServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("title", "Listado de Produtos");
		
		ProdutoDAO pDAO = new ProdutoDAO();
		ArrayList<Produto> lista = pDAO.getAll();
		//Inyección de parámetros, de valores, ... á vista
		request.setAttribute("listadoProdutos", lista);
		
		request.getRequestDispatcher("/listProduto.jsp").forward(request, response);
	}
}