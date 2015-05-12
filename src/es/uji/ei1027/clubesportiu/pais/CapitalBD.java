package es.uji.ei1027.clubesportiu.pais;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import es.uji.ei1027.clubesportiu.dao.Actividad;
import es.uji.ei1027.clubesportiu.dao.ActividadDAO;
import es.uji.ei1027.clubesportiu.dao.Pais;
import es.uji.ei1027.clubesportiu.dao.PaisesDAO;

@Service 
public class CapitalBD implements CapitalService {

	@Autowired
	PaisesDAO paisesDao;
	
	@Autowired
	ActividadDAO actividadDao;
	
	@Override
	public String getNomCapital(String nombrePais) {  
		Pais pais = paisesDao.getPais(nombrePais);
		return pais.getCapital();
	}

	@Override
	public List<Pais> getAllPaises() {
		List<Pais> lPais = paisesDao.getPaises();
		return lPais;
	}

	@Override
	public List<Actividad> getAllActividades() {
		List<Actividad> lActividades = actividadDao.getActividades();		
		return lActividades;
	}
}