package com.acarballeira.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.acarballeira.ConexionBD;

public class PaxinaVisitaDAO implements DAO<PaxinaVisita>{

	@Override
	public ArrayList<PaxinaVisita> getAll() {
		
		Connection c = null;
		PreparedStatement st = null;
		ResultSet rs = null;
		ArrayList<PaxinaVisita> listaP = new ArrayList<PaxinaVisita>();
		
		try {
			String sql = "SELECT id, ipcliente, urlsolicitude, claseservlet, rutaservlet, jspvista, data, hora " 
					+ "FROM visitapaxina "
					+ "ORDER BY data, hora DESC";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			rs = st.executeQuery();
			
			while(rs.next()) {
				PaxinaVisita p = new PaxinaVisita(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getDate(7), rs.getTime(8));
				listaP.add(p);
			}
				
			rs.close();
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en PaxinaVisitaDAO - getALL: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return listaP;
	}

	@Override
	public boolean save(PaxinaVisita p) {
		boolean rexistrar = false;
		Connection c = null;
		PreparedStatement st = null;
		
		try {
			String sql = "INSERT INTO visitapaxina (ipcliente, urlsolicitude, claseservlet, rutaservlet, jspvista, data, hora) " 
					+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
			c = ConexionBD.obterConexion();
			st = c.prepareStatement(sql);
			st.setString(1, p.getIpcliente());
			st.setString(2, p.getUrlsolicitude());
			st.setString(3, p.getClaseservlet());
			st.setString(4, p.getRutaservlet());
			st.setString(5, p.getJspvista());
			st.setDate(6, p.getData());
			st.setTime(7, p.getHora());
			st.executeUpdate();
			rexistrar = true;	
			st.close();
			
		} catch(SQLException e) {
			System.out.println("Erro en PaxinaVisitaDAO - save: " + e.getMessage());
		} finally {
			ConexionBD.devolverConexion(c);
		}
		
		return rexistrar;
	}

}
