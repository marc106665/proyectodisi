package mail;

import java.util.Collection;
import java.util.LinkedList;
import java.util.List;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Mail {
	//Gmail data nacimiento 16 marzo 2000 mujer
	private final String USER_NAME = "agg.naturaventure.info";  // GMail user name (just the part before "@gmail.com")
    private final String PASSWORD = "aggteamei1027"; // GMail password
    private final String SUBJECT_ACCEPTED = "Confirmaci�n";
    private final String SUBJECT_REJECTED = "Reserva rechazada";
    
    private String from;
    private String pwd;
    private List<String> recipient = null;
    private String subject="";
    private String body = null;
    
    
	public Mail(){
		this.recipient = new LinkedList<String>();
	};
	
	public Mail(String username, String password){
		this.recipient = new LinkedList<String>();
		this.from = username;
		this.pwd = password;
	}
    public String getUsername(){
    	return this.from;
    }
	
    public String getPassword(){
    	return this.pwd;
    }
    
    public List<String> getRecipientList(){
    	return this.recipient;
    }
    
    public String getSubject(){
    	return this.subject;
    }
    
    public String getBody(){
    	return this.body;
    }
    
    
    
    public void setRecipient(String recipient){
    	
    	this.recipient.add(recipient);
    }
    
    public void setRecipient(Collection<String> recipient){
    	this.recipient.addAll(recipient);
    }
    
    public void setUsername(String username){
    	this.from = username;
    }
    
    public void setPassword(String password){
    	this.pwd = password;
    }
    
    public void setUsernameAndPassword(String username, String password){
    	this.from = username;
    	this.pwd = password;
    }
    
    public void setSubject(String subject){
    	this.subject = subject;
    }
    
    public void setDefaultAcceptSubject(){
    	this.subject = SUBJECT_ACCEPTED;
    }
    
    public void setDefaultRejectSubject(){
    	this.subject = SUBJECT_REJECTED;
    }
    
    public void setDefaultAcceptedBodyText(){
    	String s = "";
    	s=s+"Este es un mensaje auto-generado";
    	s=s+"\n Su reserva ha sido aceptada";
    	this.body = s;
    }
    
    public void setDefaultRejectedBodyText(){
    	String s = "";
    	s=s+"Este es un mensaje auto-generado";
    	s=s+"\n Su reserva ha sido rechaza por.....X motivos";
    	this.body = s;
    }
    
    public void setBodyText(String body){
    	this.body = body;
    }
    	
    
    public boolean sendEmail(){
    	
    	return sendFromGMail(this.USER_NAME, this.PASSWORD, recipient, subject, body );
    }
    
    
    
    private  boolean  sendFromGMail(String from, String pass, List<String> to, String subject, String body) {
        Properties props = System.getProperties();       
        String host = "smtp.gmail.com";
        props.put("mail.smtp.ssl.trust", "smtp.gmail.com");
        props.put("mail.smtp.starttls.enable", "true");
         props.put("mail.smtp.host", host);
         props.put("mail.smtp.user", from);
         props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
         props.put("mail.smtp.auth", "true");
        
        Boolean resultado=false;
        
        
        
        Session session = Session.getDefaultInstance(props);
        MimeMessage message = new MimeMessage(session);
        
        try {
            message.setFrom(new InternetAddress(from));
            
            InternetAddress[] toAddress = new InternetAddress[to.size()];
            
            // To get the array of addresses
            for( int i = 0; i < to.size(); i++ ) {
                toAddress[i] = new InternetAddress(to.get(i));
            }   

            for( int i = 0; i < toAddress.length; i++) {
                message.addRecipient(Message.RecipientType.TO, toAddress[i]);
            }
            message.setSubject(subject);
            message.setText(body,"ISO-8859-1","html");
            Transport transport = session.getTransport("smtp");
            transport.connect(host, from, pass);
            transport.sendMessage(message, message.getAllRecipients());
            transport.close();
            resultado = true;
        }
        catch (NullPointerException pex) {
        	pex.printStackTrace();
        	
        }
        catch (AddressException ae) {
        	ae.printStackTrace();
        	
        }
        catch (MessagingException me) {
            me.printStackTrace();
            
        } 
        return resultado;
    }
	
}
