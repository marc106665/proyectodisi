package com.naturadventure.domain;

public class HorasInicio {
	private int idActividad;
	private String horaInicio;
	
	
public HorasInicio(){
		
	}


	




	@Override
public String toString() {
	return "HorasInicio [idActividad=" + idActividad + ", horaInicio="
			+ horaInicio + "]";
}







	public int getIdActividad() {
		return idActividad;
	}




	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}

	public String getHoraInicio() {
		return horaInicio;
	}




	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}

}
