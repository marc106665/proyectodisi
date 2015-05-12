package com.naturadventure.domain;

public class Monitor {
	private String nombre;
	private String email;
	private String usuario;
	
	public Monitor(){
		
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getUsuario() {
		return usuario;
	}


	public void setUsuario(String usuario) {
		this.usuario = usuario;
	}


	@Override
	public String toString() {
		return "Monitor [nombre=" + nombre + ", email=" + email + ", usuario="
				+ usuario + "]";
	}

	
}
