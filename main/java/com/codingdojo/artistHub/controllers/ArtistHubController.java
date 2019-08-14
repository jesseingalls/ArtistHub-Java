package com.codingdojo.artistHub.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.artistHub.models.Song;
import com.codingdojo.artistHub.models.User;
import com.codingdojo.artistHub.services.UserService;
import com.codingdojo.artistHub.validators.UserValidator;


@Controller
public class ArtistHubController {
	@Autowired
	private UserService userService;
	@Autowired
    private UserValidator userValidator;
    
	@RequestMapping("/")
    public String home(@ModelAttribute("user") User user, Model model) {
    	return "home.jsp";
    }
    
	@RequestMapping("/registration")
    public String registerAndLogin(@ModelAttribute("user") User user, Model model) {
    	return "registration.jsp";
    }
    
    @RequestMapping(value="/create", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session, Model model) {
    	userValidator.validate(user, result);
    	if(result.hasErrors()) {
    		return "/registration.jsp";
    	} else {
    		User u = userService.registerUser(user);
    		session.setAttribute("userId", u.getId());
    		return "redirect:/artistPage";
    	}
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@Valid @RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session) {
    	boolean isAuthenticated = userService.authenticateUser(email, password);
    	if (isAuthenticated) {
    		User u = userService.findByEmail(email);
    		u.getSongs();
    		session.setAttribute("userId", u.getId());
    		return "redirect:/artistPage";
    	} else {
    		model.addAttribute("user", new User());
    		model.addAttribute("error", "Invalid Credentials. Please try again.");
    		return "/registration.jsp";
    	}
    }
	@RequestMapping(value="/artistPage")
    public String showArtist(
    	@ModelAttribute("Song") Song song,
    	@ModelAttribute("User") User user,
    	Model model, 
    	HttpSession session) {
		Long id = (Long) session.getAttribute("userId");
		User u = userService.findById(id);
		List<Song> songs = u.getSongs();
		List<Song> allSongs = userService.allSongs();
		model.addAttribute("user", u);
		model.addAttribute("allSongs", allSongs);
		model.addAttribute("songs", songs);
		return "artistPage.jsp";
    }
    @PostMapping("/search")
    public String index(@RequestParam(value="artistName") String artistName) {
        System.out.println(artistName);
        List<Song> allSongs = userService.getAllSongsByArtistName(artistName);
       
    	return "redirect:/search/" + artistName;
    }
    
    
	@RequestMapping(value="/search/{artistName}")
	public String showSongs(Model model, @PathVariable("artistName") String artistName,
			@PathVariable("artistName") String artist,
			@ModelAttribute("Song") Song song,
	    	@ModelAttribute("User") User user,
	    	HttpSession session) {
//			Long id = (Long) session.getAttribute("userId");
			User u = userService.findByArtist(artistName);
			List<Song> songs = userService.getSongs(artist);
			 List<Song> allSongs = userService.getAllSongsByArtistName(artistName);
			model.addAttribute("user", u);
			model.addAttribute("allSongs", allSongs);
			return "/viewArtist.jsp";
	}
	
	@PostMapping("/uploadImage")
	public String uploadImage(
			@RequestParam("imageFile") MultipartFile imageFile, HttpSession session) {
		String returnValue = "";
		try {
			User u = userService.findById( (Long)session.getAttribute("userId"));
			userService.saveImage(imageFile, u);
		} catch (Exception e ) {
			e.printStackTrace();
			returnValue = "error";
		}
		
		return "redirect:/artistPage";
	}
	@PostMapping("/uploadSong")
	public String uploadSong(
		@Valid @ModelAttribute("Song") Song s, BindingResult result,
		@RequestParam("audioFile") MultipartFile audioFile,
		@RequestParam("title") String title,
		@RequestParam("artist") String artist,
		@RequestParam("genre") String genre,
		HttpSession session)
		{
		String returnValue = "";
		try {
			User u = userService.findById( (Long)session.getAttribute("userId"));
			s.setUser(u);
			userService.saveSong(s, audioFile);
		} catch (Exception e ) {
			e.printStackTrace();
			returnValue = "error";
		}
		
		return "redirect:/artistPage";
	}
    @RequestMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
   
    @RequestMapping(value="/delete/{id}", method=RequestMethod.DELETE)
 	public String destroy(@PathVariable("id") Long id) {
     	userService.deleteSong(id);
     	return "redirect:/artistPage";
     }
}
