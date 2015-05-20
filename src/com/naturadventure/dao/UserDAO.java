package com.naturadventure.dao;

import java.util.Collection;

import com.naturadventure.domain.UserDetails;

public interface UserDAO {

	UserDetails loadByUsername(String username, String password);
	Collection<UserDetails> listAllUsers();
}
