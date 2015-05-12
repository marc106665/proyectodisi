package es.uji.ei1027.clubesportiu.dao;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;
import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

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
	        actividad.setIdActividad(rs.getInt("idActividad"));
			actividad.setNombre(rs.getString("nombre"));
			//.....implementariamos el resto....
	        return actividad;
	    }
	}

	public List<Actividad> getActividades() {
		 
		 
		 return this.jdbcTemplate.query("select "
		 		+ "idActividad, "
		 		+ "nombre"
		 		+ " from actividad a, nivel n"
		 		+ " where a.idActividad = n.idActividad", 
		 		new ActividadMapper());
	}	 
		
	public Actividad getActividad(int idActividad) {
		return this.jdbcTemplate.queryForObject("select nombre from actividad where idActividad=?",  new Object[] {idActividad}, new ActividadMapper());
	}
	
	/*public void addActividad(Actividad actividad) {
		this.jdbcTemplate.update(
				"insert into actividad(capital) values(?, ?)", actividad.getNombre(), actividad.get...);
	}
		
	public void updatePais(Pais pais) {
		this.jdbcTemplate.update(
				"update Nadador set capital = ? where nom = ?", pais.getCapital(), pais.getNom());
	}
		
	public void deletePais(Pais pais) {
		this.jdbcTemplate.update(
		        "delete from pais where nom = ?",
		        pais.getNom());
	}
	*/

}