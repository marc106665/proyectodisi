package com.naturadventure.dao;

import java.sql.SQLException;
import java.sql.ResultSet;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;



@Repository
public class SupervisarDAO {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class SupervisaMapper implements RowMapper<String> { 

		public String mapRow(ResultSet rs, int rowNum) throws SQLException { 
			String supervisa="";

			supervisa+=rs.getString("tipo");
			return supervisa;
		}
	}


	public List<String> getTiposActividadesSupervisadasPorMonitor(String usuario) {
		List<String> actividadesSupervisadas = this.jdbcTemplate.query("select tipo from supervisar where usuario = ? ",  new Object[] {usuario}, new SupervisaMapper());
		return actividadesSupervisadas;
	}

	public void addSupervision(String tipo, String usuario) {
		this.jdbcTemplate.update(
				"insert into Supervisar(tipo, usuario) values( ?, ?)", tipo , usuario );
	}

}