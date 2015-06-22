package com.naturadventure.backend.controller;

import java.util.ArrayList;
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

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.MonitorDAO;
import com.naturadventure.dao.ReservaDAO;
import com.naturadventure.dao.SupervisarDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.Reserva;
import com.naturadventure.domain.ReservaActividad;
import com.naturadventure.domain.Supervisar;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class UserController {
   private UserDAO userDao;
   private ActividadDAO actividadDao;
   private TipoActividadDAO tipoActividadDao;
   private ReservaDAO reservaDao;
   private MonitorDAO monitorDao;
   private SupervisarDAO supervisarDao;
	
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
   
   @Autowired 
   public void setMonitorDao(MonitorDAO monitorDao) {
       this.monitorDao = monitorDao;
   }
   
   @Autowired 
   public void setSupervisarDao(SupervisarDAO supervisarDao) {
       this.supervisarDao = supervisarDao;
   }
  
   @RequestMapping("/inicio.html") 
   public String listSocis(HttpSession session, Model model) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 
       List<Reserva> listaReservasPendientes = reservaDao.getReservasPendientes();
       List<Actividad> listaActividades;
       
//       Iterator<Reserva> it = listaReservasPendientes.iterator();
//       while (it.hasNext()) {
//		   Reserva reserva = it.next();
//		   Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
//		   TipoActividad tipo = tipoActividadDao.getTipoActividad(actividad.getTipo());
//       }
       
       //System.out.println(listaReservasPendientes);
       if(listaReservasPendientes != null){
    	   model.addAttribute("reservas", listaReservasPendientes);
    	   
    	   
       }
       
       
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
       
       return "admin1234/actividades/actividades";
       
   }

   
   @RequestMapping("/monitores.html") 
   public String monitores(HttpSession session, Model model, HttpServletRequest request) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 

       List<Monitor> listaMonitores = new LinkedList<Monitor>(monitorDao.getMonitores());
       HashMap<String, List<String>> mo = new HashMap<String, List<String>>();
       
       //System.out.println(actividadDao.getActividades());

       
       Iterator<Monitor> it = listaMonitores.iterator();
       while (it.hasNext()) {
		Monitor monitor = (Monitor) it.next();
		//Lista de tipos:
		mo.put(monitor.getUsuario(), supervisarDao.getTiposActividadesSupervisadasPorMonitor(monitor.getUsuario()));
		
	}
       
       if(listaMonitores != null)
    	   model.addAttribute("monitores", listaMonitores);
       
       if (mo !=null) {
    	   model.addAttribute("supervisar", mo);
	}
       
       
       return "admin1234/monitores/monitores";
       
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
       
       return "admin1234/tiposActividad/tiposActividades";
       
   }
   
   @RequestMapping(value="/{nombreMonitor}.html", method=RequestMethod.GET)
   public String processDelete(HttpSession session, Model model, @PathVariable String nombreMonitor) {
	   
	   
	   if (session.getAttribute("user") == null) //Tambien comprueba que coincide su user de session con su nombre url
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:login.html";
	   }
	   
	   
	   List<ReservaActividad> listaReservaActividad = new LinkedList<ReservaActividad>();
	   List<ReservaActividad> listaActividadesPendientes = new LinkedList<ReservaActividad>();
	   List<Reserva> listaReservas = new LinkedList<Reserva>();
	   
	   boolean aunNoSeHaRealizado = false;
	   
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
		   datos.setIdReserva(reserva.getIdReserva());
		   
		   java.util.Date utilDate = new java.util.Date(); //La fecha del servidor AHORA
		   java.util.Date sqlDate = new java.util.Date(reserva.getFechaActividad().getTime());
		   if (sqlDate.after(utilDate)){ //La fecha de la reserva es despues de la fecha actual
		      System.out.println("aun no hecha"); 
		      aunNoSeHaRealizado = true;
		   }else{ 
		      System.out.println("ya hecha"); 
		      aunNoSeHaRealizado = false;
		   }
		   
		   if(aunNoSeHaRealizado == false )//Si ya se ha realizado, que vaya a la tabla del historial de actividades
			   listaReservaActividad.add(datos);
		   else
			   listaActividadesPendientes.add(datos);
		   
	   }
	   
	   model.addAttribute("listaPendiente", listaActividadesPendientes);
	   model.addAttribute("listaReservas", listaReservaActividad);
	   model.addAttribute("idMonitor", monitor.getUsuario());
	   
       return "admin1234/monitor/monitor";
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