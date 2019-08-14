package com.codingdojo.artistHub.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long id;
    @NotBlank(message="Artist name must not be blank")
    private String artistName;
	@NotBlank(message="Email must not be blank")
    @Email(message="Email must be valid")
    private String email;
	private String picture_name;
    @Size(min=5, message="Password must be greater than 5 characters")
    private String password;
    @Transient
    private String passwordConfirmation;
    @Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    @OneToMany(mappedBy="user", fetch = FetchType.LAZY)
    private List<Song> songs;
	
	public User () {
		
	}



	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}



	public String getArtistName() {
		return artistName;
	}



	public void setArtistName(String artistName) {
		this.artistName = artistName;
	}



	public String getEmail() {
		return email;
	}



	public void setEmail(String email) {
		this.email = email;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}

	public String getPasswordConfirmation() {
		return passwordConfirmation;
	}

	public void setPasswordConfirmation(String passwordConfirmation) {
		this.passwordConfirmation = passwordConfirmation;
	}

	public List<Song> getSongs() {
		return songs;
	}



	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}



	@PrePersist
    protected void onCreate() {
    	this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate() {
    	this.updatedAt = new Date();
    }



	public String getPicture_name() {
		return picture_name;
	}



	public void setPicture_name(String picture_name) {
		this.picture_name = picture_name;
	}
}
