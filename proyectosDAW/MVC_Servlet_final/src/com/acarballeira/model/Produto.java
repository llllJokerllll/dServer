package com.acarballeira.model;

public class Produto {

	private int id;
	private String nome;
	private double prezo;
	private String descricion;
	private int stockActual;
	private int stockMinimo;
	
	public Produto() {} // Para que o considedremos un Java Bean
	
	public Produto(String nome, double prezo, String descricion, int stockActual, int stockMinimo) {
		super();
		this.nome = nome;
		this.prezo = prezo;
		this.descricion = descricion;
		this.stockActual = stockActual;
		this.stockMinimo = stockMinimo;
	}

	public Produto(int id, String nome, double prezo, String descricion, int stockActual, int stockMinimo) {
		super();
		this.id = id;
		this.nome = nome;
		this.prezo = prezo;
		this.descricion = descricion;
		this.stockActual = stockActual;
		this.stockMinimo = stockMinimo;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public double getPrezo() {
		return prezo;
	}

	public void setPrezo(double prezo) {
		this.prezo = prezo;
	}

	public String getDescricion() {
		return descricion;
	}

	public void setDescricion(String descricion) {
		this.descricion = descricion;
	}

	public int getStockActual() {
		return stockActual;
	}

	public void setStockActual(int stockActual) {
		this.stockActual = stockActual;
	}

	public int getStockMinimo() {
		return stockMinimo;
	}

	public void setStockMinimo(int stockMinimo) {
		this.stockMinimo = stockMinimo;
	}
	
	
}
