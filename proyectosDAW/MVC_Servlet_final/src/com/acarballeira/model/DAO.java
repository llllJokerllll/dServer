package com.acarballeira.model;

import java.util.ArrayList;

public interface DAO<T> {

	public T get(int id);
	public ArrayList<T> getAll();
	public boolean save(T t);
	public boolean update(T t);
	public boolean delete(T t);
}
