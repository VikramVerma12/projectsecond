package com.advik.dao;

import com.advik.model.Contact;
import com.advik.model.Post;

import java.util.List;
public interface ContactDAO {
	
	public void addContact(Contact user);
	public List<Contact> getContact();
	public void editContact(Contact user);
	public Contact get(int contactId);
	public void delete(int fid);
	public Contact getContact(String contactUser);

    
}
