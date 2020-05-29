package com.acarballeira.model;

import java.sql.Date;
import java.sql.Time;

public class PaxinaVisita {

	private int id;
	private String ipcliente;
	private String urlsolicitude;
	private String claseservlet;
	private String rutaservlet;
	private String jspvista;
	private Date data;
	private Time hora;
	
	// Para que o considedremos un Java Bean
	public PaxinaVisita() { 
		super();
	}

	public PaxinaVisita(String ipcliente, String urlsolicitude, String claseservlet, String rutaservlet,
			String jspvista, Date data, Time hora) {
		super();
		this.ipcliente = ipcliente;
		this.urlsolicitude = urlsolicitude;
		this.claseservlet = claseservlet;
		this.rutaservlet = rutaservlet;
		this.jspvista = jspvista;
		this.data = data;
		this.hora = hora;
	}

	public PaxinaVisita(int id, String ipcliente, String urlsolicitude, String claseservlet, String rutaservlet,
			String jspvista, Date data, Time hora) {
		super();
		this.id = id;
		this.ipcliente = ipcliente;
		this.urlsolicitude = urlsolicitude;
		this.claseservlet = claseservlet;
		this.rutaservlet = rutaservlet;
		this.jspvista = jspvista;
		this.data = data;
		this.hora = hora;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getIpcliente() {
		return ipcliente;
	}

	public void setIpcliente(String ipcliente) {
		this.ipcliente = ipcliente;
	}

	public String getUrlsolicitude() {
		return urlsolicitude;
	}

	public void setUrlsolicitude(String urlsolicitude) {
		this.urlsolicitude = urlsolicitude;
	}

	public String getClaseservlet() {
		return claseservlet;
	}

	public void setClaseservlet(String claseservlet) {
		this.claseservlet = claseservlet;
	}

	public String getRutaservlet() {
		return rutaservlet;
	}

	public void setRutaservlet(String rutaservlet) {
		this.rutaservlet = rutaservlet;
	}

	public String getJspvista() {
		return jspvista;
	}

	public void setJspvista(String jspvista) {
		this.jspvista = jspvista;
	}

	public Date getData() {
		return data;
	}

	public void setData(Date data) {
		this.data = data;
	}

	public Time getHora() {
		return hora;
	}

	public void setHora(Time hora) {
		this.hora = hora;
	}
	
	
}
