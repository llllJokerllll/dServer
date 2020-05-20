package com.acarballeira.ej2;

import java.time.LocalDate;
import java.time.Period;

public class Empleado {
	private String nombre;
	private double salario;
	private int irpf;
	private int pagas;
	private LocalDate fechaNacimiento;
	
	public Empleado(String nombre, double salario, int irpf, int pagas, LocalDate fechaNacimiento) {
		this.nombre = nombre;
		this.salario = salario;
		this.irpf = irpf;
		this.pagas = pagas;
		this.fechaNacimiento = fechaNacimiento;
	}
	
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public double getSalario() {
		return salario;
	}
	public void setSalario(double salario) {
		this.salario = salario;
	}
	public double getIrpf() {
		return irpf;
	}
	public void setIrpf(int irpf) {
		this.irpf = irpf;
	}
	public int getPagas() {
		return pagas;
	}
	public void setPagas(int pagas) {
		this.pagas = pagas;
	}
	public LocalDate getFechaNacimiento() {
		return fechaNacimiento;
	}
	public void setFechaNacimiento(LocalDate fechaNacimiento) {
		this.fechaNacimiento = fechaNacimiento;
	}
	public double getSalarioMensualNeto() {
		return (this.salario/this.pagas) - (this.salario/this.pagas * this.irpf/100);
	}
	public String getTiempoParaJubilarse() {
		Period jubilacion = Period.between(LocalDate.now(), this.fechaNacimiento.plusYears(67));
		return "Quedan " + jubilacion.getYears() + " años," + jubilacion.getMonths() + " meses y " + jubilacion.getDays() + " días";
	}

	@Override
	public String toString() {
		return "Empleado [nombre=" + nombre + ", salario=" + salario + ", irpf=" + irpf + ", pagas=" + pagas
				+ ", fechaNacimiento=" + fechaNacimiento + "]";
	}
	
	

}
