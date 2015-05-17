package com.naturadventure.frontend.controller;

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
	        model.addAttribute("actividades", actividadDao.getActividadesDeTipo(tipo));
	        return "actividad"; 
	    } 
	
}
