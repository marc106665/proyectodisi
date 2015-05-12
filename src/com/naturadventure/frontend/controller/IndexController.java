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


@Controller
public class IndexController {

	private TipoActividadDAO tipoActividadDao; 
	
	@Autowired
    public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
        this.tipoActividadDao = tipoActividadDAO;
    }
	
	@RequestMapping("/welcome")
	    public String index(Model model) {
		 model.addAttribute("tiposdeactividades", tipoActividadDao.getTiposActividad());
	        return "welcome";
	    }
	
	
}
