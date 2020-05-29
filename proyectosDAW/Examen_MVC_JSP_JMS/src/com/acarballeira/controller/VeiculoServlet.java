package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Date;
import java.sql.Time;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.PaxinaVisita;
import com.acarballeira.model.PaxinaVisitaDAO;


@WebServlet({ "/coche", "/avion", "/barco" })
public class VeiculoServlet extends HttpServlet implements Serializable {
	
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		processRequest(request, response);
	}

	private void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String accion = request.getServletPath();	


		switch(accion) {
		case "/avion":
			atiendePeticionAvion(request,response);
			break;
		case "/barco":
			atiendePeticionBarco(request,response);
			break;
		case "/coche":
			atiendePeticionCoche(request,response);
			break;
		default:
			response.sendRedirect("/avion");
		}
	}

	private void atiendePeticionAvion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direccion = "/avion.jsp";
		almacenaDatos(request, response, direccion);
		request.setAttribute("titulo", request.getRequestURL());
		request.getRequestDispatcher(direccion).forward(request, response);		
	}
	private void atiendePeticionBarco(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direccion = "/barco.jsp";
		almacenaDatos(request, response, direccion);
		request.setAttribute("titulo", "Barco");
		request.getRequestDispatcher(direccion).forward(request, response);		
	}	
	private void atiendePeticionCoche(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String direccion = "/coche.jsp";
		almacenaDatos(request, response, direccion);
		request.setAttribute("titulo", "Coche");
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
