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
public class PaisesDAO {
	 
	private JdbcTemplate jdbcTemplate;
     
	@Autowired
	public void setDataSource(DataSource dataSource) {
	        this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	private static final class PaisMapper implements RowMapper<Pais> { 
		
	    public Pais mapRow(ResultSet rs, int rowNum) throws SQLException { 
	        Pais pais = new Pais();
	        pais.setNom(rs.getString("pais"));
			pais.setCapital(rs.getString("capital"));
	        return pais;
	    }
	}

	public List<Pais> getPaises() {
		 return this.jdbcTemplate.query("select pais, capital from pais", new PaisMapper());
	}	 
		
	public Pais getPais(String nom) {
		return this.jdbcTemplate.queryForObject("select pais, capital from pais where pais=?",  new Object[] {nom}, new PaisMapper());
	}
	
	public void addPais(Pais pais) {
		this.jdbcTemplate.update(
				"insert into Pais(pais, capital) values(?, ?)", pais.getNom(), pais.getCapital());
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

}