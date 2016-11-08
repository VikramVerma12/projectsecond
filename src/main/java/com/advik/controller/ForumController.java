package com.advik.controller;
import java.io.*;

import java.security.Principal;
import java.util.Date;
import java.util.List;

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
import org.springframework.web.bind.annotation.RestController;

import com.advik.dao.ForumDaoInterface;
import com.advik.model.*;







import com.advik.service.ForumService;
import com.google.gson.Gson;


@Controller

public class ForumController 
{
	@Autowired
	private ForumService fservice;

	@Autowired
	ForumDaoInterface dao;
	
	//for showing Forum page
	@RequestMapping("/newforum")
	public String createBlog(HttpServletRequest request,Model model)
	{
		String name=request.getParameter("forum");
		model.addAttribute("name",name);
		System.out.println("In Forum Controller");
		return "Forum";
	}
 String currentUser="";
	/* @RequestMapping(method = RequestMethod.GET)   
	 public void showResults( HttpServletRequest request, Principal principal) {
	  currentUser = principal.getName();
	 }*/
	 
	 
	 
	@ModelAttribute("forum")
	public Forum returnObject()
	{
		return new Forum();
	}
	
	
	/*@RequestMapping("/GsonCon1")
	public @ResponseBody String getValues() throws Exception
	{
		List<Forum> flist;
		String result="";
		flist = fservice.getForum();
		Gson gson = new Gson();
		result = gson.toJson(flist);
		System.out.println("before flist");
		//System.out.println(forum list);
		return result;
	}*/
	
	//for adding Forum 
	@RequestMapping("/postF")
	public String postblog(@ModelAttribute("forum") Forum forum , Model model, HttpServletRequest request, Principal principal) throws IOException
	{
		System.out.println("I am in Forum");	
		currentUser = principal.getName();
		forum.setForumUserName(currentUser);		
		forum.setCreationdatetime(new java.util.Date());		
		fservice.createNewForum(forum);
		return "redirect:angularform";
	}

	@RequestMapping(value="/angularform")
	public String allforums(ModelMap map)
	{
		//List<Post> post=postService.getAllPosts();
	//	map.addAttribute("posts", post);
		List<Forum> forum=fservice.getForum();
		map.addAttribute("forums",forum );
		return "angularform";
	}

	@RequestMapping(value="/angularsearch")
	public String allforums1(ModelMap map)
	{
		//List<Post> post=postService.getAllPosts();
	//	map.addAttribute("posts", post);
		List<Forum> forum=fservice.getForum();
		map.addAttribute("forums",forum );
		return "angularsearch";
	}
	
	@RequestMapping("/deleteforum")
	 public String deleteForum(@RequestParam int forumId) {
		System.out.println(forumId);
		fservice.delete(forumId);
	  return "redirect:angularform";
	 }
	
	
	@RequestMapping("/editforum{forumId}")
	 public String editFORUM(@RequestParam int forumId,Model model) {
		Forum forum;
		System.out.println("is in editFORUM");
		//postService.deletePost(postId);
	    //Post post=	postService.getPost(postId);
		try
		{
		forum=fservice.getForum(forumId);
		System.out.println("forum id is ->"+forumId);
		 model.addAttribute("forum",forum);
		}
		catch(Exception e)
		{
			System.out.println("it is in editforum catch "+e);
		}
	  return "editForum";
	 }
		
	@RequestMapping(value = { "/editforum{forumId}" }, method = RequestMethod.POST)
	    public String updateFORUM(@Valid Forum forum, BindingResult result,
	    ModelMap model, @PathVariable String forumId,@RequestParam String action) {
		if(action.equals("Edit"))
		{
		System.out.println("for updating forum");
		Date date = new Date();
		try
		{
			System.out.println("it is in try forumId is ->"+forumId);
	       // if (result.hasErrors()) {
	        //	System.out.println("is in if cause it has errors");   
	        //}
		}
		catch(Exception e)
		{
			System.out.println("it is in catch");
	        System.out.println("errors are ->"+e.getMessage());
	        return "editForum";
		}
		//post.setTitle(post.getTitle());
		//post.setContent(post.getContent());
		//post.setDate(date);
		//postService.editPost(post);
	     //   model.addAttribute("success", "post" + post.getTitle() + " "+ post.getContent() + " updated successfully");
	     //   return "redirect:/post";
		
		//forum.setCategory(forum.getCategory());
		forum.setForumtitle(forum.getForumtitle());
		forum.setForumcontent(forum.getForumcontent());
		forum.setCreationdatetime(new java.util.Date());
		fservice.editForum(forum);
		model.addAttribute("Success","roll"+forum.getCategory()+" "+forum.getForumtitle()+" "+forum.getForumcontent()+ "updated successfully");
		return "redirect:/angularform";
		}
		else if(action.equals("Cancel"))
		{
			return "redirect:/angularform";
		}
		return "";
	    }	
	

}
