package com.acarballeira.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acarballeira.ConexionBD;

public class ProdutoDAO implements DAO<Produto> {

	@Override
	public Produto get(int id) {
		Connection c = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		Produto p = null;
		
		try {
			String sql = "SELECT id, nome, prezo, descricion, stockMinimo, stockActual " 
					+ "FROM produto "
					+ "WHERE id = ? "
					+ "ORDER BY nome, prezo";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			st.setInt(1, id);
			rs = st.executeQuery();
			
			if (rs.next()) {
				p = new Produto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getInt("stockActual"));
			}
				
			rs.close();
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en ProdutoDAO - get: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return p;
	}

	@Override
	public ArrayList<Produto> getAll() {
		Connection c = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		ArrayList<Produto> listaP = new ArrayList<Produto>();
		
		try {
			String sql = "SELECT id, nome, prezo, descricion, stockMinimo, stockActual " 
					+ "FROM produto "
					+ "ORDER BY nome, prezo";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				Produto p = new Produto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getInt(5), rs.getInt("stockActual"));
				listaP.add(p);
			}
				
			rs.close();
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en ProdutoDAO - getALL: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return listaP;
	}

	@Override
	public boolean save(Produto p) {
		boolean rexistrar = false;
		Connection c = null;
		PreparedStatement st = null;
		
		try {
			String sql = "INSERT INTO produto (nome, prezo, descricion, stockMinimo, stockActual) " 
					+ "VALUES (?, ?, ?, ?, ?)";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			st.setString(1, p.getNome());
			st.setDouble(2, p.getPrezo());
			st.setString(3, p.getDescricion());
			st.setInt(4, p.getStockActual());
			st.setInt(5, p.getStockMinimo());
			st.executeUpdate();
			rexistrar = true;	
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en ProdutoDAO - save: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return rexistrar;
	}

	@Override
	public boolean update(Produto p) {
		boolean rexistrar = false;
		Connection c = null;
		PreparedStatement st = null;
		
		try {
			String sql = "UPDATE produto SET nome = ?, prezo = ?, descricion = ?, stockMinimo = ?, stockActual = ? " 
					+ "WHERE id = ?";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			st.setString(1, p.getNome());
			st.setDouble(2, p.getPrezo());
			st.setString(3, p.getDescricion());
			st.setInt(4, p.getStockActual());
			st.setInt(5, p.getStockMinimo());
			st.setInt(6, p.getId());
			st.executeUpdate();
			rexistrar = true;	
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en ProdutoDAO - update: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return rexistrar;
	}

	@Override
	public boolean delete(Produto p) {
		boolean rexistrar = false;
		Connection c = null;
		PreparedStatement st = null;
		
		try {
			String sql = "DELETE FROM produto " 
					+ "WHERE id = ?";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			st.setInt(1, p.getId());
			st.executeUpdate();
			rexistrar = true;	
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en ProdutoDAO - delete: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return rexistrar;
	}

}
