package com.advik.service;

import java.util.List;

import com.advik.model.Post;
import com.advik.model.User;

public interface PostService {

	public void addPost(Post user);
	public List<Post> getAllPosts();
	public void editPost(Post user);
	public Post getPost(int postUser);
	public void deletePost(int postId);
	public Post getPost(String postUser);
}
