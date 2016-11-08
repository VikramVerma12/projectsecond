package com.advik.dao.impl;

import java.util.List;

import javax.persistence.PersistenceContext;

import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.advik.dao.ContactDAO;
import com.advik.model.Contact;
import com.advik.model.Forum;
import com.advik.model.Post;
import com.advik.model.User;

@Repository

public class ContactDAOImpl implements ContactDAO {
	 


	@Autowired
	private SessionFactory factory;
 
	@Override
	public void addContact(Contact user) {
		// TODO Auto-generated method stub
		factory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Contact> getContact() {
		// TODO Auto-generated method stub
		return factory.getCurrentSession().createQuery("from Contact").list();
	}
	
	@Override
	public void editContact(Contact user) {
		// TODO Auto-generated method stub
		Session session = factory.openSession();
		Transaction t = session.beginTransaction();
		//Post u =(Post)session.get
		factory.getCurrentSession().saveOrUpdate(user);
		t.commit();
		session.flush();
		session.close();		
		
		
	}

	@Override
    public void delete(int contactId) {
        // implementation details goes here...
    	Session session=factory.openSession();
		Transaction t=session.beginTransaction();
		Contact u=(Contact)session.get(Contact.class,new Integer(contactId));
		session.delete(u);
		t.commit();
		session.flush();
		session.close();
    }
 
   
    @Override
    public Contact get(int contactId) {
        // implementation details goes here...
   
    	return (Contact)factory.getCurrentSession().get(Contact.class,contactId);
    }

	
	
	

	@Override
	public Contact getContact(String contactUser) {
		// TODO Auto-generated method stub
	     Criteria criteria =factory.getCurrentSession().createCriteria(Contact.class);
	        criteria.add(Restrictions.like("contactname", contactUser));
	        return (Contact) criteria.uniqueResult();
	}
 
}
