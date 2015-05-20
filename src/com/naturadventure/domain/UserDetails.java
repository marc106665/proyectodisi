package com.naturadventure.domain;

public class UserDetails {

	private String usuario;
	private String contrasenya;
	private String rol;
	
	public UserDetails(){
		
	}
	
	public UserDetails(String usuario, String contrasenya, String rol){
		this.setUsuario(usuario);
		this.setContrasenya(contrasenya);
		this.setRol(rol);
	}

	public String getUsuario() {
		return usuario;
	}

	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}

	public String getContrasenya() {
		return contrasenya;
	}

	public void setContrasenya(String contrasenya) {
		this.contrasenya = contrasenya;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}
	
	
	
}
