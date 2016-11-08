package com.advik.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.advik.dao.UserDAO;
import com.advik.model.User;
import com.advik.service.UserService;
@Service
@Transactional
public class UserServiceImpl implements UserService{

	@Autowired
	private UserDAO userDAO;

	public void addUser(User user) {
		userDAO.addUser(user);
		
	}

	
	public void editUser(User user) {
		userDAO.editUser(user);
	}


	public void deleteUser(int userId) {
		userDAO.deleteUser(userId);
	}


	public User getUser(int userId) {
		return userDAO.getUser(userId);
      
	}


	public List<User> getAllUsers() {
		
		return userDAO.getAllUsers();
	}


	public User getUser(String username) {
		
		return userDAO.getUser(username);
	}

}
