package es.uji.ei1027.clubesportiu.pais;

import java.util.List;

import es.uji.ei1027.clubesportiu.dao.Actividad;
import es.uji.ei1027.clubesportiu.dao.Pais;

public interface CapitalService {
	public String getNomCapital(String pais);
	public List<Pais> getAllPaises();
	public List<Actividad> getAllActividades();
}
