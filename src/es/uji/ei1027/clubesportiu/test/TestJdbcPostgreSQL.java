package es.uji.ei1027.clubesportiu.test;

import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
 
public class TestJdbcPostgreSQL {
 
	public static void main(String[] argv) {
 
		System.out.println("Prova de connexió a PostgreSQL amb JDBC");
		try {
			Class.forName("org.postgresql.Driver");
		} catch (ClassNotFoundException e) {
			System.out.println("El driver de JDBC no està al Classpath!");
			e.printStackTrace();
			return;
		}
		System.out.println("Driver JDBC de PostgreSQL registrat!");
		Connection connection = null;
		try {			
			String url = "jdbc:postgresql://db-aules.uji.es/ei102714agg";
			Properties props = new Properties();
			props.setProperty("user", "ei102714agg");
			props.setProperty("password", "ei102714agg");
			props.setProperty("ssl", "false");
			props.setProperty("sslfactory", "org.postgresql.ssl.NonValidatingFactory"); 
			connection = DriverManager.getConnection(url, props);
		} catch (SQLException e) {
			System.out.println("Error de connexió");
			e.printStackTrace();
			return; 
		}
		if (connection != null) {
			System.out.println("Connectat correctament!");
		} else {
			System.out.println("La connexió ha fallat!");
		}
	}
}


