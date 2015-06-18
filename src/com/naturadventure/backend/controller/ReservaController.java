package com.naturadventure.backend.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.mail.internet.AddressException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import mail.Mail;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.MonitorDAO;
import com.naturadventure.dao.ReservaDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.HorasInicio;
import com.naturadventure.domain.Monitor;
import com.naturadventure.domain.NivelActividad;
import com.naturadventure.domain.Reserva;
import com.naturadventure.domain.UserDetails;


@Controller
@RequestMapping("/admin1234/reservas")
public class ReservaController {

	private ReservaDAO reservaDao; 
	private ActividadDAO actividadDao;
	private UserDAO userDao;
	private MonitorDAO monitorDao;
	
	@Autowired
    public void setReservaDao(ReservaDAO reservaDao) { 
        this.reservaDao=reservaDao;
    }

	@Autowired
    public void setActividadDao(ActividadDAO actividadDao) { 
        this.actividadDao=actividadDao;
    }
	
	@Autowired
    public void setMonitorDao(MonitorDAO monitorDao) { 
        this.monitorDao=monitorDao;
    }
	
	@RequestMapping("/listadoReservas") 
    public String listadoReservas(HttpSession session, Model model) {
		if (session.getAttribute("user") == null) 
		{ 
		   model.addAttribute("user", new UserDetails()); 
		   return "redirect:/admin1234/login.html";
		}
		HashMap<Integer, String> auxmapActividades = new HashMap<Integer, String>();
		List<Actividad> listaActividades = actividadDao.getActividades();
		if (listaActividades != null){
			for(Actividad actividad : listaActividades) {
			
				auxmapActividades.put(actividad.getIdActividad(),actividad.getNombre());
			}
		}
		model.addAttribute("fechaactual", new Date());
		model.addAttribute("listadoDeReservas", reservaDao.getReservas());
		model.addAttribute("mapActividades", auxmapActividades);
        return "admin1234/reservas/listadoReservas";
    }
	
	@RequestMapping(value="/rechazar/{idreserva}")
    public String processDelete(HttpSession session, Model model,@PathVariable int  idreserva) {
		if (session.getAttribute("user") == null) 
		{ 
		   model.addAttribute("user", new UserDetails()); 
		   return "redirect:/admin1234/login.html";
		}
		reservaDao.updateEstadoReserva(idreserva, "RECHAZADA");
		Mail mail = new Mail();
		Reserva  reserva = reservaDao.getReserva(idreserva);
		Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
        mail.setRecipient(reserva.getEmailCliente());
        mail.setSubject("Ha sido rechazada su resverva en Naturaventure para el día "+dateFormat.format(reserva.getFechaActividad()));
        String body ="Estimado cliente "+ reserva.getNombreCliente() +"<br/> Lamentamos rechazar su reserva para el dia "+dateFormat.format(reserva.getFechaActividad())+ " de la actividad "+actividad.getNombre()+ " por falta de personal "; 
        mail.setBodyText(body);
        boolean verificacion= true; 
        verificacion = mail.sendEmail();
        if (!verificacion)  
        	System.out.println(" error send mail  ");
    	return "redirect:../listadoReservas.html"; 
    }
	
	@RequestMapping(value="/actualizaReserva/{accion}/{idreserva}", method = RequestMethod.GET) 
    public String actualizaReserva(HttpSession session, Model model, @PathVariable String accion, @PathVariable int idreserva,HttpServletRequest req) {
		if (session.getAttribute("user") == null) 
		{ 
		   model.addAttribute("user", new UserDetails()); 
		   return "redirect:/admin1234/login.html";
		}
		Reserva reserva = reservaDao.getReserva(idreserva);
		
		List<HorasInicio> listaHoras = actividadDao.getHorasActividad(reserva.getIdActividad());
		Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
		List<Integer> listaparticipantes = new ArrayList<Integer>();
		for (int i = actividad.getMinParticipantes(); i<actividad.getMaxParticipantes(); i++ ){
			listaparticipantes.add(i);
		}
		
		NivelActividad objNivel =  actividadDao.getPrecioNivel(reserva.getIdActividad(),reserva.getNivel());
		List<NivelActividad> LitasNiveles= actividadDao.getNivelActividad(reserva.getIdActividad());
		double precioSinIva = objNivel.getPrecioPorPersona() * reserva.getNumParticipantes();
		double varPrecioIva = precioSinIva + (precioSinIva * 0.21) ;
		
		String userAgent = req.getHeader("user-agent");
		String browser = "other";
		if(userAgent.contains("Chrome")) { browser = "Chrome"; }
		model.addAttribute("browser", browser);
		
		
		
		if (reserva.getMonitor() != null){
			Monitor monitor = monitorDao.getMonitor(reserva.getMonitor());
			String monitorNombre = monitor.getNombre();
			model.addAttribute("nombreMonitorAsignado", monitorNombre);
		}
	 	model.addAttribute("precioPersona", objNivel.getPrecioPorPersona());
        model.addAttribute("precioSinIva", precioSinIva);
        model.addAttribute("precioIva", varPrecioIva);
        model.addAttribute("Iva", 0.21);
        model.addAttribute("listaNiveles", LitasNiveles);
        model.addAttribute("reserva", reserva);
        model.addAttribute("accion", accion);
        model.addAttribute("listadoDeHoras", listaHoras);
        model.addAttribute("listadoDeParticipantes", listaparticipantes); 
        model.addAttribute("nombreActividad", actividad.getNombre());
        model.addAttribute("tipoActividad", actividad.getTipo());
        List<Monitor> listaMonitoresAutorizados = monitorDao.getMonitorDeTipo(actividad.getTipo(), reserva.getFechaActividad(), reserva.getHoraInicio());
        model.addAttribute("listaMonitores", listaMonitoresAutorizados);
        
        
        return "/admin1234/reservas/actualizaReserva"; 
    } 

