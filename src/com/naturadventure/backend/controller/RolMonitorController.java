package com.naturadventure.backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller 
@RequestMapping("/admin1234")
public class RolMonitorController {
	
	   @RequestMapping("/verInfo/{nombre}.html")
	   public String addActividad(HttpSession session, Model model, @PathVariable String nombre) {
		   /*if (session.getAttribute("user") == null) 
	       { 
			      model.addAttribute("user", new UserDetails()); 
			      return "redirect:../admin1234/login.html";
	       } */

	       
		   
		   System.out.println("aquiiii"+nombre);
		   model.addAttribute("mensaje", "hola");
		   
	       return "admin1234/monitor/info";
	       
	   }

}
