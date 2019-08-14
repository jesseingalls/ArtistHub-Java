<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Artist Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	<div class="image2">
		
		<a class="btn btn btn-dark create-btn" href="/logout" role="button">Log Out</a>
		<h2 class="title2"><c:out value="${user.artistName}"/></h2>
			<div class="rating">
				<!-- <p class="tag rate">Rate Artist</p> -->
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
			</div> 
		<c:choose>
        	<c:when test = "${user.picture_name == null}">
           		<div><img  class="artist2" src="/images/logo.png"></div>
            </c:when>
         	<c:otherwise>
           		<div><img  class="artist3" src="/images/${user.picture_name}"></div>
         	</c:otherwise>
      	</c:choose>
	
		<div class="imageUpload text-center">
		<h3 class="tag">Upload an image</h3>
			<form:form method="post" enctype="multipart/form-data" action="/uploadImage">
				<input type="file" name="imageFile">
				<input class="btn btn btn-dark" type="submit" value="Upload Photo"/>
			</form:form>
		</div>
		<div class="imageUpload text-center">
			<h3 class="tag">Upload a song</h3>
			<form:form method="post" enctype="multipart/form-data" modelAttribute="Song" action="/uploadSong">
				<input type="file" name="audioFile">
				<input class="btn btn btn-dark" type="submit" value="Upload Song"/>
				<br>
				<br>
				<div class="song-info card bg-dark">
				<div class="text-center">
					<label class="tag">Title:</label>
					<input class="bg-secondary" type="text" name="title">
				</div> 
				<br>
			
				<div class="text-center">
					<label class="tag">Artist Name:</label>
					<input class="bg-secondary" type="text" name="artist">
				</div>
				<br>
			
				<div class="text-center">
					<label class="tag">Genre:</label>
					<input class="bg-secondary" type="text" name="genre">
				</div>
				</div>
			</form:form>
		</div>
		<table class="table table-dark songList">
		<tbody>
			
				<c:forEach items="${songs}" var="s">
					<tr>
						<td><h5 class="song-title"><c:out value="${s.title}"/></h5></td>
						<td  >
						<audio class="song-box " controls>
  						<source class="song-box" src="/audio/${s.fileName}" type="audio/mpeg"> 
						</audio>
						</td>
						<td>
							<div>
            					<form action="/delete/${s.id}" method="post">
            						<input type="hidden" name="_method" value="delete">
            						<button class="btn btn-light" type="submit" value="Delete">Delete</button>
            					</form> 
            				</div>
						</td>
					</tr>
  				</c:forEach> 
			
		</tbody>
		</table>
	</div>
</body>
</html>