    @RequestMapping(value="/actualizaReserva/{accion}/{idreserva}", method = RequestMethod.POST) 
    public String actualizaReservaSubmit(@PathVariable int idreserva, @PathVariable String accion,@ModelAttribute("reserva") Reserva reserva, BindingResult bindingResult) {
    	
    	if ( accion!=null && !accion.equals("ver")){
    	
    		if (reserva.getMonitor().equals("null") ){ reserva.setMonitor(null); }
    		// System.out.println(" monitor --"+reserva.getMonitor()+" estado --"+reserva.getEstado()+" fecha --"+reserva.getFechaActividad());
    		if (reserva.getMonitor()!=null && (reserva.getEstado().equals("RECHAZADA") ||reserva.getEstado().equals("PENDIENTE")) && reserva.getFechaActividad().after(new Date())){
    			reserva.setEstado("ACEPTADA"); 
    			Mail mail = new Mail();
    			Actividad actividad = actividadDao.getActividad(reserva.getIdActividad());
    			SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy");
    	        mail.setRecipient(reserva.getEmailCliente());
    	        mail.setSubject("Ha sido aceptada su resverva en Naturaventure para el día "+dateFormat.format(reserva.getFechaActividad()));
    	        String body ="Estimado cliente "+ reserva.getNombreCliente() +"<br/> Le comunicamos que su reserva para el dia "+dateFormat.format(reserva.getFechaActividad())+ " de la actividad "+actividad.getNombre()+ " ha sido aceptada."; 
    	        mail.setBodyText(body);
    	        boolean verificacion= true; 
    	        verificacion = mail.sendEmail();
    	        if (!verificacion)  
    	        	System.out.println(" error send mail  ");
    			
    		}
    		else if(reserva.getMonitor()==null && reserva.getFechaActividad().after(new Date())){ reserva.setEstado("PENDIENTE"); reserva.setMonitor(null);} 

    	
    		reservaDao.updateReserva(reserva);
    	}
    	//if (bindingResult.hasErrors()) 
          //   return "monitor/update";
    	 
    	
         //
         return "redirect:../../listadoReservas.html"; 
   }
    
    @RequestMapping(value = "/ajaxMonitor", method = RequestMethod.POST)
     public @ResponseBody String sendmail( HttpServletRequest request, Model model) throws AddressException {
    	
        String tipo =request.getParameter("tipo");
        
        Date fechaActividad = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");
        String horaInicio =request.getParameter("horainicio");
        
        String fecha = request.getParameter("fechaactividad");
        
        
        try {
        	
        	fechaActividad = formatter.parse(fecha);
		
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        System.out.println(" fecha "+fechaActividad.toString() +" hora "+ horaInicio +" tipo " + tipo);
        List<Monitor> listaMonitoresAutorizados = monitorDao.getMonitorDeTipo(tipo, fechaActividad, horaInicio);
        String salida = "";
        if ( listaMonitoresAutorizados != null ){
        	salida = "{\"monitores\":[";
        	int i = 0;
        	for(Monitor monitor : listaMonitoresAutorizados) {
        		if (i != 0 ){ salida+= ","; }
        		salida += "{\"nombre\":\""+monitor.getNombre()+"\", \"usuario\":\""+monitor.getUsuario()+"\"}";
        		i++;
        	}
        	salida+= "]}";
        
        }else { salida = "{\"monitores\":[]}"; }
      System.out.println(" salida --"+salida);
        return salida;
     } 
    
    @InitBinder
	protected void initBinder(WebDataBinder binder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd/MM/yyyy"); 
		dateFormat.setLenient(false);
		binder.registerCustomEditor(Date.class, "fechaActividad",new CustomDateEditor(dateFormat, false));
	}
    
	
	
}
