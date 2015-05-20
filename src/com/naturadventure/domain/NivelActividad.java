package com.naturadventure.domain;

public class NivelActividad {

	
	private int idActividad;
	private String nivel;
	private float precioPorPersona;
	
	public NivelActividad(){
		
	}

	public String getNivel() {
		return nivel;
	}

	public void setNivel(String nivel) {
		this.nivel = nivel;
	}

	public int getIdActividad() {
		return idActividad;
	}

	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}

	public float getPrecioPorPersona() {
		return precioPorPersona;
	}

	public void setPrecioPorPersona(float precioPorPersona) {
		this.precioPorPersona = precioPorPersona;
	}
	
	
}
