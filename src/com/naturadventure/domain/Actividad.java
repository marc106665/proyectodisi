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


	@Override
	public String toString() {
		return "Actividad [idActividad=" + idActividad + ", nombre=" + nombre
				+ ", tipo=" + tipo + ", duracionHoras=" + duracionHoras
				+ ", descripcion=" + descripcion + ", minParticipantes="
				+ minParticipantes + ", maxParticipantes=" + maxParticipantes
				+ ", oferta=" + oferta + ", nuevo=" + nuevo + ", localizacion="
				+ localizacion + ", foto=" + foto + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((descripcion == null) ? 0 : descripcion.hashCode());
		result = prime * result + duracionHoras;
		result = prime * result + ((foto == null) ? 0 : foto.hashCode());
		result = prime * result + idActividad;
		result = prime * result
				+ ((localizacion == null) ? 0 : localizacion.hashCode());
		result = prime * result + maxParticipantes;
		result = prime * result + minParticipantes;
		result = prime * result + ((nombre == null) ? 0 : nombre.hashCode());
		result = prime * result + nuevo;
		result = prime * result + ((oferta == null) ? 0 : oferta.hashCode());
		result = prime * result + ((tipo == null) ? 0 : tipo.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Actividad other = (Actividad) obj;
		if (descripcion == null) {
			if (other.descripcion != null)
				return false;
		} else if (!descripcion.equals(other.descripcion))
			return false;
		if (duracionHoras != other.duracionHoras)
			return false;
		if (foto == null) {
			if (other.foto != null)
				return false;
		} else if (!foto.equals(other.foto))
			return false;
		if (idActividad != other.idActividad)
			return false;
		if (localizacion == null) {
			if (other.localizacion != null)
				return false;
		} else if (!localizacion.equals(other.localizacion))
			return false;
		if (maxParticipantes != other.maxParticipantes)
			return false;
		if (minParticipantes != other.minParticipantes)
			return false;
		if (nombre == null) {
			if (other.nombre != null)
				return false;
		} else if (!nombre.equals(other.nombre))
			return false;
		if (nuevo != other.nuevo)
			return false;
		if (oferta == null) {
			if (other.oferta != null)
				return false;
		} else if (!oferta.equals(other.oferta))
			return false;
		if (tipo == null) {
			if (other.tipo != null)
				return false;
		} else if (!tipo.equals(other.tipo))
			return false;
		return true;
	}

	
	
}

