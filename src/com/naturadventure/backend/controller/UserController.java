package com.naturadventure.backend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naturadventure.dao.ActividadDAO;
import com.naturadventure.dao.TipoActividadDAO;
import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.Actividad;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class UserController {
   private UserDAO userDao;
   private ActividadDAO actividadDao;
	
   @Autowired
   public void setActividadDAO(ActividadDAO actividadDAO) { 
       this.actividadDao = actividadDAO;
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
   public String actividades(HttpSession session, Model model) {
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
   
   @RequestMapping("/nuevaActividad.html") 
   public String addActividad(HttpSession session, Model model) {
       if (session.getAttribute("user") == null) 
       { 
          model.addAttribute("user", new UserDetails()); 
          return "admin1234/login";
       } 
       
       //model.addAttribute("", );
       
       return "admin1234/nuevaActividad";
       
   }
   
   
}