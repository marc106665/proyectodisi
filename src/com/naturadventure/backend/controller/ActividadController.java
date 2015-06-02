package com.naturadventure.backend.controller;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import com.naturadventure.domain.TipoActividad;
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
   public String processAddSubmit(HttpSession session, 
		   Model model, 
		   @ModelAttribute("actividad") Actividad actividad,  
		   @ModelAttribute("listatipoactividad") TipoActividad tipoActividad,  
		   @ModelAttribute("horasinicio") HorasInicio horasInicio, 
		   @ModelAttribute("listaniveles") LinkedList<NivelActividad> listaNiveles, 
		   BindingResult bindingResult,
		   HttpServletRequest request)
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
	   
	   	System.out.println(request.getParameter("manyana")+":"+request.getParameter("tarde"));
	   	System.out.println("tipo de actividad: "+tipoActividad.toString()+"\n"+actividad.toString());
	   
       	int id = actividadDao.addActividad(actividad);
       
       	
       	//Franja horaria:
	   	if (request.getParameter("manyana") != null) {
	   		HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("manyana"));
	   		actividadDao.addHoraInicio(objHora);
	   	}
		if (request.getParameter("tarde") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("tarde"));	
	   		actividadDao.addHoraInicio(objHora);
		}
		if (request.getParameter("noche") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("noche"));
	   		actividadDao.addHoraInicio(objHora);
		}
		
		actividad.setOferta("nooferta");
		actividad.setNuevo(0);
       
		//Rebajado o nuevo
		if (request.getParameter("oferta") != null) {
			actividad.setOferta("oferta");
		}else{
			actividad.setOferta("nooferta");
		}
		if (request.getParameter("nuevo") != null) {
			actividad.setNuevo(1);
		}else{
			actividad.setNuevo(0);
		}
		
		//Precio por nivel:
	   	if (request.getParameter("precio1") != null) {//Hay que comprobar el tipo
	   		NivelActividad precio1 = new NivelActividad();
	   		precio1.setIdActividad(id);
	   		precio1.setNivel("PRINCIPIANTE");
	   		precio1.setPrecioPorPersona(Float.valueOf(request.getParameter("precio1")));
	   		actividadDao.addNivelActividad(precio1);
	   	}
		if (request.getParameter("precio2") != null) {
			NivelActividad precio2 = new NivelActividad();
			precio2.setIdActividad(id);
			precio2.setNivel("INTERMEDIO");
			precio2.setPrecioPorPersona(Float.valueOf(request.getParameter("precio2")));
	   		actividadDao.addNivelActividad(precio2);
		}
		if (request.getParameter("precio3") != null) {
			NivelActividad precio3 = new NivelActividad();
			precio3.setIdActividad(id);
			precio3.setNivel("AVANZADO");
			precio3.setPrecioPorPersona(Float.valueOf(request.getParameter("precio3")));
	   		actividadDao.addNivelActividad(precio3);
		}
		
       
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
   
   @RequestMapping(value="/editaActividad/{id}.html")
   public String processUpdate(HttpSession session, Model model, @PathVariable int id) {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	   System.out.println("detrooooooo");
	    Actividad actividad = actividadDao.getActividad(id);
	    
	 	if (actividad != null) {
	 		System.out.println("id:"+id+"- "+actividad.toString());
	 		model.addAttribute("actividad", actividad);
	 		return "redirect:/admin1234/editaActividad.html";
		}
	    
       return "redirect:/admin1234/actividades.html";
   }
    

   @RequestMapping(value="/editarActividad.html", method=RequestMethod.POST) 
   public String processUpdateSubmit(HttpSession session, 
		   Model model, 
		   @ModelAttribute("actividad") Actividad actividad,  
		   @ModelAttribute("listatipoactividad") TipoActividad tipoActividad,  
		   @ModelAttribute("horasinicio") HorasInicio horasInicio, 
		   @ModelAttribute("listaniveles") LinkedList<NivelActividad> listaNiveles, 
		   BindingResult bindingResult,
		   HttpServletRequest request)
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
	   
	   	System.out.println(request.getParameter("manyana")+":"+request.getParameter("tarde"));
	   	System.out.println("tipo de actividad: "+tipoActividad.toString()+"\n"+actividad.toString());
	   
       	int id = actividadDao.addActividad(actividad);
       
       	
       	//Franja horaria:
	   	if (request.getParameter("manyana") != null) {
	   		HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("manyana"));
	   		actividadDao.addHoraInicio(objHora);
	   	}
		if (request.getParameter("tarde") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("tarde"));	
	   		actividadDao.addHoraInicio(objHora);
		}
		if (request.getParameter("noche") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("noche"));
	   		actividadDao.addHoraInicio(objHora);
		}
       
		//Rebajado o nuevo
		if (request.getParameter("oferta") != null) {
			actividad.setOferta("oferta");
		}else{
			actividad.setOferta("nooferta");
		}
		if (request.getParameter("nuevo") != null) {
			actividad.setNuevo(1);
		}else{
			actividad.setNuevo(0);
		}
		
		//Precio por nivel:
	   	if (request.getParameter("precio1") != null) {//Hay que comprobar el tipo
	   		NivelActividad precio1 = new NivelActividad();
	   		precio1.setIdActividad(id);
	   		precio1.setNivel("PRINCIPIANTE");
	   		precio1.setPrecioPorPersona(Float.valueOf(request.getParameter("precio1")));
	   		actividadDao.addNivelActividad(precio1);
	   	}
		if (request.getParameter("precio2") != null) {
			NivelActividad precio2 = new NivelActividad();
			precio2.setIdActividad(id);
			precio2.setNivel("INTERMEDIO");
			precio2.setPrecioPorPersona(Float.valueOf(request.getParameter("precio2")));
	   		actividadDao.addNivelActividad(precio2);
		}
		if (request.getParameter("precio3") != null) {
			NivelActividad precio3 = new NivelActividad();
			precio3.setIdActividad(id);
			precio3.setNivel("AVANZADO");
			precio3.setPrecioPorPersona(Float.valueOf(request.getParameter("precio3")));
	   		actividadDao.addNivelActividad(precio3);
		}
		
       
		return "redirect:/admin1234/actividades.html"; 
   }
   
   
}