package com.advik.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.advik.model.Roles;
import com.advik.model.User;
import com.advik.service.RolesService;
import com.advik.service.UserService;
import com.advik.model.Login;

@Controller
public class LoginController {
	
	private Path path;
	HttpServletRequest request;
	@Autowired
	private UserService userService;
	
	@Autowired
	private RolesService rolesService;

	@RequestMapping("/signUp")
	
	   public String registerPage() {
	      return "signUpPage";
	   }
	@ModelAttribute("instuser")
	public User authentication()
	{
		return new User();
	}
	@RequestMapping("/adduser")
	public String addNewUser(@Valid @ModelAttribute("instuser") User user,BindingResult result, HttpServletRequest request,Model model)
	{
		 if(result.hasErrors()){
	            return "signUpPage";
	        }
		 List<User> userList = userService.getAllUsers();

	        for (int i=0; i< userList.size(); i++){
	            if(user.getEmail().equals(userList.get(i).getEmail())){
	                model.addAttribute("emailMsg", "Email already exists");

	                return "signUpPage";
	            }

	            if(user.getUsername().equals(userList.get(i).getUsername())){
	                model.addAttribute("usernameMsg", "Username already exists");

	                return "signUpPage";
	            }
	        }
	   
	   userService.addUser(user);
	   Roles roleAuth=new Roles();
	   roleAuth.setRole("ROLE_USER");
	   roleAuth.setUserid(user.getUserid());
	   
	   rolesService.addRole(roleAuth);
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
      
		return "loginPage";
	}
	
	@RequestMapping(value = "/login")
	public ModelAndView loginPage(@RequestParam(value="error", required = false)
	String error,@RequestParam(value="logout", required = false)String logout,Model model) {
		if(error != null){
			model.addAttribute("error", "Invalid username and password");
			}

			if (logout !=null){
			model.addAttribute("msg", "You have been logged out successfully !!!!");
			}
			
		return new ModelAndView("loginPage");
	}

	 @RequestMapping(value = "/login", method = RequestMethod.POST)
	    public String doLogin(@Valid @ModelAttribute("validate") Login validate,
	            BindingResult result, Map<String, Object> model) {
	 
	        if (result.hasErrors()) {
	            return "loginPage";
	        }
	    	   
	        return "loginPage";
	       
	    }
	

}
