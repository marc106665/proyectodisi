package com.naturadventure.domain;

import java.util.Date;

public class Reserva {
	private int idReserva;
	private String nombreCliente;
	private String telefonoCliente;
	private String emailCliente;
	private String horaInicio;
	private String estado;
	private int numParticipantes;
	private Date fechaReserva;
	private Date fechaActividad;
	private int idActividad;
	private String monitor;
	private String nivel;


	
public Reserva(){
		
	}


	



	public int getIdReserva() {
		return idReserva;
	}




	public void setIdReserva(int idReserva) {
		this.idReserva = idReserva;
	}
	public String getNombreCliente() {
		return nombreCliente;
	}




	public void setNombreCliente(String nombreCliente) {
		this.nombreCliente = nombreCliente;
	}


	@Override
	public String toString() {
		return "Reserva  faltan datos [nombre=" + nombreCliente + ", email=" + emailCliente + ", usuario="
				+ monitor + "]";
	}






	public String getTelefonoCliente() {
		return telefonoCliente;
	}






	public void setTelefonoCliente(String telefonoCliente) {
		this.telefonoCliente = telefonoCliente;
	}

	
	public String getEmailCliente() {
		return emailCliente;
	}




	public void setEmailCliente(String emailCliente) {
		this.emailCliente = emailCliente;
	}






	public String getHoraInicio() {
		return horaInicio;
	}






	public void setHoraInicio(String horaInicio) {
		this.horaInicio = horaInicio;
	}






	public String getEstado() {
		return estado;
	}






	public void setEstado(String estado) {
		this.estado = estado;
	}






	public int getNumParticipantes() {
		return numParticipantes;
	}






	public void setNumParticipantes(int numParticipantes) {
		this.numParticipantes = numParticipantes;
	}






	public Date getFechaReserva() {
		return fechaReserva;
	}

//	public java.util.Date getFechaReserva() {
//		java.util.Date newDate = new Date(fechaReserva.getTime());
//		return newDate;
//	}




//	public void setFechaReserva(String fechaReserva) {
//		
//		this.fechaReserva = Date.valueOf(fechaReserva);
//	}

	public void setFechaReserva(Date fechaReserva) {
		
		this.fechaReserva = fechaReserva;
	}

//	public void setFechaReserva(java.util.Date fechaReserva) {
//		
//		this.fechaReserva = new java.sql.Date(fechaReserva.getTime());
//	}
		
	public Date getFechaActividad() {
		return fechaActividad;
	}






	public void setFechaActividad(Date fechaActividad) {
		this.fechaActividad = fechaActividad;
	}






	public int getIdActividad() {
		return idActividad;
	}






	public void setIdActividad(int idActividad) {
		this.idActividad = idActividad;
	}






	public String getNivel() {
		return nivel;
	}






	public void setNivel(String nivel) {
		this.nivel = nivel;
	}
	
	public String getMonitor() {
		return monitor;
	}




	public void setMonitor(String monitor) {
		this.monitor = monitor;
	}
	

}
