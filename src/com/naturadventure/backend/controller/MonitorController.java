package com.naturadventure.backend.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.MonitorDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller
@RequestMapping("/admin1234")
public class MonitorController {
	
	private MonitorDAO monitorDao;
	private ActividadDAO actividadDao;
	
	
	// Creacion
	@RequestMapping("/nuevoMonitor.html") 
	   public String addMonitor(@ModelAttribute("monitor") Monitor monitor, HttpSession session, Model model){
		if (session.getAttribute("user") == null) 
	       { 
			   model.addAttribute("user", new UserDetails()); 
	           return "admin1234/login";
	       }
		return "admin1234/nuevoMonitor";
	}
	
	@RequestMapping(value = "/nuevoMonitor.html", method=RequestMethod.POST) 
	   public String processAddSubmit(@ModelAttribute("monitor") Monitor monitor, HttpSession session, Model model){
		if (session.getAttribute("user") == null) 
	       { 
			   model.addAttribute("user", new UserDetails()); 
	           return "admin1234/login";
	       }
		
		monitorDao.addMonitor(monitor);
		return "redirect:list.html";
	}
	
	 
	
	//Modificacion
	@RequestMapping(value="/editMonitor/{usuario}.html", method=RequestMethod.GET)
	public String editMonitor(HttpSession session, Model model, @PathVariable String usuario) {
		if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
		   
		   model.addAttribute("monitor", monitorDao.getMonitor(usuario));
		   return "admin1234/editaMonitor";
	   }	
	
	
	@RequestMapping(value="/editMonitor/{usuario}.html", method=RequestMethod.GET)
		public String processUpdateSubmit(@ModelAttribute("monitor") Monitor monitor, HttpSession session, Model model, @PathVariable String usuario) {
			if (session.getAttribute("user") == null) 
			   { 
			      model.addAttribute("user", new UserDetails()); 
			      return "redirect:admin1234/login.html";
			   }
			   
			   monitorDao.updateMonitor(monitor);
			   return "redirect:list.html";
		   }
}
