package es.uji.ei1027.clubesportiu.atleta;
import org.springframework.stereotype.Component;

@Component
public class AtletaTenista implements Atleta {

	@Override
	public String getFacility() {
		return "pista de tenis";
	}

}
