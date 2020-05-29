package com.acarballeira.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InicioServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("title", "Inicio");
		
		request.getRequestDispatcher("/inicio.jsp").forward(request, response);
		
	}
}
