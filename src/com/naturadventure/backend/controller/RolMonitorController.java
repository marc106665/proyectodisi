package com.naturadventure.backend.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.ReservaDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UsuarioDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.Reserva;
import com.naturadventure.domain.ReservaActividad;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;

@Controller 
@RequestMapping("/admin1234")
public class RolMonitorController {
		
	   private TipoActividadDAO tipoActividaDao;
	   private ActividadDAO actividadDao;
	   private ReservaDAO reservaDao;
	   private UsuarioDAO usuarioDao;
	   
	   @Autowired
	   public void setActividadDAO(ActividadDAO actividadDAO) { 
	       this.actividadDao = actividadDAO;
	   }
	   
	   @Autowired
	   public void setReservaDAO(ReservaDAO reservaDAO) { 
	       this.reservaDao = reservaDAO;
	   }
	   
	   @Autowired
	   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
	       this.tipoActividaDao = tipoActividadDAO;
	   }
	   
	   @Autowired
	   public void setUsuarioDAO(UsuarioDAO usuarioDao) { 
	       this.usuarioDao = usuarioDao;
	   }
	   
	   @RequestMapping("/verInfo/{idReserva}.html")
	   public String addActividad(HttpSession session, Model model, @PathVariable int idReserva) {
		   if (session.getAttribute("user") == null) 
	       { 
			      model.addAttribute("user", new UserDetails()); 
			      return "redirect:../login.html";
	       }
		   

		   Reserva reserva = reservaDao.getReserva(idReserva);
		   System.out.println(reserva.toString());
		   ReservaActividad datos = new ReservaActividad();
		   //Actividad:
		   Actividad acti = actividadDao.getActividad(reserva.getIdActividad());
		   //System.out.println(acti.toString());		   
		   datos.setDuracionHoras(acti.getDuracionHoras());
		   datos.setNombreActividad(acti.getNombre());
		   datos.setTipo(acti.getTipo());
		   datos.setLocalizacion(acti.getLocalizacion());
		   
		   //Tipo de actividad:
		   TipoActividad tipo = tipoActividaDao.getTipoActividad(acti.getTipo());
		   datos.setDescripcion(tipo.getDescripcion());
		   
		   //Reserva:
		   datos.setEstado(reserva.getEstado());
		   datos.setFechaActividad(reserva.getFechaActividad());
		   datos.setIdActividad(reserva.getIdActividad());
		   datos.setMonitor(reserva.getMonitor());
		   datos.setNivel(reserva.getNivel());
		   datos.setNombreCliente(reserva.getNombreCliente());
		   datos.setNumParticipantes(reserva.getNumParticipantes());
		   
		   model.addAttribute("idReserva", reserva.getIdReserva());
		   model.addAttribute("datos", datos);
		   model.addAttribute("idMonitor", session.getAttribute("usuario"));
		   
	       return "admin1234/monitor/info";
	       
	   }
	   
	   
	
	   
	   
	   @RequestMapping(value="/miCuenta/{usuario}.html", method=RequestMethod.GET)
	   public String processUpdate(HttpSession session, Model model, @PathVariable String usuario) {
		   if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
		  

		   UserDetails cuenta = usuarioDao.getUsuario(usuario);
		   UserDetails editarCuenta = new UserDetails();
		   editarCuenta.setUsuario(cuenta.getUsuario());
		   editarCuenta.setContrasenya(cuenta.getContrasenya());;
		   editarCuenta.setRol(cuenta.getRol());
		   
		   
		   if (editarCuenta != null) {
			   
		 	   model.addAttribute("cuenta", editarCuenta);
		 	   
		 	   return "admin1234/monitor/miCuenta";
		   }
		return "admin1234/monitor/miCuenta";
		   
	   }
	   
	    
	   

	   @RequestMapping(value="/miCuenta.html", method=RequestMethod.POST) 
	   public String processUpdateSubmit(HttpSession session, 
			   Model model, 
			   @ModelAttribute("cuenta") UserDetails usuario,   
			   BindingResult bindingResult,
			   HttpServletRequest request)
	   {
		   	if (session.getAttribute("user") == null) 
		   	{ 
		   		model.addAttribute("user", new UserDetails()); 
		   		return "redirect:admin1234/login.html";
		   	}
		   	
			BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 

		   	String pass = passwordEncryptor.encryptPassword(usuario.getContrasenya());
			usuario.setContrasenya(pass);
		   	
			usuarioDao.updateUsuario(usuario);
	       
	       
			return "redirect:/admin1234/"+usuario.getUsuario()+".html"; 
		   	
	   }
	   

}
