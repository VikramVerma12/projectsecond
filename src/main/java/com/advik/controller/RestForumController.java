package com.advik.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.util.UriComponentsBuilder;

import com.advik.dao.ForumDaoInterface;
import com.advik.model.Forum;
import com.advik.service.ForumService;
import com.google.gson.Gson;



@Controller
//@RequestMapping("/info")
public class RestForumController 
{
	@Autowired
	private ForumService fservice;

	@Autowired
	ForumDaoInterface dao;
	
	
	//getting angular get request
		@RequestMapping("/GsonCon1")
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
		}
		
	
	
	
 //for angular updating a user
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.PUT)
    public ResponseEntity<Forum> updateUser(@PathVariable("id") int id, @RequestBody Forum forum) {
        System.out.println("Updating User " +id);
         
        Forum forum1 = fservice.getForum(id);
         
        if (forum1==null) {
            System.out.println("Forum with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
 
       // currentUser.setUsername(user.getUsername());
        //currentUser.setAddress(user.getAddress());
        //currentUser.setEmail(user.getEmail());
         
        //userService.updateUser(currentUser);
        forum1.setForumtitle(forum1.getForumtitle());
		forum1.setForumcontent(forum1.getForumcontent());
		forum1.setCreationdatetime(new java.util.Date());
		fservice.editForum(forum1);
        return new ResponseEntity<Forum>(forum1, HttpStatus.OK);
    }
 
    
	
    //for deleting forum with angularjs
    
    @RequestMapping(value = "/user/{id}", method = RequestMethod.DELETE)
    public ResponseEntity<Forum> deleteUser(@PathVariable("id") int id) {
        System.out.println("Fetching & Deleting User with id " + id);
        Forum forum = fservice.getForum(id);
        if (forum == null) {
            System.out.println("Unable to delete. User with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
        fservice.delete(id);
        return new ResponseEntity<Forum>(HttpStatus.NO_CONTENT);
    }
    
    //-----------------getting all forums
    
    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public ResponseEntity<List<Forum>> getForum() {
    	System.out.println("it is in listAllUsers for showing all forums together");
        List<Forum> users = fservice.getForum();
        if(users.isEmpty()){
            return new ResponseEntity<List<Forum>>(HttpStatus.NO_CONTENT);//You many decide to return HttpStatus.NOT_FOUND
        }
        return new ResponseEntity<List<Forum>>(users, HttpStatus.OK);
    }
 
 
    
    //-------------------Retrieve Single User--------------------------------------------------------
     
    @RequestMapping(value = "/user/{id}", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<Forum> getUser(@PathVariable("id") int id) {
        System.out.println("Fetching User with id " + id);
        Forum user =fservice.getForum(id);
        if (user == null) {
            System.out.println("Forum with id " + id + " not found");
            return new ResponseEntity<Forum>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<Forum>(user, HttpStatus.OK);
    }
 
     
     
    //-------------------Create a User--------------------------------------------------------
     
    @RequestMapping(value = "/user", method = RequestMethod.POST)
    public ResponseEntity<Void> createUser(@RequestBody Forum user,    UriComponentsBuilder ucBuilder) {
        System.out.println("Creating Form " + user.getForumUserName());
        fservice.createNewForum(user);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(ucBuilder.path("/user/{id}").buildAndExpand(user.getForumid()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
    }
 
    
     
    
}