package com.naturadventure.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;




import com.naturadventure.domain.TipoActividad;

public class TipoActividadDAO {

	
private JdbcTemplate jdbcTemplate;
    
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class TipoActividadMapper implements RowMapper<TipoActividad> { 
		
	    public TipoActividad mapRow(ResultSet rs, int rowNum) throws SQLException { 
	    	TipoActividad tipoActividad = new TipoActividad();
	    	tipoActividad.setTipo(rs.getString("tipo"));
	    	tipoActividad.setDescripcion(rs.getString("descripcion"));
	    	tipoActividad.setFoto(rs.getString("foto"));
	    	tipoActividad.setRequisitos(rs.getString("requisitos"));
	        return tipoActividad;
	    }
	}
	
	public List<TipoActividad> getTiposActividad() {
//		List<TipoActividad> lista= new ArrayList<TipoActividad>();
//		TipoActividad tipoActividad = new TipoActividad();
//		tipoActividad.setTipo("");
//    	tipoActividad.setDescripcion("descripcion");
//    	tipoActividad.setFoto("");
//    	tipoActividad.setRequisitos("");
		return this.jdbcTemplate.query("select tipo, descripcion, foto, requisitos from TipoActividad", new TipoActividadMapper());
	}	
	
	public TipoActividad getTipoActividad(String tipo) {
		return this.jdbcTemplate.queryForObject("select tipo, descripcion, foto, requisitos from TipoActividad where tipo = ? ",  new Object[] {tipo}, new TipoActividadMapper());
	}
	
	public void addTipoActividad(TipoActividad tipoActividad) {
		this.jdbcTemplate.update(
				"insert into TipoActividad(tipo, descripcion, foto, requisitos ) values( ?, ?, ?, ?)", tipoActividad.getTipo() , tipoActividad.getDescripcion() , tipoActividad.getFoto() , tipoActividad.getRequisitos() );
	}
	
	public void updateTipoActividad(TipoActividad tipoActividad) {
		this.jdbcTemplate.update(
				"update TipoActividad set descripcion = ?, foto = ?, requisitos = ?  where tipo = ?", tipoActividad.getDescripcion() , tipoActividad.getFoto() , tipoActividad.getRequisitos() , tipoActividad.getTipo() );
	}
	
	
	public void deleteTipoActividad(String tipo) {
		this.jdbcTemplate.update(
		        "delete from TipoActividad where tipo = ?",
		        tipo);
	}
}
