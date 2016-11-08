package com.advik.service;

import com.advik.dao.*;


import java.util.*;
import com.advik.model.*;
import com.advik.service.ForumService;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ForumServiceImpl implements ForumService
{


	
	@Autowired
	//ForumDaoImpl forumdao;
	private ForumDaoInterface forumdao;

	public ForumServiceImpl(){}
	
	/*public ForumServiceImpl(SessionFactory sf){
		this.sessionFactory=sf;
	}*/
	
	public void createNewForum(Forum f) {
		forumdao.createNewForum(f);
		
	}

	/*@Override
	public List<Forum> getForumList(String UserName) {
		
		return forumdao.getForumList(UserName);
		
	}*/

	@Override
	public void delete(int fid) {
		forumdao.delete(fid);
		
	}
	
	public List<Forum> getForum()
	{
		System.out.println("I am in forum service");
		return forumdao.getForum();
	}

	@Override
	public void editForum(Forum user) {
		// TODO Auto-generated method stub
		System.out.println("it is in forum service implementation");
		forumdao.editForum(user);
	}

	@Override
	public Forum getForum(int forumUser) {
		// TODO Auto-generated method stub
		//return postDAO.getPost(postUser);
		return forumdao.getForum(forumUser);
		
	}

	@Override
	public Forum getForum(String forumUser) {
		// TODO Auto-generated method stub
	return forumdao.getForum(forumUser);
	}

}
