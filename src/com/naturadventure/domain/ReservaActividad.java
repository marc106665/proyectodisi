package com.naturadventure.domain;

import java.util.Date;

public class ReservaActividad
{
		private String nombreActividad;
		private String tipo;
		private int duracionHoras;
		private String descripcion;
		private String nombreCliente;
		private String telefonoCliente;
		private String horaInicio;
		private String estado;
		private int numParticipantes;
		private Date fechaActividad;
		private int idActividad;
		private String monitor;
		private String nivel;
		private String localizacion;
		private int idReserva;
		public ReservaActividad(){
			
		}

		public String getNombreActividad() {
			return nombreActividad;
		}

		public void setNombreActividad(String nombreActividad) {
			this.nombreActividad = nombreActividad;
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

		public String getNombreCliente() {
			return nombreCliente;
		}

		public void setNombreCliente(String nombreCliente) {
			this.nombreCliente = nombreCliente;
		}

		public String getTelefonoCliente() {
			return telefonoCliente;
		}

		public void setTelefonoCliente(String telefonoCliente) {
			this.telefonoCliente = telefonoCliente;
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

		public String getMonitor() {
			return monitor;
		}

		public void setMonitor(String monitor) {
			this.monitor = monitor;
		}

		public String getNivel() {
			return nivel;
		}

		public void setNivel(String nivel) {
			this.nivel = nivel;
		}

		public String getLocalizacion() {
			return localizacion;
		}

		public void setLocalizacion(String localizacion) {
			this.localizacion = localizacion;
		}

		@Override
		public String toString() {
			return "Datos [nombreActividad=" + nombreActividad + ", tipo="
					+ tipo + ", duracionHoras=" + duracionHoras
					+ ", descripcion=" + descripcion + ", nombreCliente="
					+ nombreCliente + ", telefonoCliente=" + telefonoCliente
					+ ", horaInicio=" + horaInicio + ", estado=" + estado
					+ ", numParticipantes=" + numParticipantes
					+ ", fechaActividad=" + fechaActividad + ", idActividad="
					+ idActividad + ", monitor=" + monitor + ", nivel=" + nivel
					+ "]";
		}

		public int getIdReserva() {
			return idReserva;
		}

		public void setIdReserva(int idReserva) {
			this.idReserva = idReserva;
		}
}