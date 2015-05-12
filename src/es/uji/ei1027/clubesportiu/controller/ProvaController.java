package es.uji.ei1027.clubesportiu.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import es.uji.ei1027.clubesportiu.atleta.Atleta;
import es.uji.ei1027.clubesportiu.pais.CapitalService;

@Controller
public class ProvaController{
	
	private Atleta atleta;
	
	@Autowired
	CapitalService capitalService;
	
	@Autowired
	public void setAtleta(Atleta atleta){
               this.atleta = atleta;
    }

	@RequestMapping("/prova_id")
	public String provaID(Model model){
             model.addAttribute("message", 
                                "L'atleta necessita " + atleta.getFacility());
  		return "prova";
	}

	
	@RequestMapping("/prova")
	public String provaWeb(Model model){
		String message = "provant la Web del Club Esportiu";
		model.addAttribute("message", message);
		return "prova";
	}


    @RequestMapping("/prova2_id")
	public String prova2ID(Model model) {
    	   
		String pais="Alemania";
  		model.addAttribute("message", "La capital del pais de l'atleta es "
  				+ capitalService.getNomCapital(pais));
        return "prova";
	}
    
    @RequestMapping("/prova3_id")
   	public String prova3ID(Model model) {
       	
 		model.addAttribute("listaPaises", capitalService.getAllPaises());
 		model.addAttribute("message", "La lista de paises es:");
       return "prova";
   	}
    
    @RequestMapping("/prova4_id")
   	public String prova4ID(Model model) {
       	
 		model.addAttribute("listaActividades", capitalService.getAllActividades());
 		model.addAttribute("message", "La lista de actividades es:");
       return "prova";
   	}

}