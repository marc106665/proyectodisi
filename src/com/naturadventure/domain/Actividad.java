package com.naturadventure.domain;

public class Actividad {
	private int idActividad;
	private String nombre;
	private String tipo;
	private int duracionHoras;
	private String descripcion;
	private int minParticipantes;
	private int maxParticipantes;
	private String oferta;
	private int nuevo;
	private String localizacion;
	private String foto;
	
public Actividad(){
		
	}


	public String getNombre() {
		return nombre;
	}


	public void setNombre(String nombre) {
		this.nombre = nombre;
	}


	public String getTipo() {
		return tipo;
	}


	public void setTipo(String tipo) {
		this.tipo = tipo;
	}


	public int getDuracionHoras() {
		return duracionHoras;
	}


	public void setDuracionHoras(int duracionHoras) {
		this.duracionHoras = duracionHoras;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public int getMinParticipantes() {
		return minParticipantes;
	}


	public void setMinParticipantes(int minParticipantes) {
		this.minParticipantes = minParticipantes;
	}


	public int getMaxParticipantes() {
		return maxParticipantes;
	}


	public void setMaxParticipantes(int maxParticipantes) {
		this.maxParticipantes = maxParticipantes;
	}


	public String getOferta() {
		return oferta;
	}


	public void setOferta(String oferta) {
		this.oferta = oferta;
	}


	public int getNuevo() {
		return nuevo;
	}


	public void setNuevo(int nuevo) {
		this.nuevo = nuevo;
	}


	public String getLocalizacion() {
		return localizacion;
	}


	public void setLocalizacion(String localizacion) {
		this.localizacion = localizacion;
	}


	public String getFoto() {
		return foto;
	}


	public void setFoto(String foto) {
		this.foto = foto;
	}


	public int getIdActividad() {
		return idActividad;
	}


	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}

	
}

