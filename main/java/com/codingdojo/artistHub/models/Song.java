package com.codingdojo.artistHub.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;


@Entity
@Table(name="songs")
public class Song {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@NotBlank(message="Title must not be blank")
	private String title;
	@NotBlank(message="Artist must not be blank")
	private String artist;
	@NotBlank(message="Genre must not be blank")
	private String genre;
	private String fileName;
	@Column(updatable=false)
	private Date createdAt;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id")
    private User user;
	
	public Song() {
	}
	
	public Song(Long id, @NotBlank(message = "Title must not be blank") String title,
			@NotBlank(message = "Artist must not be blank") String artist,
			@NotBlank(message = "Genre must not be blank") String genre, String fileName, User user) {
		this.id = id;
		this.title = title;
		this.artist = artist;
		this.genre = genre;
		this.fileName = fileName;
		this.user = user;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public String getGenre() {
		return genre;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setGenre(String genre) {
		this.genre = genre;
	}
	@PrePersist
    protected void onCreate() {
    	this.createdAt = new Date();
    }
	
	@PreUpdate
    protected void onUpdate() {
    	this.updatedAt = new Date();
    }
}
