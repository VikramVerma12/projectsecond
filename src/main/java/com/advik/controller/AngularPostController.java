package com.advik.controller;


import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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

import com.advik.model.Post;

import com.advik.service.PostService;


@RestController
@Controller
@RequestMapping("/info1")
public class AngularPostController {
	@Autowired
	private PostService personService;
	/*@RequestMapping("/home")
	public String home() {
 		return "home";
 	}*/
	String currentUser="";
	
	
	
	@ResponseBody
	@RequestMapping(value="/person/{id}", method = RequestMethod.GET )
	public ResponseEntity<Post> getPersonById(@PathVariable("id") Integer id) {
		System.out.println("getting single post");
	//	Forum person = personService.getForum(id);
		Post person = personService.getPost(id);
		return new ResponseEntity<Post>(person, HttpStatus.OK);
	}
	
	@ResponseBody
	@RequestMapping(value= "/person", method = RequestMethod.GET)
	public ResponseEntity<List<Post>> getAllPersons() {
		System.out.println("getting all posts");
		List<Post> list = personService.getAllPosts();
		return new ResponseEntity<List<Post>>(list, HttpStatus.OK);
	}
	
	/*@RequestMapping(value = "/person", produces =MediaType.APPLICATION_JSON_VALUE )
	public ResponseEntity<String> findMessagesForUser(Principal principal) {
	        return new ResponseEntity<String>(principal.getName(), HttpStatus.OK);
	}*/
	
	@RequestMapping(value= "/person", method = RequestMethod.POST)
	public ResponseEntity<Void> addPerson(@RequestBody Post person, UriComponentsBuilder builder ,Principal principal) {
		System.out.println("adding a post");
		currentUser = principal.getName();
		//person.setForumUserName(currentUser);
	person.setPostUser(currentUser);
	
		//person.setCreationdatetime(new java.util.Date());		
	person.setDate(new java.util.Date());
		
		
      /// personService.createNewForum(person);
     //   if (flag == false) {
      //  	return new ResponseEntity<Void>(HttpStatus.CONFLICT);
      //  }
	personService.addPost(person);
	System.out.println("current user name is ->"+currentUser);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/person/{id}").buildAndExpand(person.getId()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


	
	//for updating forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.PUT  )
	public ResponseEntity<Post> updatePerson1(@RequestBody Post person,Principal principal) throws ParseException {
		System.out.println("updating a post");
	String	currentUser = principal.getName();
		//person.setForumUserName(currentUser);
		//person.setForumtitle(person.getForumtitle());
		//person.setForumcontent(person.getForumcontent());
	System.out.println("current user name is ->"+currentUser);
		
		//person.setCreationdatetime(new Date());	
		//personService.editForum(person);
		person.setPostUser(currentUser);
		person.setTitle(person.getTitle());
		person.setContent(person.getContent());
		person.setDate(new Date());
		personService.editPost(person);
		System.out.println("completing updating a post");
		return new ResponseEntity<Post>(person, HttpStatus.OK);
	
	}
	
	
	//for deleting forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.DELETE )
	public ResponseEntity<Void> deletePerson(@PathVariable("id") Integer id) {
		System.out.println("deleting a post");
		personService.deletePost(id);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}	
} 