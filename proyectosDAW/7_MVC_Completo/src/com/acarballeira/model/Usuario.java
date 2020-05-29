package com.acarballeira.model;

public class Usuario {
	
	private String username;
	private String password;
	private String nomeCompleto;
	
	public Usuario() {
		super();
	}

	public Usuario(String username, String password, String nomeCompleto) {
		super();
		this.username = username;
		this.password = password;
		this.nomeCompleto = nomeCompleto;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNomeCompleto() {
		return nomeCompleto;
	}

	public void setNomeCompleto(String nomeCompleto) {
		this.nomeCompleto = nomeCompleto;
	}
	
	
}
