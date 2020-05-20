package com.acarballeira.ej1;

public class Util {
		
	public static int sumar(int numero) {
		int total = 0;
		for (String cifra : String.valueOf(numero).split("")) {
			total += Integer.parseInt(cifra);
		}	

		return total;
	}
}
