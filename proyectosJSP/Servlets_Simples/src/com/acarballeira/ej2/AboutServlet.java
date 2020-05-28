package com.acarballeira.ej2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/ej2/about","/ej2/sobremi","/ej2/info"})
public class AboutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		processRequest(request,response);
	}
	
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
		processRequest(request,response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		out.print("<!DOCTYPE html><body>");
		out.println("<h1>Sobre mi</h1>");
		out.println("<a href='inicio'>Inicio</a>");
		out.println("<a href='about'>Sobre mi</a>");
		out.println("<a href='contacto'>Contacto</a>");
		out.println("<a href='blog'>Blog</a>");
		out.print("</body></html>");
	}
}
