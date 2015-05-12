package es.uji.ei1027.clubesportiu.test;

import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;
import java.io.IOException;
 
public class TestJdbcPostgres_conLoader {

	final static String JDBC_PROPERTIES = "./jdbc.properties";

	public static void main(String[] argv) {
		
		System.out.println("-------- PostgreSQL "
				+ "JDBC Connection Testing ------------");
 
		try {
 
			Class.forName("org.postgresql.Driver");
 
		} catch (ClassNotFoundException e) {

			System.out.println("Where is your PostgreSQL JDBC Driver? "
					+ "Include in your library path!");
			e.printStackTrace();
			return;
 
		}
 
		System.out.println("PostgreSQL JDBC Driver Registered!");
 
		Connection connection = null;
 
		try {
			
			String url = "jdbc:postgresql://db-aules.uji.es/ei102714agg";
			Properties props = new Properties();
			ClassLoader loader = Thread.currentThread().getContextClassLoader();           
			InputStream stream = loader.getResourceAsStream(JDBC_PROPERTIES);
			if (stream == null)
				System.out.println("Fitxer " + JDBC_PROPERTIES + " no trobat");
			else {
				try {
					System.out.println(props.toString());
					props.load(stream);
				}
				catch(IOException e) {
					System.out.println("No puc llegir el fitxer" + JDBC_PROPERTIES + " " + e.getMessage());
					e.printStackTrace();
				}
			}
			connection = DriverManager.getConnection(url, props);
 
		} catch (SQLException e) {
 
			System.out.println("Connection Failed! Check output console");
			e.printStackTrace();
			return;
 
		}
 
		if (connection != null) {
			System.out.println("You made it, take control your database now!");
		} else {
			System.out.println("Failed to make connection!");
		}
	}
 
}


