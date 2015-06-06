package com.naturadventure.backend.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.MonitorDAO;
import com.naturadventure.dao.SupervisarDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller
@RequestMapping("/admin1234")
public class MonitorController {
	
	private MonitorDAO monitorDao;
	private TipoActividadDAO tiposActividades;
	private SupervisarDAO supervisarDao;
	private HttpServletRequest request;

	
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
		List<TipoActividad> actividades = tiposActividades.getTiposActividad();
		Iterator<TipoActividad> iter = actividades.iterator();
		TipoActividad actividad;
		while (iter.hasNext()){
			actividad = iter.next();
			if (request.getParameter(actividad.getTipo()) != null){
				supervisarDao.addSupervision(actividad.getTipo(), monitor.getUsuario());
			}
		}
		
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
			   
			monitorDao.addMonitor(monitor);
			List<TipoActividad> actividades = tiposActividades.getTiposActividad();
			Iterator<TipoActividad> iter = actividades.iterator();
			TipoActividad actividad;
			while (iter.hasNext()){
				actividad = iter.next();
				if (request.getParameter(actividad.getTipo()) != null){
					supervisarDao.addSupervision(actividad.getTipo(), monitor.getUsuario());
				}
			}
			   return "redirect:list.html";
		   }
	
	//Eliminacion
	@RequestMapping(value="/deleteMonitor/{usuario}.html")
	public String processDelete(@ModelAttribute("monitor") Monitor monitor, @PathVariable String usuario, Model model, HttpSession session) {
		if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
		   
		   monitorDao.deleteMonitor(usuario);
		   return "redirect:list.html";
	   }
}
