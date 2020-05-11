package com.acarballeira;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class ProbasContexto {
	
	public static String probas() {
		Context c;
		String ruta = "";
		try {
			c = new InitialContext();
			ruta = (String)c.lookup("java:comp/env/directorio");
		} catch (NamingException e) {
			ruta = "";
		}
		
		return ruta;
	}
}
