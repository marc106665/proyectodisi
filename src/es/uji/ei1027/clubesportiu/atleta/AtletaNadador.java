package es.uji.ei1027.clubesportiu.atleta;
import org.springframework.stereotype.Component;

@Component
public class AtletaNadador implements Atleta {

	@Override
	public String getFacility() {
		return "piscina";
	}

}
