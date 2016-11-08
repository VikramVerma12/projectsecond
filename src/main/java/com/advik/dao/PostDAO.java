package com.advik.dao;

import java.util.List;

import com.advik.model.Post;
import com.advik.model.User;

public interface PostDAO {
	public void addPost(Post user);
	public List<Post> getAllPosts();
	public void editPost(Post user);
	public void deletePost(int postId);
	public Post getPost(int postUser);
	public Post getPost(String postUser);
}
