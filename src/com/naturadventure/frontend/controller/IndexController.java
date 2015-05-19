package com.naturadventure.frontend.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.NivelActividad;

import com.naturadventure.obj.Dato;

@Controller
public class IndexController {


	
	
	
 
	private TipoActividadDAO tipoActividadDao; 
	private ActividadDAO actividadDao;
	
	@Autowired
    public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
        this.tipoActividadDao = tipoActividadDAO;
    }
	
	@Autowired
    public void setActividadDAO(ActividadDAO actividadDAO) { 
        this.actividadDao = actividadDAO;
    }
	
	@RequestMapping("/index")
	    public String index(Model model) {
		 model.addAttribute("tiposdeactividades", tipoActividadDao.getTiposActividad());
	        return "index";
	    }
	
	 @RequestMapping(value="/actividad/{tipo}", method = RequestMethod.GET) 
	    public String viewTActividad(Model model, @PathVariable String tipo) {
		 	model.addAttribute("tipoactividad", tipoActividadDao.getTipoActividad(tipo));
		 //	HashMap<String, Dato> mapadeniveles = new HashMap<String, Dato>();
		 
		 	
	        HashMap<String, List<Actividad>> mapadeniveles = new HashMap<String, List<Actividad>>();
	       
	       // HashMap<String, HashMap<Integer, Float>> idActividadPorNiveles = new HashMap<String, HashMap<Integer, Float>>();
		 	List<NivelActividad> listaNiveles = new LinkedList<NivelActividad>(); 
		 	List<Actividad> listaActividades = actividadDao.getActividadesDeTipo(tipo);
	        List<String> listaNivelesUnicos = actividadDao.getNivelesUnicos();
	        
	     //   List<Actividad> listaActividadesprintar = new LinkedList<Actividad>();
	        String nivelVar = ""; 
	        if (listaActividades != null){
	        for(Actividad actividad : listaActividades) {
	     
	        	listaNiveles =  actividadDao.getNivelActividad(actividad.getIdActividad());
	       	 	System.out.println("ide actividad  " + actividad.getIdActividad());
	       	 	
	       	 	//Dato dato=null;
	       	 	List<Actividad> auxlista = null;
	        	for(NivelActividad nivel : listaNiveles) {
	        		
	        		
	        		HashMap<Integer, Double> precioPoridActividad = new HashMap<Integer, Double>();
	        		precioPoridActividad.put(actividad.getIdActividad(), (double) nivel.getPrecioPorPersona());
	        		
	        		List<Actividad> listaActividadesVar = new LinkedList<Actividad>();
	        	 	listaActividadesVar.add(actividad);
	        	 	
	        	 	
	        	 	if(auxlista != null){ //Si ya existian valores...
	        	 		auxlista = mapadeniveles.get(nivel.getNivel());
	        			if(auxlista == null){
	        				auxlista = new LinkedList<Actividad>();
	        				auxlista.addAll(listaActividadesVar);
	        			}else{
	        				auxlista.addAll(listaActividadesVar);
	        			}
	        		}else// Es la primera iteracion...
	        			auxlista = new LinkedList<Actividad>();
	        	 		auxlista.addAll(listaActividadesVar);
	        		
	        		mapadeniveles.put(nivel.getNivel(), auxlista);
	        		auxlista = null;
	        	/*	if(dato != null){ //Si ya existian valores...
	        			dato = mapadeniveles.get(nivel.getNivel());
	        			if(dato == null){
	        				dato = new Dato(listaActividadesVar, precioPoridActividad);
	        				dato.añadir(listaActividadesVar, precioPoridActividad);
	        			}else{
	        				dato.añadir(listaActividadesVar, precioPoridActividad);
	        			}
	        		}else// Es la primera iteracion...
	        			dato = new Dato(listaActividadesVar, precioPoridActividad); 
	        		
	        		mapadeniveles.put(nivel.getNivel(), dato);
	        	*/
	        	//	System.out.println(" nivel  " +nivel.getNivel() + " nombre actividad " + actividad.getIdActividad());
	        	}
	       
	        }
	        }
	        
	    /*    for(String nivel2 : listaNivelesUnicos) {
	        	System.out.println(" nivel  " +nivel2 );
	        	List<Actividad> listacatividades = null;
	        	listacatividades = mapadeniveles.get(nivel2);
	        	for(Actividad act : listacatividades) {
	        		System.out.println(" nivel  " +nivel2 + " nombre actividad " + act.getIdActividad());
		        	
		        }
	        	
	        }
	      */  
	       
	       model.addAttribute("listaNiveles", listaNivelesUnicos );
	       
	       model.addAttribute("mapaListaActividadesPorNiveles", mapadeniveles );
	       return "actividad"; 
	       
	       // model.addAttribute("mapaPreciosPorIdactividadesPorNiveles", idActividadPorNiveles );
	        
	       
	    } 
	
}
