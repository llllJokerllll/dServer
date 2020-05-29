package com.acarballeira.controller;

import java.io.IOException;
import java.io.Serializable;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.acarballeira.model.Usuario;
import com.acarballeira.model.UsuarioDAO;

@WebServlet(
		name = "LoginServlet",
		description = "Servlet que tramita e mostra login",
		urlPatterns = { "/tramitaLogin", "/login" },
		initParams = {@WebInitParam(name="rutaArquivo", value="/WEB-INF/usuarios.dat")}
		)

public class LoginServlet extends HttpServlet implements Serializable {
	
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
		
		request.setAttribute("titulo", "Login");
		
		String paxina = request.getRequestURI();
		
		if (paxina.endsWith("tramitaLogin")) {
			atendeTramitacion(request, response);
		} else {
			amosaLogin(request, response);
		}
	}

	private void amosaLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher("login.jsp").forward(request,  response);
	}

	private void atendeTramitacion(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String rutaArquivo = this.getServletContext().getRealPath(this.getServletConfig().getInitParameter("rutaArquivo"));
		UsuarioDAO uDAO = new UsuarioDAO(rutaArquivo);
		Usuario usuario = new Usuario();
		
		usuario.setUsername(request.getParameter("username"));
		usuario.setPassword(request.getParameter("pass"));
		
		if (uDAO.existe(usuario)) {
			request.setAttribute("exito", "SI"); //inyectar á vista
		} else {
			request.setAttribute("exito", "NON"); //inyectar á vista
		}
		
		request.getRequestDispatcher("resultadoLogin.jsp").forward(request,  response);
	}
}
