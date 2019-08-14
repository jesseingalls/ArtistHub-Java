package com.codingdojo.artistHub.services;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.codingdojo.artistHub.models.Song;
import com.codingdojo.artistHub.models.User;
import com.codingdojo.artistHub.repositories.SongRepo;
import com.codingdojo.artistHub.repositories.UserRepo;


@Service
public class UserService {
    @Autowired
	private UserRepo userRepo;
    @Autowired
    private SongRepo songRepo;
    
    public User createUser(User user) {
        return userRepo.save(user);
    }
    
    public User registerUser(User user) {
        String hashed = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashed);
        return userRepo.save(user);
    }
    
    public User findByEmail(String email) {
        return userRepo.findByEmail(email);
    }
    
	public List<Song> getSongs(String artistName) {
		return songRepo.findByArtistContains(artistName);
	}
	public boolean authenticateUser(String email, String password) {
        User user = userRepo.findByEmail(email);
        if(user == null) {
            return false;
        } else {
            if(BCrypt.checkpw(password, user.getPassword())) {
                return true;
            } else {
                return false;
            }
        }
    }
    
    public User findById(Long id) {
        Optional<User> optionalUser = userRepo.findById(id);
        if(optionalUser.isPresent()) {
            return optionalUser.get();
        } else {
            return null;
        }
    }

     
	public void saveImage(MultipartFile imageFile, User u) throws Exception{
		String folder = "/Users/jesseingalls/Desktop/spring-Boot-Jun/ArtistHub-JavaProject/src/main/resources/static/images/";
		imageFile.getBytes();
		byte[] bytes = imageFile.getBytes();
		String filename = imageFile.getOriginalFilename();
		Path path = Paths.get(folder + filename);
		Files.write(path, bytes);
		u.setPicture_name(filename);
		userRepo.save(u);
	}
	
	public void saveSong(Song song, MultipartFile audioFile) throws Exception{
		String folder = "/Users/jesseingalls/Desktop/spring-Boot-Jun/ArtistHub-JavaProject/src/main/resources/static/audio/";
		audioFile.getBytes();
		byte[] bytes = audioFile.getBytes();
		String musicPath = audioFile.getOriginalFilename();
		Path path = Paths.get(folder + musicPath);
		Files.write(path, bytes);
		song.setFileName(musicPath);
		songRepo.save(song);
	}
	
	public List<Song> allSongs(){
		return songRepo.findAll();
	}

	public User findByArtist(String artistName) {
		return userRepo.findByArtistName(artistName);
	}
//	public List<Song> findByArtistName(String artist) {
//		return userRepo.findByArtist(artist);
//	}

	public List<Song> getAllSongsByArtistName(String artistName) {
		User u = userRepo.findByArtistName(artistName);
		return songRepo.findByUser(u);
	}

	public void deleteSong(Long id) {
		songRepo.deleteById(id);
		
	}

//	public String savePicture(String picture) {
////		return userRepo.save(user);
//		
//	}
//		
		




}
