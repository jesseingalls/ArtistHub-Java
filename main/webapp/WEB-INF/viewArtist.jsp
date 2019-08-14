<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Artist</title>
<script src="https://kit.fontawesome.com/df838f8f1a.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="/css/style.css"/>
</head>
<body>
	<div class="image3">
		<div>
			<a class="btn btn-outline-light create-btn2" href="/logout" role="button">Home</a>
		</div>
		<div >
			<h2 class="title4 text-center"><c:out value="${user.artistName}"/></h2>
		</div>
			<div class="rating">
			<!-- 	<h3 class="tag rate">Current Rating</h3> -->
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
		<table class="table table-dark songList">
		<tbody>
			<tr>
				<c:forEach items="${allSongs}" var="s">
					<tr>
						<td><h3 class="song-title"><c:out value="${s.title}"/></h3></td>
						<td>
						<audio class="song-box" controls>
  						<source class="song-box" src="/audio/${s.fileName}" type="audio/mpeg"> 
						</audio>
						</td>
					</tr>
  				</c:forEach> 
			</tr>
		</tbody>
		</table>
		<div class="rating">
			<input type="radio" name="star" id="star1">
			<label for="star1"></label>
			<input type="radio" name="star" id="star2">
			<label for="star2"></label>
			<input type="radio" name="star" id="star3">
			<label for="star3"></label>
			<input type="radio" name="star" id="star4">
			<label for="star4"></label>
			<input type="radio" name="star" id="star5">
			<label for="star5"></label>
			<form action="/search" method="POST">
				<a href="" class="btn btn-outline-light">
				<i class="fas fa-hand-point-up"></i>
				</a>
			</form>
		</div> 
<!-- 		<div class="text-center">
			
		</div> -->
	</div>
</body>
</html>