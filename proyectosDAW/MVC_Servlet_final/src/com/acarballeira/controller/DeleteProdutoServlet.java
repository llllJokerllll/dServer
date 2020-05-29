package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Produto;
import com.acarballeira.model.ProdutoDAO;

public class DeleteProdutoServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("title", "Borrando Produto");
		
		if (request.getParameter("id") != null) {
			ProdutoDAO pDAO = new ProdutoDAO();
			Produto p = pDAO.get(Integer.parseInt(request.getParameter("id")));
			if (p == null) {
				request.setAttribute("error", "Non existe o produto co id proporcionado");
			} else {
				pDAO.delete(p);
				request.setAttribute("ok", "Produto eliminado correctamente");
			}
		} else {
			request.setAttribute("error", "Non pasaches o id");
		}
		
		//response.sendRedirect("/listProduto");
		request.getRequestDispatcher("/listProduto").forward(request, response);
	}
}