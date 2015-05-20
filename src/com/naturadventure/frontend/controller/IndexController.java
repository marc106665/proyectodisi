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
		 	
	        HashMap<String, List<Actividad>> mapadeniveles = new HashMap<String, List<Actividad>>();
	       	HashMap<String, HashMap<Integer, Double>> mapaDePrecios = new HashMap<String, HashMap<Integer, Double>>();

		 	List<NivelActividad> listaNiveles = new LinkedList<NivelActividad>(); 
		 	List<Actividad> listaActividades = actividadDao.getActividadesDeTipo(tipo);
	      //  List<String> listaNivelesUnicos = actividadDao.getNivelesUnicos();
	        
	        String nivelVar = ""; 
	        if (listaActividades != null){
	        for(Actividad actividad : listaActividades) {
	     
	        	listaNiveles =  actividadDao.getNivelActividad(actividad.getIdActividad());
	       	 	//System.out.println("ide actividad  " + actividad.getIdActividad());
	       	 	
	       	 	//Dato dato=null;
	       	 	
	        	for(NivelActividad nivel : listaNiveles) {
	        		List<Actividad> auxlista = new LinkedList<Actividad>();
	        		HashMap<Integer, Double> auxmap = new HashMap<Integer, Double>();

	        		HashMap<Integer, Double> precioPoridActividad = new HashMap<Integer, Double>();
	        		precioPoridActividad.put(actividad.getIdActividad(), (double) nivel.getPrecioPorPersona());
	        		
	        		List<Actividad> listaActividadesVar = new LinkedList<Actividad>();
	        	 	listaActividadesVar.add(actividad);
	        	 	
	        	 	if ( mapadeniveles.get(nivel.getNivel()) != null ){
	        	 		auxlista.addAll(mapadeniveles.get(nivel.getNivel()));	
	        	 	}  
	        	 	if ( mapaDePrecios.get(nivel.getNivel()) != null ){
	        	 		auxmap.putAll(mapaDePrecios.get(nivel.getNivel()));	
	        	 	}


	        		auxlista.addAll(listaActividadesVar);
	        		auxmap.putAll(precioPoridActividad);

	        		mapadeniveles.put(nivel.getNivel(), auxlista);
	        		mapaDePrecios.put(nivel.getNivel(), auxmap);
	        		auxlista = null;
	        		auxmap = null;
	        		//System.out.println(" nivel  " +nivel.getNivel() + " nombre actividad " + actividad.getIdActividad());
	        	}
	       
	        }
	        }
	      
	       
	    //   model.addAttribute("listaNiveles", listaNivelesUnicos );
	       
	       model.addAttribute("mapaListaActividadesPorNiveles", mapadeniveles );
	       model.addAttribute("precioPoridActividad", mapaDePrecios );
	       
	       return "actividad"; 
	       
	    
	        
	       
	    } 
	 
	 @RequestMapping(value="/actividad/reserva/{idActividad}", method = RequestMethod.GET)
	    public String reserva(Model model, @PathVariable Integer idActividad) {
		
	        return "reserva";
	    }
	
	 @RequestMapping("/actividad/pedido")
	    public String pedido() {
		
	        return "pedido";
	    }
}
