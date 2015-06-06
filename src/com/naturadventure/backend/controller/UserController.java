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
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.Reserva;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class UserController {
   private UserDAO userDao;
   private ActividadDAO actividadDao;
   private TipoActividadDAO tipoActividadDao;
   private ReservaDAO reservaDao;
	
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
   
   @Autowired
   public void setReservaDAO(ReservaDAO reservaDAO) { 
       this.reservaDao = reservaDAO;
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
   
   @RequestMapping(value="/{nombreMonitor}.html", method=RequestMethod.GET)
   public String processDelete(HttpSession session, Model model, @PathVariable String nombreMonitor) {
	   
	   
	   /*if (session.getAttribute("user") == null) //Tambien comprueba que coincide su user de session con su nombre url
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }*/
	   
	   
	   //System.out.println(nombreMonitor);
	   model.addAttribute("idMonitor", nombreMonitor);
	   
	   List<ReservaActividad> listaReservaActividad = new LinkedList<ReservaActividad>();
	   
	   List<Reserva> listaReservas = new LinkedList<Reserva>();
	   Monitor monitor = new Monitor();
	   monitor.setUsuario(nombreMonitor);
	   
	   listaReservas.addAll(reservaDao.getReservas(monitor));
	   
	   Iterator<Reserva> it = listaReservas.iterator();
	   while (it.hasNext()) {
		   Reserva reserva = it.next();
		   ReservaActividad datos = new ReservaActividad();
		   //Actividad:
		   Actividad acti = actividadDao.getActividad(reserva.getIdActividad());
		   datos.setDescripcion(acti.getDescripcion());
		   datos.setDuracionHoras(acti.getDuracionHoras());
		   datos.setNombreActividad(acti.getNombre());
		   datos.setTipo(acti.getTipo());
		   
		   //Reserva:
		   datos.setEstado(reserva.getEstado());
		   datos.setFechaActividad(reserva.getFechaActividad());
		   datos.setIdActividad(reserva.getIdActividad());
		   datos.setMonitor(reserva.getMonitor());
		   datos.setNivel(reserva.getNivel());
		   datos.setNombreCliente(reserva.getNombreCliente());
		   datos.setNumParticipantes(reserva.getNumParticipantes());
		   
		   listaReservaActividad.add(datos);
	   }
	   
	   
	   model.addAttribute("listaReservas", listaReservaActividad);
	   
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