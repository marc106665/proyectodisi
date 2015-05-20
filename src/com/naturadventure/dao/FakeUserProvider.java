package com.naturadventure.dao;


import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.jasypt.util.password.BasicPasswordEncryptor;
import org.springframework.stereotype.Repository;

import com.naturadventure.domain.UserDetails;


@Repository
public class FakeUserProvider implements UserDAO {
  final Map<String, UserDetails> knownUsers = new HashMap<String, UserDetails>();

  public FakeUserProvider() {
	BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 
	UserDetails userAlice = new UserDetails(); 
	userAlice.setUsuario("alice"); 
	userAlice.setContrasenya(passwordEncryptor.encryptPassword("alice")); 
	knownUsers.put("alice", userAlice);
	  
       UserDetails userBob = new UserDetails(); 
       userBob.setUsuario("bob"); 
       userBob.setContrasenya(passwordEncryptor.encryptPassword("bob")); 
       knownUsers.put("bob", userBob);
  }

@Override
public UserDetails loadByUsername(String username, String password) { 
	  UserDetails user = knownUsers.get(username.trim());
	  if (user == null)
		  return null; // Usuari no trobat
	  // Contrasenya
	 BasicPasswordEncryptor passwordEncryptor = new BasicPasswordEncryptor(); 
	 if (passwordEncryptor.checkPassword(password, user.getContrasenya())) {
	 // Es deuria esborrar de manera segura el camp password abans de tornar-lo
		 return user; 
        } 
	 else {
		 return null; // bad login!
	 }
  }

 @Override 
 public Collection<UserDetails> listAllUsers() {
	 return knownUsers.values();
}


}