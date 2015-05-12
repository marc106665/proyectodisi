package es.uji.ei1027.clubesportiu.dao;

public class Actividad {

	private int idActividad;
	private String nombre;
	private int duracionHoras;
	private int horasInicio;
	private String descripcion;
	private String nivel;
	private Double precioPorPersona;
	private int minParticipantes;
	private int maxParticipantes;
	
	public Actividad(){
		idActividad = 0;
		nombre = "";
		duracionHoras = 0; 
		horasInicio = 0;
		descripcion = "";
		nivel = "";
		precioPorPersona = 0.0;
		minParticipantes = 0;
		maxParticipantes = 0;
	}
	
	
	public int getIdActividad() {
		return idActividad;
	}
	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}
	public String getNombre() {
		return nombre;
	}
	public void setNombre(String nombre) {
		this.nombre = nombre;
	}
	public int getDuracionHoras() {
		return duracionHoras;
	}
	public void setDuracionHoras(int duracionHoras) {
		this.duracionHoras = duracionHoras;
	}
	public int getHorasInicio() {
		return horasInicio;
	}
	public void setHorasInicio(int horasInicio) {
		this.horasInicio = horasInicio;
	}
	public String getDescripcion() {
		return descripcion;
	}
	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}
	public String getNivel() {
		return nivel;
	}
	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	public Double getPrecioPorPersona() {
		return precioPorPersona;
	}
	public void setPrecioPorPersona(Double precioPorPersona) {
		this.precioPorPersona = precioPorPersona;
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
	
	@Override
	public String toString() {
		return "Actividad [idActividad=" + idActividad + ", nombre=" + nombre
				+ ", duracionHoras=" + duracionHoras + ", horasInicio="
				+ horasInicio + ", descripcion=" + descripcion + ", nivel="
				+ nivel + ", precioPorPersona=" + precioPorPersona
				+ ", minParticipantes=" + minParticipantes
				+ ", maxParticipantes=" + maxParticipantes + "]";
	}

	
}
