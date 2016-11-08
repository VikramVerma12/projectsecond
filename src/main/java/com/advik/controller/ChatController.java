package com.advik.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ChatController {

	@RequestMapping(value={"/Chat"})
    public String openChat(ModelMap map,Principal principal)
    {
		String name=principal.getName();
		map.addAttribute("myName", name);
    	return "Chat";
    }
	@RequestMapping(value="/application",method=RequestMethod.POST)
    public String chat(ModelMap map,Principal principal)
    {

    	return "application";
    }
}
