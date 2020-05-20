package com.acarballeira.ej1;

import java.time.LocalDate;

public class Tarot {
	private LocalDate fecha;
	
	public Tarot(String fecha) {
		this.fecha = LocalDate.parse(fecha);
	}

	public LocalDate getFecha() {
		return fecha;
	}

	public void setFecha(LocalDate fecha) {
		this.fecha = fecha;
	}

	@Override
	public String toString() {
		return "Tarot [fecha=" + fecha + "]";
	}
	
	public int getNumero() {
		int total = 0;
		
		total += Util.sumar(fecha.getDayOfMonth());
		total += Util.sumar(fecha.getMonthValue());
		total += Util.sumar(fecha.getYear());

		while(total>=10) {
			total = Util.sumar(total);
		}

		return total;
	}
	
}
