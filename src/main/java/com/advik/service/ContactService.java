package com.advik.service;

import java.util.List;

import com.advik.model.Contact;
import com.advik.model.Post;


public interface ContactService {

	public void addContact(Contact user);
	public List<Contact> getContact();
	public void editContact(Contact user);
	public Contact get(int contactId);
	public void delete(int fid);
	public Contact getContact(String postUser);

	
	
	
}
