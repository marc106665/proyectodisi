package com.naturadventure.dao;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.naturadventure.domain.Actividad;


@Repository
public class ActividadDAO {

	private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class ActividadMapper implements RowMapper<Actividad> { 
		
	    public Actividad mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        Actividad actividad = new Actividad();
	        actividad.setNombre(rs.getString("nombre"));
	        actividad.setTipo(rs.getString("tipo"));
	        actividad.setDuracionHoras(rs.getInt("duracionHoras"));
	        actividad.setDescripcion(rs.getString("descripcion"));
	        actividad.setMinParticipantes(rs.getInt("minParticipantes"));
	        actividad.setMaxParticipantes(rs.getInt("maxParticipantes"));
	        actividad.setOferta(rs.getString("oferta"));
	        actividad.setNuevo(rs.getInt("nuevo"));
	        actividad.setLocalizacion(rs.getString("localizacion"));
	        actividad.setFoto(rs.getString("foto"));


	        return actividad;
	    }
	}
	
	public List<Actividad> getActividades() {
		 return this.jdbcTemplate.query("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad", new ActividadMapper());
	}
	
	public List<Actividad> getActividadesDeTipo(String tipo) {
		 return this.jdbcTemplate.query("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad where tipo= ?", new Object[] {tipo} ,new ActividadMapper());
	}
	
	public Actividad getActividad(int idActividad) {
		return this.jdbcTemplate.queryForObject("select idActividad, nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto from actividad where idActividad = ? ",  new Object[] {idActividad}, new ActividadMapper());
	}
	
	// el id es autogenerado?? xq entonces no se lo pasamos x aqui
	public void addActividad(Actividad actividad) {
		this.jdbcTemplate.update(
				"insert into Actividad(nombre, tipo, duracionHoras, descripcion, minParticipantes, maxParticipantes, oferta, nuevo, localizacion, foto) values( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", actividad.getNombre() , actividad.getTipo() ,actividad.getDuracionHoras(), actividad.getDescripcion(), actividad.getMinParticipantes(), actividad.getMaxParticipantes(), actividad.getOferta(), actividad.getNuevo(), actividad.getLocalizacion(), actividad.getFoto() );
	}
	
	public void updateActividad(Actividad actividad) {
		this.jdbcTemplate.update(
				"update actividad set nombre = ?, tipo = ?, duracionHoras = ?, descripcion=?, minParticipantes=?, maxParticipantes=?, oferta=?, nuevo=?, localizacion=?, foto=? where idActividad = ?", actividad.getNombre() , actividad.getTipo() ,actividad.getDuracionHoras(), actividad.getDescripcion(), actividad.getMinParticipantes(), actividad.getMaxParticipantes(), actividad.getOferta(), actividad.getNuevo(), actividad.getLocalizacion(), actividad.getFoto() );
	}
	
	public void deleteActividad(int idActividad) {
		this.jdbcTemplate.update(
		        "delete from actividad where idActividad = ?",
		        idActividad);
	}
	
	
}
