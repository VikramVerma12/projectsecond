package com.advik.dao;
import java.util.*;

import com.advik.dao.ForumDaoInterface;
import com.advik.model.*;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class ForumDaoImpl implements ForumDaoInterface
{
	@Autowired
	private SessionFactory sessionFactory;

	
	
	
	public void createNewForum(Forum f)
	{
		//Session session=sessionFactory.openSession();
		//session.save(f);
		//session.flush();
		//factory.getCurrentSession().save(user);
		sessionFactory.getCurrentSession().save(f);
	}
	
	@SuppressWarnings("unchecked")
	public List<Forum> getForum()
	{
		/*List<Forum> forums;
		System.out.println("DAO Implementation");
		try {
			System.out.println("is in try");
		 Session   session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
		    session = sessionFactory.openSession();
		    System.out.println("is in try");
		}
		//Session ss1 = sessionFactory.getCurrentSession();
		Transaction tx = session.beginTransaction();
		Query qry = session.createQuery("from Forum");
		System.out.println(qry.toString());
		forums = (List<Forum>)qry.list();
		System.out.println("data is fetching");
		tx.commit();
		return forums;*/
		//return factory.getCurrentSession().createQuery("from Post").list();
		return sessionFactory.getCurrentSession().createQuery("from Forum").list();
	}
	
	@Override
	public void editForum(Forum forumId) {
		// TODO Auto-generated method stub
		System.out.println("is in editforum");
	   Session session = sessionFactory.openSession();
		Transaction t = session.beginTransaction();
		//Post u =(Post)session.get
		sessionFactory.getCurrentSession().saveOrUpdate(forumId);
		t.commit();
		session.flush();
		session.close();	
	}
	

	/*@SuppressWarnings("unchecked")
	public List<Forum> getForumList(String username) {

		Session session=sessionFactory.openSession();
		Criteria c=session.createCriteria(Forum.class);
		c.add(Restrictions.eq("user_name", username));
		List <Forum> forum=c.list();
		return forum;
	}*/
	
	
	
	public void delete(int forumId) {
		Session session=sessionFactory.openSession();
		Transaction t=session.beginTransaction();
		Forum u=(Forum)session.get(Forum.class,new Integer(forumId));
		session.delete(u);
		t.commit();
		session.flush();
		//session.close();
		//Forum f = new Forum();
		
		//sessionFactory.getCurrentSession().delete(f);
		System.out.println("Deleting the Forum");
	}
	


	
	
	
	
	
	@Override
	public Forum getForum(int forumUser) {
		// TODO Auto-generated method stub
		return (Forum)sessionFactory.getCurrentSession().get(Forum.class,forumUser);
	}
	
	@Override
	public Forum getForum(String forumUser) {
		// TODO Auto-generated method stub
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Forum.class);
        criteria.add(Restrictions.like("postUser",forumUser));
      return (Forum)criteria.uniqueResult();
	}

}
