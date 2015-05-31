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
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.Reserva;
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
   public String processAddSubmit(HttpSession session, Model model, @ModelAttribute("actividad") Actividad actividad,  @ModelAttribute("horasinicio") HorasInicio horasInicio, /*@ModelAttribute("listaniveles") List<NivelActividad> listaNiveles,*/ BindingResult bindingResult) 
   {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
//	   if (bindingResult.hasErrors()){
//		   System.out.println("error\n"+actividad.toString()+"\n"+bindingResult.toString());
//		   return "redirect:/admin1234/actividades.html";
//	   }
	   
	   System.out.println(actividad.toString());
	   
       int id = actividadDao.addActividad(actividad);

       System.out.println("id"+id+":"+actividad.toString());
       
//       for (int i = 0; i < listaNiveles.size(); i++) {
//    	   NivelActividad nivel = new NivelActividad();
//    	   nivel.setIdActividad(id);
//           
//           nivel.setNivel(listaNiveles.get(i).getNivel());
//           nivel.setPrecioPorPersona(listaNiveles.get(i).getPrecioPorPersona());
//           
//           System.out.println("id devuelto es:"+id+"-"+nivel.toString());
//           //actividadDao.addNivel(nivel);
//           
//       }
       
     //actividadDao.addNivel(nivel);
       
       
       
       
       
       return "redirect:/admin1234/actividades.html"; 
   }
 
   
   @RequestMapping(value="/borrarActividad/{id}.html")
   public String processDelete(HttpSession session, Model model, @PathVariable int id) {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	   
	    Actividad actividad = actividadDao.getActividad(id);
	 	if (actividad != null) {
	 		actividadDao.deleteActividad(id);
	 		return "redirect:/admin1234/actividades.html";
		}
	    //System.out.println(" OK " + actividad.toString());
	   
       return "redirect:/admin1234/actividades.html";
   }
   
   
}