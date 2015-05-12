package es.uji.ei1027.clubesportiu.dao;

public class Pais {

	private String nom;
	private String capital;
		
	public Pais(){
		nom = "default";
		capital = "default";
	}

	public Pais(String nom, String capital) {
		this.nom = nom;
		this.capital = capital;
	}
	public String getNom() { return nom; }
	public void setNom(String nom) { this.nom = nom; } 
	public String getCapital() { return capital; }
	public void setCapital(String capital) { this.capital = capital; } 
	
	@Override
	public String toString() {
		return "Pais [nom=" + nom + ", capital=" + capital + "]";
	} 
}
