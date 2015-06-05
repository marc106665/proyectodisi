package com.naturadventure.backend.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
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

import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.TipoActividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class TipoActividadController {
   private UserDAO userDao;
   private TipoActividadDAO tipoActividadDao;
	
   @Autowired
   public void setTipoActividadDAO(TipoActividadDAO tipoActividadDAO) { 
       this.tipoActividadDao = tipoActividadDAO;
   }
   
   
   @RequestMapping("/nuevoTipoActividad.html") 
   public String addTipoActividad(HttpSession session, Model model) {
	   if (session.getAttribute("user") == null) 
       { 
		   model.addAttribute("user", new UserDetails()); 
           return "admin1234/login";
       } 

       
	   //List<TipoActividad>listaTipoActividad = tipoActividadDao.getTiposActividad();
	   //System.out.println(listaTipoActividad);
	   //model.addAttribute("listaTipoActividad", listaTipoActividad);
	   
	   TipoActividad tipoActividad = new TipoActividad();
	   	   
	   model.addAttribute("tipoActividad", tipoActividad);
	   
       return "admin1234/nuevoTipoActividad";
       
   }
   
   
   @RequestMapping(value="/addTipoActividad.html", method=RequestMethod.POST) 
   public String processAddSubmit(HttpSession session, Model model, @ModelAttribute("tipo") TipoActividad tipoActividad, @RequestParam("file") MultipartFile file, HttpServletRequest request) 
   {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	   //if (bindingResult.hasErrors()) 
		 //  return "redirect:admin1234/inicio.html";
	   
	   
	   if(!(tipoActividad.getTipo().isEmpty()) || !(tipoActividad == null)){

		   
		   //if(tipoActividadDao.getTipoActividad(tipoActividad.getTipo()) == null){
			   
			   
			   
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
		                        + File.separator + this.MD5(tipoActividad.getTipo()) + "_" + tipoActividad.getTipo() + ".jpg");
		                BufferedOutputStream stream = new BufferedOutputStream(
		                        new FileOutputStream(serverFile));
		                
		                stream.write(bytes);
		                stream.close();
		 
		                tipoActividad.setFoto( File.separator + this.MD5(tipoActividad.getTipo()) + "_" + tipoActividad.getTipo() + ".jpg" );
		                System.out.println("You successfully uploaded file=");
		            } catch (Exception e) {
		            	System.out.println("You failed to upload => " + e.getMessage());
		            }
		        } else {
		            System.out.println("You failed to upload because the file was empty.");
		        }
			   
			   
			   tipoActividadDao.addTipoActividad(tipoActividad);

		   //}
		   //else{
			//   System.out.println("Tipo actividad repetido");

		  // }
	   }
	   
	   return "redirect:../admin1234/tiposActividades.html"; 
   }
 
   @RequestMapping(value="/borrarTipoActividad/{tipo}.html")
   public String processDelete(HttpSession session, Model model, @PathVariable String tipo) {
	   if (session.getAttribute("user") == null) 
	   { 
	      model.addAttribute("user", new UserDetails()); 
	      return "redirect:admin1234/login.html";
	   }
	    TipoActividad tipoActividad = tipoActividadDao.getTipoActividad(tipo);
	 	
	    System.out.println(" OK " + tipoActividad.toString());
	    if(tipoActividad!=null){
	    	tipoActividadDao.deleteTipoActividad(tipo);
	    	return "redirect:/admin1234/tiposActividades.html";
	    }
	    
	    return "redirect:/admin1234/tiposActividades.html";
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