package com.acarballeira;

public class Carta {
	private final static String ruta = "imaxes/";
	private int numero;
	private Pau pau;
	
	public Carta(int numero, Pau pau) {
		this.numero = numero;
		this.pau = pau;
	}

	public int getNumero() {
		return numero;
	}

	public void setNumero(int numero) {
		this.numero = numero;
	}

	public Pau getPau() {
		return pau;
	}

	public void setPau(Pau pau) {
		this.pau = pau;
	}

	@Override
	public String toString() {
		return Carta.ruta + (this.getPau().name()).toLowerCase() + "-" + this.getNumero() + ".png";
	}
	
	
	
}
