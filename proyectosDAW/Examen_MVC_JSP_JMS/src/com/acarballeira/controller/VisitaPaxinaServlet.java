package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.PaxinaVisita;
import com.acarballeira.model.PaxinaVisitaDAO;


@WebServlet("/visitaPaxinaView")
public class VisitaPaxinaServlet extends HttpServlet implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String direccion = "/visitaPaxinaView.jsp";
		almacenaDatos(request, response, direccion);
		request.setAttribute("title", "Listado das Visitas");
		
		PaxinaVisitaDAO vDAO = new PaxinaVisitaDAO();
		ArrayList<PaxinaVisita> lista = vDAO.getAll();
		//Inyección de parámetros, de valores, ... á vista
		request.setAttribute("listadoVisitas", lista);
		
		request.getRequestDispatcher(direccion).forward(request, response);
		
	}
	
	private void almacenaDatos(HttpServletRequest request, HttpServletResponse response , String direccion) {

		PaxinaVisitaDAO pDAO = new PaxinaVisitaDAO();
		java.util.Date d = new java.util.Date(); 
		String ipcliente = request.getRemoteAddr();
		String urlsolicitude = request.getRequestURL().toString();
		String claseservlet = this.getServletName().substring(this.getServletName().lastIndexOf(".") + 1);
		String rutaservlet = request.getRequestURI().substring(request.getRequestURI().lastIndexOf("/"));
		String jspvista = direccion;
		Date data = new java.sql.Date(d.getTime());
		Time hora =new java.sql.Time(d.getTime());
		pDAO.save(new PaxinaVisita(ipcliente, urlsolicitude, claseservlet, rutaservlet, jspvista, data, hora));
	}
}
