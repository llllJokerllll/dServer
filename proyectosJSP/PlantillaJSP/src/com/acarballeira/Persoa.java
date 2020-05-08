package com.acarballeira;

public class Persoa {
	String nome;
	int idade;
	
	public Persoa(String nome, int idade) {
		super();
		this.nome = nome;
		this.idade = idade;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public int getIdade() {
		return idade;
	}

	public void setIdade(int idade) {
		this.idade = idade;
	}

	@Override
	public String toString() {
		return "Persoa [nome=" + nome + ", idade=" + idade + "]";
	}
	
	
}
