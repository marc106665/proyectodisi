package com.naturadventure.backend.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;

public class RolMonitorController {

	@Controller 
	@RequestMapping("/admin1234") 
	public class ActividadController {
	   private UserDAO userDao;
	   private ActividadDAO actividadDao;
	   private TipoActividadDAO tipoActividadDao;
		
	   @Autowired
	   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
	       this.tipoActividadDao = tipoActividadDAO;
	   }
	   
	   @Autowired
	   public void setActividadDAO(ActividadDAO actividadDAO) { 
	       this.actividadDao = actividadDAO;
	   }
	   
	   
	   @RequestMapping(value="/verReserva/{nombre}.html", method=RequestMethod.GET)
	   public String addActividad(HttpSession session, Model model, @PathVariable String nombre) {
		   /*if (session.getAttribute("user") == null) 
	       { 
			      model.addAttribute("user", new UserDetails()); 
			      return "redirect:../admin1234/login.html";
	       } */

	       
		   System.out.println("aquiiii");
		   model.addAttribute("mensaje", "hola");
		   
	       return "admin1234/monitor/info";
	       
	   }
	   
	}
}
