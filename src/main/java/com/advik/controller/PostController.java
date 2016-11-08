package com.advik.controller;

import java.io.File;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.advik.dao.PostDAO;
import com.advik.model.Forum;
import com.advik.model.Post;
import com.advik.model.User;
import com.advik.service.PostService;
import com.google.gson.Gson;



@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	@Autowired
	PostDAO dao;
	
	//for adding a new post by an user
	@RequestMapping(value="/newPost")
	public String newPosts(ModelMap map,Principal principal)
	{
		List<Post> post=postService.getAllPosts();
		map.addAttribute("myPosts", post);
		return "newPost";
	}
	@ModelAttribute("post")
	public Post returnObject()
	{
		return new Post();
	}
 
	@RequestMapping("/GsonCon2")
	public @ResponseBody String getValues() throws Exception
	{
		List<Post> flist;
		String result="";
		flist = postService.getAllPosts();
		Gson gson = new Gson();
		result = gson.toJson(flist);
		System.out.println("before flist");
		//System.out.println(forum list);
		return result;
	}
	
	@RequestMapping(value="/angularpostsearch")
	public String allforums1(ModelMap map)
	{
		//List<Post> post=postService.getAllPosts();
	//	map.addAttribute("posts", post);
		List<Post> post=postService.getAllPosts();
		map.addAttribute("posts",post );
		return "angularpostsearch";
	}
	
	@RequestMapping(value="/addPost")
	public String addPost(@Valid @ModelAttribute("addpost") Post post,BindingResult result,ModelMap model,Principal principal)
	{
		if(result.hasErrors()){
            return "newPost";
        }
		Date date=new Date();
		String user=principal.getName();
		post.setPostUser(user);
		post.setDate(date);
		postService.addPost(post);
		model.addAttribute("posts", post);
		return "redirect:post";
	}

	
	//for getting all the post on page
	@RequestMapping(value="/post")
	public String allPosts(ModelMap map)
	{
		List<Post> post=postService.getAllPosts();
		map.addAttribute("posts", post);
		return "post";
	}

	@RequestMapping("/delete1")
	 public String deletePost(@RequestParam int postId) {
		postService.deletePost(postId);
	  return "redirect:post";
	 }
	@RequestMapping("/editpost1{postId}")
	 public String editPost(@RequestParam int postId,Model model) {
		//postService.deletePost(postId);
	Post post=	postService.getPost(postId);
		 System.out.println("post id is ->"+postId);
		 model.addAttribute("post",post);
	  return "editpost";
	 }
		
	@RequestMapping(value = { "/editpost1{postId}" }, method = RequestMethod.POST)
	    public String updatePost(@Valid Post post, BindingResult result,
	    ModelMap model, @PathVariable String postId) {
		System.out.println("for updating post");
		Date date = new Date();
		try
		{
			System.out.println("it is in try post id is ->"+postId);
	       // if (result.hasErrors()) {
	        //	System.out.println("is in if cause it has errors");   
	        //}
		}
		catch(Exception e)
		{
			System.out.println("it is in catch");
	        System.out.println("errors are ->"+e.getMessage());
	        return "editpost";
		}
		post.setTitle(post.getTitle());
		post.setContent(post.getContent());
		post.setDate(date);
		postService.editPost(post);
	        model.addAttribute("success", "post" + post.getTitle() + " "+ post.getContent() + " updated successfully");
	        return "redirect:/post";
	    }	
}
