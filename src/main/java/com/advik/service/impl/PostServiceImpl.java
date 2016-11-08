package com.advik.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.advik.dao.PostDAO;
import com.advik.model.Post;
import com.advik.service.PostService;
@Service
@Transactional
public class PostServiceImpl implements PostService {

	@Autowired
	private PostDAO postDAO;
	
	public void addPost(Post user) {
	
		postDAO.addPost(user);
	}

	public List<Post> getAllPosts() {
		return postDAO.getAllPosts();
	}

	@Override
	public void editPost(Post user) {
		// TODO Auto-generated method stub
	postDAO.editPost(user);
	}

	@Override
	public void deletePost(int postId) {
		// TODO Auto-generated method stub
		postDAO.deletePost(postId);
		
	}

	@Override
	public Post getPost(String postUser) {
		// TODO Auto-generated method stub
		return postDAO.getPost(postUser);
		
	}

	@Override
	public Post getPost(int postUser) {
		// TODO Auto-generated method stub
		return postDAO.getPost(postUser);
	}

}
