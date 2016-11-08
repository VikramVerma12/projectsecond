package com.advik.controller;

import java.io.File;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.advik.model.Post;
import com.advik.model.User;
import com.advik.service.PostService;
import com.advik.service.UserService;
import com.google.gson.Gson;
import com.advik.model.Message;
import com.advik.model.OutputMessage;
import com.advik.model.Forum;
import com.advik.service.ContactService;
import com.advik.service.ForumService;
import com.advik.model.*;



@Controller
public class FrontController {
	
	Path path;
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContactService contactservice;
	
	@Autowired
	private PostService postService;

	@RequestMapping(value={"/","/index"})
	public String getIndex(Locale locale, ModelMap model,Principal principal)
	{
		List<Post> post=postService.getAllPosts();
		model.addAttribute("posts", post);
		return "index";
	}
	
	/*	@RequestMapping(value={"/","/index"})
	public String getAngularIndex1(Locale locale, ModelMap model,Principal principal)
	{
		//List<Post> post=postService.getAllPosts();
		//model.addAttribute("posts", post);
		return "newlogin";
	}*/
	

	
@RequestMapping(value="/AngularLogin")
	public String getAngularIndex(Locale locale, ModelMap model,Principal principal)
	{
		//List<Post> post=postService.getAllPosts();
		//model.addAttribute("posts", post);
		return "AngularLogin";
	}
	
	@RequestMapping(value="/editUser")
	public String edituserByName(Model model,Principal principal,User user)
	{
		String name=principal.getName();
		user=userService.getUser(name);
		model.addAttribute("users", user);
		return "editUser";
	}
	
	
	public User getUser()
	{
		return new User();
	}
	
	
	@RequestMapping(value="/edituser/{userid}", method=RequestMethod.POST)
	public String editUser(@PathVariable("userid") Integer userid,
	        @ModelAttribute("user") User user,HttpServletRequest request,Map map,Principal p){
		
	   user.setUsername(p.getName());
	  MultipartFile image = user.getImage();
	       String rootDirectory = request.getSession().getServletContext().getRealPath("/");
	       path = Paths.get(rootDirectory + "/resources/images/" + user.getUsername() + ".png");
	        System.out.println(path);
	       if(image != null && !image.isEmpty()){
	           try {
	               image.transferTo(new File(path.toString()));
	           } catch (Exception ex){
	               ex.printStackTrace();
	               throw new RuntimeException("Product image saving failed", ex);
	           }
	       }
	       userService.editUser(user);
	    return "redirect:/userProfile";
	}
	
	@RequestMapping(value = "/allUsers")
	public String allUsersPage(ModelMap model) {
     
		List<User> users=userService.getAllUsers();
	
		model.addAttribute("users", users);
		return "allUsers";
	}
	
	@RequestMapping(value = "/allcontactdetails")
	public String allUsersPage1(ModelMap model) {    
		List<Contact> users=contactservice.getContact();
		model.addAttribute("users", users);
		return "allcontactdetails";
	}
	
	@RequestMapping("/delete")
	 public String delete(@RequestParam int contactId) {
		//userService.deleteUser(conatctid);
		contactservice.delete(contactId);
	  return "redirect:allcontactdetails";
	 }
	/*@RequestMapping(value="/userProfile")
	public String getUserById(@ModelAttribute("user") User user, Model model){
		Authentication auth=SecurityContextHolder.getContext().getAuthentication();
		 String name=auth.getName();
		 user.setUsername(name);
		 List<User> list=userService.getAllUsers();
		 model.addAttribute("user", list);
		model.addAttribute("user", user);
		return "userProfile";
	}*/
	
	@RequestMapping(value="/userProfile")
	public String getUserById(ModelMap model,Principal principal){
		String name=principal.getName();
		model.addAttribute("myName", name);
		return "userProfile";
	}
	
	@RequestMapping("/deleteUser")
	 public String deleteUser(@RequestParam int userid) {
		userService.deleteUser(userid);
	  return "redirect:allUsers";
	 }
	
	@RequestMapping(value="/aboutPage")
	public String aboutPage()
	{
		return "aboutPage";
	}
	
	/*@RequestMapping(value="/contactPage")
	public String contact()
	{
		return "contactPage";
	}*/
	
	@RequestMapping(value="/cloudCourse")
	public String coursePage()
	{
		return "cloudCourse";
	}
	@RequestMapping(value="/cloudSchedule")
	public String schedule()
	{
		return "cloudSchedule";
	}
	
	/*@RequestMapping(value="/createForum")
	public String createForum()
	{
		return "createForum";
	}
	
	@RequestMapping(value="/viewForum")
	public String viewForum()
	{
		return "viewForum";
	}
	
	@RequestMapping(value="/Forum")
	public String Forum()
	{
		return "Forum";
	}*/
	
	

	
/*	@RequestMapping("/newforum")
	public String createBlog(HttpServletRequest request,Model model)
	{
		String name=request.getParameter("forum");
		model.addAttribute("name",name);
		System.out.println("In Forum Controller");
		return "Forum";
	}
	*/
	

	
@RequestMapping(value = "/contactPage", method = RequestMethod.GET) 
	public String displayContact(Model model) { 
	    model.addAttribute("contact", new Contact()); 
	    return "contactPage"; 
	}


/*@RequestMapping("/postF")
public String postblog(@ModelAttribute("forum") Forum forum , Model model, HttpServletRequest request, Principal principal) throws IOException
{
	System.out.println("I am in Forum");	
	currentUser = principal.getName();
	forum.setForumUserName(currentUser);		
	forum.setCreationdatetime(new java.util.Date());		
	fservice.createNewForum(forum);
	return "Forum";
}*/


@RequestMapping("/addContact")
public String allContacts(@ModelAttribute("contact") Contact contact , Model model)
{
	System.out.println("add contact method in front controller");
	//String contact = request.getParameter("contact");
	//List<Contact> contact=contactservice.getContact();
	contact.setDate(new Date());
	contactservice.addContact(contact);
	//map.addAttribute("contact", contact);
	return "addContact";
}
@RequestMapping("/Chatt")
public String viewApplication() 
{
		System.out.println("i am in controller");
  return "ChatPage";
}
  
@MessageMapping("/chat")
@SendTo("/topic/message")
public OutputMessage sendMessage(Message message) {
  return new OutputMessage(message, new Date());
}

@RequestMapping(value="/angularformwithlist" ,method = RequestMethod.GET)
public String getForumPage() {
    return "angularformwithlist";
}
@RequestMapping(value="/angularpostwithlist" ,method = RequestMethod.GET)
public String getPostPage() {
    return "angularpostwithlist";
}
@RequestMapping(value="/AngularUserEdit" ,method = RequestMethod.GET)
public String getAngularUserEditPage() {
    return "AngularUserEdit";
}
@RequestMapping(value="/AngularContactPage" ,method = RequestMethod.GET)
public String getAngularContactPage() {
    return "AngularContactPage";
}
}
