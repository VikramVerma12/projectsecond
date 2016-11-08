package com.advik.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.advik.dao.RolesDAO;
import com.advik.model.Roles;
import com.advik.service.RolesService;

@Service
@Transactional
public class RolesServiceImpl implements RolesService{

	@Autowired
	private RolesDAO rolesDAO;
	
	public void addRole(Roles role) {
		rolesDAO.addRole(role);
		
	}



}
