package com.naturadventure.backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.UserDetails;


@Controller 
@RequestMapping("/admin1234") 
public class UserController {
   private UserDAO userDao;

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
       model.addAttribute("users", userDao.listAllUsers());
       return "admin1234/inicio";
   }
}