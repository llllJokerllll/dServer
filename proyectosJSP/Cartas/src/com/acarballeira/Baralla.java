package com.acarballeira;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Random;

public class Baralla {
	private ArrayList<Carta> cartas = new ArrayList<Carta>();
	private static int INICIO = 1;
	private static int FINAL = 10;

	public Baralla() {
		for (Pau p : Pau.values()) {
			for (int i = INICIO; i <= FINAL; i++) {
				cartas.add(new Carta(i, p));
			}
		} 
	}

	public ArrayList<Carta> getBaralla() {
		return this.cartas;
	}

	public boolean barallar(){
		try {
			cartas.sort(new Comparator<Carta>() {
				@Override
				public int compare(Carta c1, Carta c2) {
					return new Random().nextInt(3) - 1;
				}
			});
			return true;
		} catch (Exception e){
			return false;
		}
	}
}
