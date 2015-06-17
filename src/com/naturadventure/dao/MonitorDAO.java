package com.naturadventure.dao;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;


import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.Supervisar;


@Repository
public class MonitorDAO {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class MonitorMapper implements RowMapper<Monitor> { 
		
	    public Monitor mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        Monitor monitor = new Monitor();
	        monitor.setNombre(rs.getString("nombre"));
	        monitor.setEmail(rs.getString("email"));
	        monitor.setUsuario(rs.getString("usuario"));
	        return monitor;
	    }
	}
	
	private static final class SupervisarMapper implements RowMapper<Supervisar> { 
		
	    public Supervisar mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	Supervisar supervisar = new Supervisar();
	    	supervisar.setIdActividad(rs.getString("tipo"));
	    	supervisar.setUsuario(rs.getString("usuario"));
	        
	        return supervisar;
	    }
	}
	
	
	public List<Monitor> getMonitorDeTipo(String idtipo,Date fechaReservaUtil, String horainicio) { 
	      java.sql.Date fechaReservaSql = new java.sql.Date(fechaReservaUtil.getTime());
			List<Monitor> lista = this.jdbcTemplate.query("select monitor.nombre, monitor.email, monitor.usuario from monitor INNER JOIN supervisar on monitor.usuario=supervisar.usuario LEFT OUTER JOIN ( select monitor from reserva where fechaactividad=? and reserva.horainicio=? ) As res on res.monitor=monitor.usuario where  supervisar.tipo=? and res.monitor is null ", new Object[] { fechaReservaSql, horainicio, idtipo}, new MonitorMapper());
			System.out.println("entro en aqui"+lista.toString());
			if (lista != null){ return lista;}
			else {return null;}
	}
	
	
	public List<Monitor> getMonitores() {
		 return this.jdbcTemplate.query("select nombre, email, usuario from monitor", new MonitorMapper());
	}	 
	
	public Monitor getMonitor(String usuario) {
		return this.jdbcTemplate.queryForObject("select nombre, email, usuario from monitor where usuario = ? ",  new Object[] {usuario}, new MonitorMapper());
	}
	
	public void addMonitor(Monitor monitor) {
		this.jdbcTemplate.update(
				"insert into Monitor(nombre, email, usuario) values( ?, ?, ?)", monitor.getNombre() , monitor.getEmail() , monitor.getUsuario() );
	}
	
	public void updateMonitor(Monitor monitor) {
		this.jdbcTemplate.update(
				"update monitor set nombre = ?, email = ? where usuario = ?", monitor.getNombre() , monitor.getEmail() , monitor.getUsuario() );
	}
	
	public void deleteMonitor(String usuario) {
		this.jdbcTemplate.update(
		        "delete from monitor where usuario = ?",
		        usuario);
	}
	
	
}
