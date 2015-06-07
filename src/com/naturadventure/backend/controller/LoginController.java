package com.naturadventure.backend.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.naturadventure.dao.UserDAO;
import com.naturadventure.domain.UserDetails;


class UserValidator implements Validator { 
	
	@Override
	public boolean supports(Class<?> cls) { 
		return UserDetails.class.isAssignableFrom(cls);
	}
	@Override 
	public void validate(Object obj, Errors errors) {
	
		// Exercici: Afegeix codi per comprovar que 
		// l'usuari i la contrasenya no estiguen buits 
		// ...

		UserDetails login = (UserDetails) obj; 
		if (login.getUsuario() == null || login.getUsuario().length() == 0) { 
			errors.rejectValue("usuario", "error.empty.field", "Please Enter User Name");
		} 
		/*else if (!login.getUsuario().equals("admin")) {
		errors.rejectValue("usuario", "unknown.user", "Unknown User"); 
		} */
		if (login.getContrasenya() == null || login.getContrasenya().length() == 0) { 
			errors.rejectValue("contrasenya", "error.empty.field", "Please Enter Password"); 
		} 
		/*else if (!login.getContrasenya().equals("admin")) { 
		errors.rejectValue("contrasenya", "wrong.password", "Wrong Password"); } }
		 */

	
	}

}


@Controller
@RequestMapping("/admin1234")
public class LoginController {
	
	 	@Autowired
	    private UserDAO userDao;
	 	
	    @RequestMapping("/login")
	    public String login(HttpSession session, Model model) {
	    	if (session.getAttribute("user") != null) 
	        { 
	           return "admin1234/inicio";
	        } 
	    	model.addAttribute("user", new UserDetails());
	        return "admin1234/login";
	    }

	    @RequestMapping(value="/login", method=RequestMethod.POST)
	    public String checkLogin(@ModelAttribute("user") UserDetails user,  BindingResult bindingResult, HttpSession session) {
	        UserValidator userValidator = new UserValidator(); 
	        userValidator.validate(user, bindingResult); 
	        if (bindingResult.hasErrors()) {
	            return "admin1234/login";
	            
	        }
	        // Comprova que el login siga correcte 
	     // intentant carregar les dades de l'usuari
	     String nombreUsuario = (user.getUsuario() == null) ? null : user.getUsuario();
	     String contrasenyaUsuario = (user.getContrasenya() == null) ? null : user.getContrasenya();

	     user = userDao.loadByUsername(nombreUsuario, contrasenyaUsuario); 
	     if (user == null) {
	         bindingResult.rejectValue("contrasenya", "badpw", "Contrasenya o usuario incorrecto"); 
	         return "admin1234/login";
	     }
	     // Autenticats correctament. 
	     //Guardem les dades de l'usuari autenticat a la sessioÌ�
	     session.setAttribute("user", user); 
	         
	  // Torna a la pagina principal
	     if(user.getRol().equalsIgnoreCase("MONITOR")){
	    	 session.setAttribute("usuario", user.getUsuario());
	    	 return "redirect:"+user.getUsuario()+".html";
	     }
	     
	     return "redirect:inicio.html";
	 }

	 @RequestMapping("/logout") 
	 public String logout(HttpSession session) {
	     session.invalidate(); 
	     return "redirect:login.html";
	 }

	
}
