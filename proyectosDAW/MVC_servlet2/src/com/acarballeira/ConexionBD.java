/*
 * Documento creado no 2020 por DAWDU10
 * CIFP A Carballeira. ExameJDBC en 19 mar. 2020
 * Contenido con licencia Creative Commons CC BY-NC-SA.
 */
package com.acarballeira;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.sql.DataSource;
import javax.naming.InitialContext;
import javax.naming.NamingException;


/**
 * The Class ConexionBD.
 */
public class ConexionBD {
    
    /** The Constant LOG. */
    private static final Logger LOG = Logger.getLogger("LOG_BD");                                                   //https://www.vogella.com/tutorials/Logging/article.html
    
    private static DataSource datasource = null;
    
    
    private ConexionBD() {
        
        LOG.setLevel(Level.INFO);
        configurarDataSource();
    }
    
    private void configurarDataSource() {
		
    	try {
    		InitialContext ctx = new InitialContext();
    		datasource = (DataSource) ctx.lookup("java:comp/env/jdbc/produtos1");
    	} catch (NamingException e) {
    		LOG.info("Erro obtendo DataSource: " + e.getMessage());
    	}
	}



	/**
     * Obter conexion.
     *
     * @return the connection
     */
    public static Connection obterConexion() {
        
        if (datasource == null) {
            new ConexionBD();
        }
        
        try {
        	return datasource.getConnection();
        } catch(IndexOutOfBoundsException | SQLException e) {
            LOG.info("Erro voltando conexión: " + e.getMessage());
        }
        return null;
    }
    
    /**
     * Devolver conexion.
     *
     * @param conn the conn
     */
    public static void devolverConexion(Connection conn) {
        
    	try {
    		conn.close();
    	} catch (SQLException e) {
    		LOG.info("Erro pechando conexión: " + e.getMessage());
    	}
    }

}
