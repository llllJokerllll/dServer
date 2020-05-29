package com.acarballeira.model;

import java.io.BufferedReader;
import java.io.FileReader;

public class UsuarioDAO {

	private String rutaArquivo;
	
	public UsuarioDAO(String rutaArquivo) {
		this.rutaArquivo = rutaArquivo;
	}
	
	public boolean existe(Usuario u) {
		boolean valido = false;
		String linha;
		String[] datos;
		
		try {
			BufferedReader br = new BufferedReader(new FileReader(this.rutaArquivo));
			while ((linha = br.readLine()) != null) {
				datos = linha.split("###");
				if (u.getUsername().equals(datos[0]) && u.getPassword().equals(datos[1])) {
					valido = true;
					break;
				}
				br.close();
			}
		} catch (Exception e) {
			System.out.println("Erro buscando usuario. UsuarioDAO " + e.getMessage());
		}
		
		return valido;
	}
}
