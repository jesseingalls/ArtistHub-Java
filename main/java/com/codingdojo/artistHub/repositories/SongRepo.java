package com.codingdojo.artistHub.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.artistHub.models.Song;
import com.codingdojo.artistHub.models.User;

@Repository
public interface SongRepo extends CrudRepository<Song, Long>{
	List<Song> findAll();
	List<Song> findByArtist(String artist);
	List<Song> findByArtistContains(String artistName);
	List<Song> findByUser(User u);
}
