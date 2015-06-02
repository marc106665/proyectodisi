package com.naturadventure.backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class TipoActividadController {
   private UserDAO userDao;
   private TipoActividadDAO tipoActividadDao;
	
   @Autowired
   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
       this.tipoActividadDao = tipoActividadDAO;
   }
   
   @RequestMapping(value="/addTipoActividad.html", method=RequestMethod.POST) 
   public String processAddSubmit(HttpSession session, Model model, @ModelAttribute("tipo") TipoActividad tipoActividad, BindingResult bindingResult) 
   {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/inicio.html";
	   }
	   if (bindingResult.hasErrors()) 
		   return "redirect:admin1234/inicio.html";
	   
	   
       tipoActividadDao.addTipoActividad(tipoActividad);
       return "redirect:../admin1234/tiposActividades.html"; 
   }
 
   @RequestMapping(value="/borrarTipoActividad/{tipo}.html")
   public String processDelete(HttpSession session, Model model, @PathVariable String tipo) {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	    TipoActividad tipoActividad = tipoActividadDao.getTipoActividad(tipo);
	 	
	    System.out.println(" OK " + tipoActividad.toString());
	    tipoActividadDao.deleteTipoActividad(tipo);
       return "redirect:/admin1234/actividades.html";
   }
   
   
   
}