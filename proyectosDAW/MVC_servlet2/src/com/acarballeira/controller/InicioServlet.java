package com.acarballeira.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Produto;
import com.acarballeira.model.ProdutoDAO;

@WebServlet({ "/InicioServlet", "/inicio", "/index.html" })
public class InicioServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		ProdutoDAO pDAO;
		ArrayList<Produto> listadoProdutos;
		
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		
		out.println("<!DOCTYPE html>");
		out.println("<html lang='es'>");
		out.println("<head><title>Probas Acceso a Datos</title></head>");
		out.println("<body>");
		out.println("<h1>Listaxe de produtos</h1>");
		
		pDAO = new ProdutoDAO();
		listadoProdutos = pDAO.getAll();
		out.println("<ul>");
		for (Produto p : listadoProdutos) {
			out.println("<li>" + p.getNome() + "</li>");
		}
		out.println("</ul>");
		out.println("</body>");
		out.println("</html>");
		out.close();
	}
}
