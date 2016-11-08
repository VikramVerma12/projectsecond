package com.advik.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.advik.dao.PostDAO;
import com.advik.model.Post;
import com.advik.model.User;

@Repository
public class PostDAOImpl implements PostDAO {

	@Autowired
	private SessionFactory factory;
	
	public void addPost(Post user) {	
		factory.getCurrentSession().save(user);
	}

	@SuppressWarnings("unchecked")
	public List<Post> getAllPosts() {
		return factory.getCurrentSession().createQuery("from Post").list();
	}

	@Override
	public void editPost(Post user) {
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
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		Session session=factory.openSession();
		Transaction t=session.beginTransaction();
		Post u=(Post)session.get(Post.class,new Integer(postId));
		session.delete(u);
		t.commit();
		session.flush();
		session.close();
	}

	@Override
	public Post getPost(String postUser) {
		// TODO Auto-generated method stub
		//Integer i = Integer.parseInt(postUser);
	//return (Post)factory.getCurrentSession().get(Post.class,i);	
		Criteria criteria = factory.getCurrentSession().createCriteria(Post.class);
	        criteria.add(Restrictions.like("postUser",postUser));
	      return (Post)criteria.uniqueResult();
	        //return Post;
	}
	@Override
	public Post getPost(int postUser) {
		// TODO Auto-generated method stub
		return (Post)factory.getCurrentSession().get(Post.class,postUser);
	}
}
