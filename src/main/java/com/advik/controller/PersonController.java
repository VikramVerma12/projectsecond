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
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.util.UriComponentsBuilder;
import com.advik.model.Forum;
import com.advik.service.ForumService;



@Controller
@RequestMapping("/info")
public class PersonController {
	@Autowired
	private ForumService personService;
	/*@RequestMapping("/home")
	public String home() {
 		return "home";
 	}*/
	
	
	String currentUser="";
	@RequestMapping(value="/person/{id}", method = RequestMethod.GET )
	public ResponseEntity<Forum> getPersonById(@PathVariable("id") Integer id) {
		Forum person = personService.getForum(id);
		return new ResponseEntity<Forum>(person, HttpStatus.OK);
	}
	
	
	@RequestMapping(value= "/person", method = RequestMethod.GET)
	public ResponseEntity<List<Forum>> getAllPersons() {
		List<Forum> list = personService.getForum();
		return new ResponseEntity<List<Forum>>(list, HttpStatus.OK);
	}
	
	
	@RequestMapping(value= "/person", method = RequestMethod.POST)
	public ResponseEntity<Void> addPerson(@RequestBody Forum person, UriComponentsBuilder builder ,Principal principal) {
		currentUser = principal.getName();
		person.setForumUserName(currentUser);
	
		person.setCreationdatetime(new java.util.Date());		
		
		
       personService.createNewForum(person);
     //   if (flag == false) {
      //  	return new ResponseEntity<Void>(HttpStatus.CONFLICT);
      //  }
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/person/{id}").buildAndExpand(person.getForumid()).toUri());
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}


	
	//for updating forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.PUT  )
	public ResponseEntity<Forum> updatePerson(@RequestBody Forum person,Principal principal) throws ParseException {
		  
		currentUser = principal.getName();
		person.setForumUserName(currentUser);
		person.setForumtitle(person.getForumtitle());
		person.setForumcontent(person.getForumcontent());
		
		
		person.setCreationdatetime(new Date());	
		personService.editForum(person);
		return new ResponseEntity<Forum>(person, HttpStatus.OK);
	}
	
	
	//for deleting forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.DELETE )
	public ResponseEntity<Void> deletePerson(@PathVariable("id") Integer id) {
		personService.delete(id);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}	
} 