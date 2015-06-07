package com.naturadventure.dao;

import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;








import com.naturadventure.domain.Reserva;


@Repository
public class ReservaDAO {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ReservaMapper implements RowMapper<Reserva> { 
		
	    public Reserva mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        Reserva reserva = new Reserva(); 
	        reserva.setIdReserva(rs.getInt("idReserva")); 
	        reserva.setNombreCliente(rs.getString("nombreCliente")); 
	        reserva.setTelefonoCliente(rs.getString("telefonoCliente")); 
	        reserva.setEmailCliente(rs.getString("emailCliente")); 
	        reserva.setHoraInicio(rs.getString("horaInicio")); 
	        reserva.setEstado(rs.getString("estado")); 
	        reserva.setNumParticipantes(rs.getInt("numParticipantes"));
	        java.sql.Date datesql = rs.getDate("fechaReserva"); 
	        java.util.Date dateutil = new java.util.Date(datesql.getTime());  
	        reserva.setFechaReserva(dateutil); 
	        if ( rs.getDate("fechaActividad") !=  null) { 
	        	datesql = rs.getDate("fechaActividad"); 
	        	dateutil = new java.util.Date(datesql.getTime()); 
	        }else {
	        	dateutil = new java.util.Date(); 
	        }
	        reserva.setFechaActividad(dateutil); 
	        reserva.setIdActividad(rs.getInt("idActividad")); 
	        reserva.setMonitor(rs.getString("monitor")); 
	        reserva.setNivel(rs.getString("nivel")); 



	        return reserva;
	    }
	}
	
	public List<Reserva> getReservas() {
		 return this.jdbcTemplate.query("select idReserva, nombreCliente, telefonoCliente, emailCliente, horaInicio, estado, numParticipantes, fechaReserva,  fechaActividad, monitor, nivel , idActividad from reserva", new ReservaMapper());
	}	 
	
	public Reserva getReserva(int idReserva) {
		return this.jdbcTemplate.queryForObject("select idReserva, nombreCliente, telefonoCliente, emailCliente, horaInicio, estado, numParticipantes, fechaReserva,  fechaActividad, nivel, idActividad, monitor from reserva where idReserva = ? ",  new Object[] {idReserva}, new ReservaMapper());
	}
	
	public int addReserva(Reserva reserva) {
		final String INSERT_SQL = "insert into Reserva (idReserva, nombreCliente, telefonoCliente, emailCliente, horaInicio, estado, numParticipantes, fechaReserva,  fechaActividad, nivel, idActividad, monitor) values(default, ?, ?, ?, ?, 'PENDIENTE', ?, CURRENT_DATE, ?, ?, ?, null)";
		final String nombreCliente = reserva.getNombreCliente();
		final String telefonoCliente = reserva.getTelefonoCliente();
		final String emailCliente = reserva.getEmailCliente();
		final String horaInicio = reserva.getHoraInicio();
		final int numParticipantes = reserva.getNumParticipantes();
		Date fechaActividad = reserva.getFechaActividad();
		final java.sql.Date fechaActividadsql = new java.sql.Date(fechaActividad.getTime()); 
		final String nivel = reserva.getNivel();
		final int idActividad = reserva.getIdActividad();
		
		KeyHolder keyHolder = new GeneratedKeyHolder();
		jdbcTemplate.update(
		    new PreparedStatementCreator() {
		        public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
		            PreparedStatement ps = connection.prepareStatement(INSERT_SQL, new String [] {"idreserva"});
		            ps.setString(1, nombreCliente);
		            ps.setString(2, telefonoCliente);
		            ps.setString(3, emailCliente);
		            ps.setString(4, horaInicio);
		            ps.setInt(5, numParticipantes);
		            ps.setDate(6, fechaActividadsql);
		            ps.setString(7, nivel);
		            ps.setInt(8, idActividad);
		            return ps;
		        }
		    },
		    keyHolder);
		
		return keyHolder.getKey().intValue();
				
		//this.jdbcTemplate.update("insert into Reserva (idReserva, nombreCliente, telefonoCliente, emailCliente, horaInicio, estado, numParticipantes, fechaReserva,  fechaActividad, nivel, idActividad) values(default, ?, ?, ?, ?, 'PENDIENTE', ?, CURRENT_DATE, ?, ?, ?)", reserva.getNombreCliente() , reserva.getTelefonoCliente(), reserva.getEmailCliente(), reserva.getHoraInicio(), reserva.getNumParticipantes(), reserva.getFechaActividad(), reserva.getNivel(), reserva.getIdActividad() );
		
	}																																												
	
	public void updateReserva(Reserva reserva) {
		this.jdbcTemplate.update(
				"update reserva set nombreCliente=?, telefonoCliente=?, emailCliente=?, horaInicio=?, estado=?, numParticipantes=?, fechaReserva=?,  fechaActividad=?, monitor=?, nivel=? where idReserva =?", reserva.getNombreCliente(), reserva.getTelefonoCliente(), reserva.getEmailCliente(), reserva.getHoraInicio(), reserva.getEstado(), reserva.getNumParticipantes(), reserva.getFechaReserva(), reserva.getFechaActividad(), reserva.getMonitor(), reserva.getNivel(),reserva.getIdReserva());
	}
	
	public void updateEstadoReserva(int idreserva, String estado) {
		this.jdbcTemplate.update(
				"update reserva set estado=?, monitor=null where idReserva=?",estado,idreserva);
	}
	
	
	
}
