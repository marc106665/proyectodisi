package com.naturadventure.backend.controller;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.MonitorDAO;
import com.naturadventure.dao.SupervisarDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UsuarioDAO;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller
@RequestMapping("/admin1234")
public class MonitorController {
	
	private MonitorDAO monitorDao;
	private TipoActividadDAO tipoActividadDao;
	private SupervisarDAO supervisarDao;
	private UsuarioDAO usuarioDao;
	private HttpServletRequest request;

    @Autowired
    public void setMonitorDAO(MonitorDAO monitorDAO) { 
        this.monitorDao = monitorDAO;
    }

    @Autowired
    public void settiposActividadesDAO(TipoActividadDAO tipoActividadesDAO) { 
        this.tipoActividadDao = tipoActividadesDAO;
    }
	
	@Autowired
    public void setSupervisarDAO(SupervisarDAO supervisarDAO) { 
        this.supervisarDao = supervisarDAO;
    }
	
	@Autowired
    public void setUsuarioDAO(UsuarioDAO usuarioDAO) { 
        this.usuarioDao = usuarioDAO;
    }
	
	// Creacion
		@RequestMapping("/nuevoMonitor.html") 
		   public String addMonitor(HttpSession session, Model model){
			if (session.getAttribute("user") == null) 
		       { 
				   model.addAttribute("user", new UserDetails()); 
		           return "admin1234/login";
		       }
			   Monitor monitor = new Monitor();
			   List<TipoActividad> actividades = tipoActividadDao.getTiposActividad();
			   model.addAttribute("listaActividades", actividades);
			   model.addAttribute("Monitor", monitor);
			return "admin1234/monitores/nuevoMonitor";
		}
		
		@RequestMapping(value = "/nuevoMonitor.html", method=RequestMethod.POST) 
		public String processAddSubmit(Model model, @ModelAttribute("Monitor") Monitor monitor, HttpSession session, HttpServletRequest request){
			System.out.println("ent5ro");
			if (session.getAttribute("user") == null) 
		       { 
				   model.addAttribute("user", new UserDetails()); 
		           return "admin1234/login";
		       }
			System.out.println("ent5ro22222   "+ monitor.getEmail()+ "  "+ monitor.getNombre()+ "  "+ monitor.getUsuario()+ "  ");
			
			monitorDao.addMonitor(monitor);
			List<TipoActividad> actividades = tipoActividadDao.getTiposActividad();
		
			Iterator<TipoActividad> iter = actividades.iterator();
			TipoActividad actividad;
			while (iter.hasNext()){
				actividad = iter.next();
				if (request.getParameter(actividad.getTipo()) != null){
					supervisarDao.addSupervision(actividad.getTipo(), monitor.getUsuario());
				}
			}
			
			//crea un usuario para el nuevo monitor
			BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 
			UserDetails usuario= new UserDetails();
			usuario.setUsuario(monitor.getUsuario());
			usuario.setContrasenya(monitor.getUsuario());
			//usuario.setContrasenya(passwordEncryptor.encryptPassword(monitor.getUsuario()));
			usuario.setRol("MONITOR");
			usuarioDao.addUsuario(usuario);
			
			return "redirect:monitores.html";
		}
	
	 
	
	//LLama a la pantalla de edicion
	@RequestMapping(value="/editaMonitor/{usuario}.html", method=RequestMethod.GET)
	public String editMonitor(HttpSession session, Model model, @PathVariable String usuario) {
		if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
			
		if(usuario == null){
			return "redirect:/admin1234/monitores.html";
		}
			//System.out.println("en edita"+usuario);
		   Monitor monitor = monitorDao.getMonitor(usuario);
		   
		   //System.out.println(monitor.toString());
		   model.addAttribute("monitor", monitor);
		   return "admin1234/monitores/editaMonitor";
	   }	
	
	//Procesa el guardar de editar monitor
	@RequestMapping(value="/editaMonitorSubmit.html", method=RequestMethod.POST)
	public String processUpdateSubmit(@ModelAttribute("monitor") Monitor monitor, HttpSession session, Model model) {
		if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
		
			//System.out.println(monitor.toString());
			monitorDao.updateMonitor(monitor);
		
		
			return "redirect:/admin1234/monitores.html"; 
	}
	
	//Eliminacion
	@RequestMapping(value="/borrarMonitor/{usuario}.html")
	   public String processDelete(HttpSession session, Model model, @PathVariable String usuario) {
		   if (session.getAttribute("user") == null) 
		   { 
		      model.addAttribute("user", new UserDetails()); 
		      return "redirect:admin1234/login.html";
		   }
		    
		    
		    monitorDao.deleteMonitor(usuario);
		    
		    
		    return "redirect:/admin1234/monitores.html";
	   }
}
