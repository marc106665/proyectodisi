package com.naturadventure.backend.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.domain.ReservaActividad;
import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.ReservaDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class UserController {
   private UserDAO userDao;
   private ActividadDAO actividadDao;
   private TipoActividadDAO tipoActividadDao;
   private ReservaDAO reservaActividadDao;
	
   @Autowired
   public void setActividadDAO(ActividadDAO actividadDAO) { 
       this.actividadDao = actividadDAO;
   }
	
   @Autowired
   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
       this.tipoActividadDao = tipoActividadDAO;
   }
   
   @Autowired 
   public void setSociDao(UserDAO userDao) {
       this.userDao = userDao;
   }
   
  
   @RequestMapping("/inicio.html") 
   public String listSocis(HttpSession session, Model model) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 
       
    // Create an ArrayList with test data
       ArrayList list = new ArrayList();
       Map author1 = new HashMap();
       author1.put("name", "A");
       author1.put("id", new Integer(1));
       list.add(author1);
       Map author2 = new HashMap();
       author2.put("name", "B");
       author2.put("id", new Integer(2));
       list.add(author2);
       Map author3 = new HashMap();
       author3.put("name", "C");
       author3.put("id", new Integer(3));
       list.add(author3);
       
       model.addAttribute("reservas", list);
       
       return "admin1234/inicio";
   }
   
   @RequestMapping("/actividades.html") 
   public String actividades(HttpSession session, Model model, HttpServletRequest request) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 

       List<Actividad> aux = null;
       //System.out.println(actividadDao.getActividades());
       aux = actividadDao.getActividades();
       
       if(aux != null)
    	   model.addAttribute("listaActividades", aux);
       
       return "admin1234/actividades";
       
   }
   
   @RequestMapping(value="/monitor/{nombreMonitor}.html", method=RequestMethod.GET)
   public String processDelete(HttpSession session, Model model, @PathVariable String nombreMonitor) {
	   
	   
	   /*if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }*/
	   
	   
	   //System.out.println(nombreMonitor);
	   model.addAttribute("idMonitor", nombreMonitor);
	   
	   List<ReservaActividad> listaReservas = new LinkedList<ReservaActividad>();
	   ReservaActividad datos = new ReservaActividad();
	   datos.setNombreActividad("actividad test");
	   datos.setTipo("tipo de actividad");
	   datos.setNumParticipantes(20);
	   datos.setIdActividad(2);
	   datos.setFechaActividad(new java.util.Date());
	   
	   
	   listaReservas.add(datos);
	   
	   
	   model.addAttribute("listaReservas", listaReservas);
	   
       return "admin1234/monitor/monitor";
   }


   @RequestMapping("/tiposActividades.html") 
   public String tipoActividades(HttpSession session, Model model, HttpServletRequest request) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 
       
       List<TipoActividad> aux = null;
       //System.out.println(actividadDao.getActividades());
       aux = tipoActividadDao.getTiposActividad();
       
       if(aux != null)
    	   model.addAttribute("listaTipoActividades", aux);
       
       return "admin1234/tiposActividades";
       
   }
   
   /*
   @RequestMapping("/nuevoTipoActividad.html") 
   public String addTipoActividad(HttpSession session, Model model) {
	   if (session.getAttribute("user") == null) 
       { 
		   model.addAttribute("user", new UserDetails()); 
           return "admin1234/login";
       } 
       
	   List<TipoActividad>listaTipoActividad = tipoActividadDao.getTiposActividad();
	   //System.out.println(listaTipoActividad);
	   model.addAttribute("listaTipoActividades", listaTipoActividad);
	   model.addAttribute("tipoActividad", new TipoActividad());
	   model.addAttribute("fra", new TipoActividad());
	   
       return "admin1234/nuevoTipoActividad";
       
   }*/
   
}