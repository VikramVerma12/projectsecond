package com.advik.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.advik.dao.ContactDAO;

import com.advik.model.Contact;
import com.advik.model.Post;
import com.advik.service.ContactService;


@Service("contactService")
@Transactional
public class ContactServiceImpl implements ContactService {
	
	@Autowired
	private ContactDAO conDAO;
	@Override
	public void addContact(Contact user) {
		// TODO Auto-generated method stub
		
		conDAO.addContact(user);
		
	}
	
	@Override
	public List<Contact> getContact() {
		// TODO Auto-generated method stub
		return conDAO.getContact();
	}

	@Override
	public void editContact(Contact user) {
		// TODO Auto-generated method stub
		conDAO.editContact(user);
		
	}
	
	@Override
	public void delete(int fid) {
		// TODO Auto-generated method stub
		System.out.println("deleting a contact from contact service impl");
		conDAO.delete(fid);
		
	}

	


	



	
	@Override
	public Contact get(int contactId) {
		// TODO Auto-generated method stub
		return conDAO.get(contactId);
	}


	@Override
	public Contact getContact(String postUser) {
		// TODO Auto-generated method stub
		return conDAO.getContact(postUser);
	}
	
	
}
