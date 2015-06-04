package com.naturadventure.backend.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletContext;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import sun.print.resources.serviceui;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.TipoActividadDAO;
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
   private TipoActividadDAO tipoActividadDao;
	
   @Autowired
   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
       this.tipoActividadDao = tipoActividadDAO;
   }
   
   @Autowired
   public void setActividadDAO(ActividadDAO actividadDAO) { 
       this.actividadDao = actividadDAO;
   }
   
   
   @RequestMapping("/nuevaActividad.html") 
   public String addActividad(HttpSession session, Model model) {
	   if (session.getAttribute("user") == null) 
       { 
		   model.addAttribute("user", new UserDetails()); 
           return "admin1234/login";
       } 

       
	   List<TipoActividad>listaTipoActividad = tipoActividadDao.getTiposActividad();
	   //System.out.println(listaTipoActividad);
	   model.addAttribute("listaTipoActividad", listaTipoActividad);
	   
	   Actividad actividad = new Actividad();
	   	   
	   model.addAttribute("actividad", actividad);
	   
       return "admin1234/nuevaActividad";
       
   }
   
   
   @RequestMapping(value="/addActividad.html", method=RequestMethod.POST) 
   public String processAddSubmit(HttpSession session, 
		   Model model, 
		   @ModelAttribute("actividad") Actividad actividad,  
		   @ModelAttribute("listatipoactividad") TipoActividad tipoActividad,  
		   @ModelAttribute("horasinicio") HorasInicio horasInicio, 
		   @ModelAttribute("listaniveles") LinkedList<NivelActividad> listaNiveles, 
		   @RequestParam("file") MultipartFile file,
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
	   	
	   	if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                
                // Creating the directory to store file
                ServletContext sc = session.getServletContext();
                String rootPath = sc.getRealPath( File.separator + "resources" );
                File dir = new File(rootPath + File.separator + "subidas");
                if (!dir.exists())
                    dir.mkdirs();
 
                // Create the file on server
                File serverFile = new File(dir.getAbsolutePath()
                        + File.separator + this.MD5(actividad.getNombre()) + "_" + actividad.getNombre() + ".jpg");
                BufferedOutputStream stream = new BufferedOutputStream(
                        new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
 
                actividad.setFoto( File.separator + this.MD5(actividad.getNombre()) + "_" + actividad.getNombre() + ".jpg" );
                System.out.println("You successfully uploaded file=");
            } catch (Exception e) {
            	System.out.println("You failed to upload => " + e.getMessage());
            }
        } else {
            System.out.println("You failed to upload because the file was empty.");
        }
	   
	   	System.out.println(request.getParameter("manyana")+":"+request.getParameter("tarde"));
	   	System.out.println("tipo de actividad: "+tipoActividad.toString()+"\n"+actividad.toString());
	   
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
   
   @RequestMapping(value="/editaActividad/{id}.html", method=RequestMethod.GET)
   public String processUpdate(HttpSession session, Model model, @PathVariable int id) {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	   
	   Actividad actividad = actividadDao.getActividad(id);
	   actividad.setIdActividad(id); 
	   
	   if (actividad != null) {
		   List<TipoActividad>listaTipoActividad = tipoActividadDao.getTiposActividad();
		   System.out.println(listaTipoActividad);
		   
		   model.addAttribute("listaTipoActividad", listaTipoActividad);
		   
	 	   model.addAttribute("actividad", actividad);
	 	   
	 	   return "admin1234/editaActividad";
	   }
	   
       return "redirect:/admin1234/actividades.html";
   }
    

   @RequestMapping(value="/editaActividad.html", method=RequestMethod.POST) 
   public String processUpdateSubmit(HttpSession session, 
		   Model model, 
		   @ModelAttribute("actividad") Actividad actividad,  
		   @ModelAttribute("listatipoactividad") TipoActividad tipoActividad,   
		   BindingResult bindingResult,
		   HttpServletRequest request)
   {
	   	if (session.getAttribute("user") == null) 
	   	{ 
	   		model.addAttribute("user", new UserDetails()); 
	   		return "redirect:admin1234/login.html";
	   	}
	   	int id = actividad.getIdActividad();
	   	System.out.println(request.getParameter("manyana")+":"+request.getParameter("tarde"));
	   	System.out.println("tipo de actividad: "+tipoActividad.toString()+"\n"+actividad.toString());
	   
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
		
		
		actividadDao.updateActividad(actividad);
       
       	
       	//Franja horaria:
	   	if (request.getParameter("manyana") != null) {
	   		HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("manyana"));
	   		actividadDao.updateHoraInicio(objHora);
	   	}
		if (request.getParameter("tarde") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("tarde"));	
	   		actividadDao.updateHoraInicio(objHora);
		}
		if (request.getParameter("noche") != null) {
			HorasInicio objHora = new HorasInicio();
	   		objHora.setIdActividad(id);
	   		objHora.setHoraInicio(request.getParameter("noche"));
	   		actividadDao.updateHoraInicio(objHora);
		}

		
		//Precio por nivel:
	   	if (request.getParameter("precio1") != null) {//Hay que comprobar el tipo
	   		NivelActividad precio1 = new NivelActividad();
	   		precio1.setIdActividad(id);
	   		precio1.setNivel("PRINCIPIANTE");
	   		precio1.setPrecioPorPersona(Float.valueOf(request.getParameter("precio1")));
	   		actividadDao.updateNivelActividad(precio1);
	   	}
		if (request.getParameter("precio2") != null) {
			NivelActividad precio2 = new NivelActividad();
			precio2.setIdActividad(id);
			precio2.setNivel("INTERMEDIO");
			precio2.setPrecioPorPersona(Float.valueOf(request.getParameter("precio2")));
	   		actividadDao.updateNivelActividad(precio2);
		}
		if (request.getParameter("precio3") != null) {
			NivelActividad precio3 = new NivelActividad();
			precio3.setIdActividad(id);
			precio3.setNivel("AVANZADO");
			precio3.setPrecioPorPersona(Float.valueOf(request.getParameter("precio3")));
	   		actividadDao.updateNivelActividad(precio3);
		}
		
       
		return "redirect:/admin1234/actividades.html"; 
	   	
   }
   
   public String MD5(String md5) {
	   try {
	        java.security.MessageDigest md = java.security.MessageDigest.getInstance("MD5");
	        byte[] array = md.digest(md5.getBytes());
	        StringBuffer sb = new StringBuffer();
	        for (int i = 0; i < array.length; ++i) {
	          sb.append(Integer.toHexString((array[i] & 0xFF) | 0x100).substring(1,3));
	       }
	        return sb.toString();
	    } catch (java.security.NoSuchAlgorithmException e) {
	    	System.out.println("error creando MD5");
	    }
	    return null;
	}
   
   
}