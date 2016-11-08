package com.advik.service;

import java.util.List;

import com.advik.model.User;

public interface UserService {

	public void addUser(User user);
	public void editUser(User user);
	public void deleteUser(int userId);
	public User getUser(int userId);
	public List<User> getAllUsers();
	public User getUser(String username);
	
}
