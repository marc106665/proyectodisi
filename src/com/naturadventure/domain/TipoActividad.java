package com.naturadventure.domain;

public class TipoActividad {
	private String tipo;
	private String descripcion;
	private String foto;
	private String requisitos;
	
	public TipoActividad(){
		
	}


	public String getTipo() {
		return tipo;
	}
	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	public String getFoto() {
		return foto;
	}
	public void setFoto(String foto) {
		this.foto = foto;
	}
	
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public String getRequisitos() {
		return requisitos;
	}
	public void setRequisitos(String requisitos) {
		this.requisitos = requisitos;
	}
	
	@Override
	public String toString() {
		return "TipoActividad [tipo=" + tipo + ", descripcion=" + descripcion
				+ ", foto=" + foto + ", requisitos=" + requisitos + "]";
	}
	
	

}
