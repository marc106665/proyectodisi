package com.naturadventure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.naturadventure.domain.UserDetails;


@Repository
public class UsuarioDAO implements UserDAO{

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class UsuarioMapper implements RowMapper<UserDetails> { 
		
	    public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        UserDetails usuario = new UserDetails();
	        usuario.setUsuario(rs.getString("usuario"));
	        usuario.setContrasenya(rs.getString("contrasenya"));
	        usuario.setRol(rs.getString("rol"));
	    


	        return usuario;
	    }
	}
	
	
	
	
	public List<UserDetails> getUsuarios() {
		 return this.jdbcTemplate.query("select  usuario, contrasenya, rol from usuario", new UsuarioMapper());
	}
	
	
	
	public UserDetails getUsuario(String usuario) {
		return this.jdbcTemplate.queryForObject("select usuario, contrasenya, rol from usuario where usuario = ? ",  new Object[] {usuario}, new UsuarioMapper());
	}
	
	public void addUsuario(UserDetails usuario) {
		this.jdbcTemplate.update(
				"insert into Usuario(usuario, contrasenya, rol) values( ?, ?, ?)", usuario.getUsuario(), usuario.getContrasenya(),  usuario.getRol());
	}
	
	
	
	
	public void updateUsuario(UserDetails usuario) {
		this.jdbcTemplate.update(
				"update Usuario set contrasenya = ?, rol = ? where usuario = ?",  usuario.getContrasenya(), usuario.getRol() );
	}
	
	public void deleteUsuario(String usuario) {
		this.jdbcTemplate.update(
		        "delete from Usuario where usuario = ?",
		        usuario);
	}



	@Override
	public UserDetails loadByUsername(String username, String password) {
		 Map<String, UserDetails> knownUsers = new HashMap<String, UserDetails>();

		 List<UserDetails> lista_usuarios = (List<UserDetails>) listAllUsers();
			for(UserDetails usuario : lista_usuarios){
				knownUsers.put(usuario.getUsuario(), usuario);
			}
		 
			UserDetails user = knownUsers.get(username.trim());

		
		  if (user == null)
			  return null; // Usuari no trobat
		  // Contrasenya
		 BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 
		 //if (passwordEncryptor.checkPassword(password, user.getContrasenya())) {
		 // Es deuria esborrar de manera segura el camp password abans de tornar-lo
		//	 return user; 
	     //   } 
		 
		 if(password.equals(user.getContrasenya())){
			 return user; 
	        } 
		 else {
			 return null; // bad login!
		 }
	}



	@Override
	public Collection<UserDetails> listAllUsers() {
		// return knownUsers.values();
		return getUsuarios();
	}
	
	
	/*
	public List<String> getNivelesUnicos(){
		List<NivelActividad> listaNiveles = this.jdbcTemplate.query("select DISTINCT ON (nivel) idactividad , nivel, precioporpersona from NivelActividad", new NivelesMapper());
		List<String> lvl = new LinkedList<String>();
		for(NivelActividad n : listaNiveles ){
			lvl.add(n.getNivel());
		}
		return lvl;
		}
	
	*/
}
