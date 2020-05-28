/*
 * Documento creado no 2020 por DAWDU10
 * CIFP A Carballeira. ExameJDBC en 19 mar. 2020
 * Contenido con licencia Creative Commons CC BY-NC-SA.
 */
package com.acarballeira;

import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mysql.cj.jdbc.MysqlDataSource;

/**
 * The Class ConexionBD.
 */
public class ConexionBD {
    
    /** The host. */
    private static String host;
    
    /** The port. */
    private static String port;
    
    /** The db. */
    private static String db;
    
    /** The user. */
    private static String user;
    
    /** The password. */
    private static String password;
    
    /** The Constant LOG. */
    private static final Logger LOG = Logger.getLogger("LOG_BD");                                                   //https://www.vogella.com/tutorials/Logging/article.html
    
    private static MysqlDataSource datasource = null;
    
    
    private ConexionBD() {
        
        LOG.setLevel(Level.INFO);
        cargarPropiedades();
        configurarDataSource();
    }
    
    private void configurarDataSource() {
		
		datasource = new MysqlDataSource();
		datasource.setServerName(host);
		datasource.setPortNumber(Integer.parseInt(port));
		datasource.setDatabaseName(db);
		datasource.setUser(user);
		datasource.setPassword(password);
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
    
    
    
    
    /**
     * Cargar propiedades.
     */
    private static void cargarPropiedades() {
        try {
            //FileReader fr = new FileReader("Z:/config.inc");
            InputStream fr = ConexionBD.class.getResourceAsStream("/com/acarballeira/recursos/config.inc");
            
            Properties propiedades = new Properties();
            propiedades.load(fr);
            user = propiedades.getProperty("user");
            password = propiedades.getProperty("password");
            db = propiedades.getProperty("db");
            port = propiedades.getProperty("port");
            host = propiedades.getProperty("host");            
             
        }catch(IOException | NullPointerException  e) {            
            LOG.info("Non se pode cargar o ficheiro de propiedades" + e.getMessage());
        }
    }

}
