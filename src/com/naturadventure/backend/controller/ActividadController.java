package com.naturadventure.backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class ActividadController {
   private UserDAO userDao;
   private ActividadDAO actividadDao;
	
   @Autowired
   public void setActividadDAO(ActividadDAO actividadDAO) { 
       this.actividadDao = actividadDAO;
   }
   
   @RequestMapping(value="/addActividad.html", method=RequestMethod.POST) 
   public String processAddSubmit(HttpSession session, Model model, @ModelAttribute("actividad") Actividad actividad, BindingResult bindingResult) 
   {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/actividad.html";
	   }
	   if (bindingResult.hasErrors()) 
		   return "redirect:admin1234/actividad.html";
	   
	   System.out.println(actividad.toString());
	   
       //actividadDao.addActividad(actividad);
       return "redirect:admin1234/actividad.html"; 
   }
 
   
   
   
}