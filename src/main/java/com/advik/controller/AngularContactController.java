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

import com.advik.model.Contact;
import com.advik.model.Post;
import com.advik.service.ContactService;
import com.advik.service.PostService;

@Controller
@RequestMapping("/info2")
public class AngularContactController {
	@Autowired
	private ContactService personService;
	
	String currentUser="";
	@RequestMapping(value="/person/{id}", method = RequestMethod.GET )
	public ResponseEntity<Contact> getPersonById(@PathVariable("id") Integer id) {
		 System.out.println("getting single contact");
	   //Forum person = personService.getForum(id);
		Contact person = personService.get(id);
		return new ResponseEntity<Contact>(person, HttpStatus.OK);
	}
	
	
	@RequestMapping(value= "/person", method = RequestMethod.GET)
	public ResponseEntity<List<Contact>> getAllPersons() {
		System.out.println("getting all Contacts");
		List<Contact> list = personService.getContact();
		return new ResponseEntity<List<Contact>>(list, HttpStatus.OK);
	}
	
	
	@RequestMapping(value= "/person", method = RequestMethod.POST)
	public ResponseEntity<Void> addPerson(@RequestBody Contact person, UriComponentsBuilder builder ,Principal principal) {
		System.out.println("adding a contact");
		//currentUser = principal.getName();
		person.setContactname(person.getContactname());
	    person.setDate(new Date());
	    personService.addContact(person);
        HttpHeaders headers = new HttpHeaders();
        headers.setLocation(builder.path("/person/{id}").buildAndExpand(person.getId()).toUri());
    	System.out.println("adding completing a contact");
        return new ResponseEntity<Void>(headers, HttpStatus.CREATED);
	}

	//for updating forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.PUT  )
	public ResponseEntity<Contact> updatePerson(@RequestBody Contact person,Principal principal) throws ParseException {
	System.out.println("updating a contact");
	String	currentUser = principal.getName();
	System.out.println("current user name is ->"+currentUser);
	person.setContactname(person.getContactname());
	person.setEmail(person.getEmail());
	person.setAddress(person.getAddress());
	person.setTelephone(person.getTelephone());
	person.setDate(new Date());
	personService.editContact(person);
	System.out.println("completing updating a contact");
	return new ResponseEntity<Contact>(person, HttpStatus.OK);	
	}

	//for deleting forum
	@RequestMapping(value="/person/{id}", method = RequestMethod.DELETE )
	public ResponseEntity<Void> deletePerson(@PathVariable("id") Integer id) {
		System.out.println("deleting a contact");
		personService.delete(id);
		return new ResponseEntity<Void>(HttpStatus.NO_CONTENT);
	}	
} 