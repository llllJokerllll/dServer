package com.acarballeira;

public class Operacion {
	private int a;
	private int b;
	
	public Operacion (int a, int b) {
		super();
		this.a = a;
		this.b = b;
	}

	public int getA() {
		return a;
	}

	public void setA(int a) {
		this.a = a;
	}

	public int getB() {
		return b;
	}

	public void setB(int b) {
		this.b = b;
	}
	
	public int suma() {
		return this.a + this.b;
	}
}
