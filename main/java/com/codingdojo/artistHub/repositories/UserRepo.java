package com.codingdojo.artistHub.repositories;



import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.artistHub.models.Song;
import com.codingdojo.artistHub.models.User;


@Repository
public interface UserRepo extends CrudRepository<User, Long>{
	User findByEmail(String email);
	User findByArtistName(String artistName);
}
