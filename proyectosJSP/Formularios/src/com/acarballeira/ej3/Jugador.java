package com.acarballeira.ej3;

import java.util.Arrays;

public class Jugador {
	private String nombre;
	private String apellido;
	private int telefono;
	private int movil;
	private String email;
	private double estatura;
	private String posicion;
	private String[] idiomas;
	private String[] meritos;
	private String obsevaciones;
	
	public Jugador(String nombre, String apellido, int telefono, int movil, String email, double estatura, String posicion,
			String[] idiomas, String[] meritos, String obsevaciones) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.telefono = telefono;
		this.movil = movil;
		this.email = email;
		this.estatura = estatura;
		this.posicion = posicion;
		this.idiomas = idiomas;
		this.meritos = meritos;
		this.obsevaciones = obsevaciones;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellido() {
		return apellido;
	}

	public void setApellido(String apellido) {
		this.apellido = apellido;
	}

	public int getTelefono() {
		return telefono;
	}

	public void setTelefono(int telefono) {
		this.telefono = telefono;
	}

	public int getMovil() {
		return movil;
	}

	public void setMovil(int movil) {
		this.movil = movil;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public double getEstatura() {
		return estatura;
	}

	public void setEstatura(double estatura) {
		this.estatura = estatura;
	}

	public String getPosicion() {
		return posicion;
	}

	public void setPosicion(String posicion) {
		this.posicion = posicion;
	}

	public String[] getIdiomas() {
		return idiomas;
	}
	
	public String idiomasToString() {
		String salida = "";
		if(idiomas != null) {
			for (String idioma : idiomas) {
				salida += idioma + " ";
			}
		}
		return salida;
	}
	public void setIdiomas(String[] idiomas) {
		this.idiomas = idiomas;
	}

	public String[] getMeritos() {
		return meritos;
	}
	
	public String getMerito(String merito) {
		if(this.getMeritos() != null && Arrays.asList(this.getMeritos()).contains(merito)) {
			return "Sí";
		} else {
			return "No";
		}
	}

	public void setMeritos(String[] meritos) {
		this.meritos = meritos;
	}

	public String getObsevaciones() {
		return obsevaciones;
	}

	public void setObsevaciones(String obsevaciones) {
		this.obsevaciones = obsevaciones;
	}

	@Override
	public String toString() {
		return "Jugador [nombre=" + nombre + ", apellido=" + apellido + ", telefono=" + telefono + ", movil=" + movil
				+ ", email=" + email + ", estatura=" + estatura + ", posicion=" + posicion + ", idiomas="
				+ Arrays.toString(idiomas) + ", meritos=" + Arrays.toString(meritos) + ", obsevaciones=" + obsevaciones
				+ "]";
	}
	
	
}
