<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>
</head>
<body>
	<!-- <div class="container"> -->
  		<div class="row reg-header">
    		<div class="col">
    		<div>
				<a class="btn btn-outline-dark create-btn2" href="/logout" role="button">Home</a>
			</div>
				<h2 class="title3" >Create Profile</h2>
    		</div>
		</div>
  		<div class="row low-header">
    		<div class="col image1">
    			<p><form:errors class="reg-errors" path="user.*"/></p>
	 			<form:form class="reg-form text-center" method="POST" action="/create" modelAttribute="user">
        			<h1>REGISTER</h1><br>
        			<p>
            			<form:label path="artistName">Artist Name: </form:label>
            			<form:input path="artistName"/>
       				</p>
        			<p>
       				</p>
       				<p>
            			<form:label path="email">Email: </form:label>
            			<form:input type="email" path="email"/>
       				</p>
        			<p>
            			<form:label path="password">Password: </form:label>
            			<form:password path="password"/>
        			</p>
        			<p>
            			<form:label path="passwordConfirmation">Password Confirmation:</form:label>
            			<form:password path="passwordConfirmation"/>
        			</p>
        				<input class="reg-button" type="submit" value="GO"/>
    			</form:form> 
    			<div class="reg-form2 text-center">
    			
    				<p><c:out value="${error}" /></p>
    				<form:form method="post" action="/login" modelAttribute="user">
    				<h1>LOGIN</h1><br>
        			<p>
            			<label for="email">Email: </label>
            			<input type="text" id="email" name="email"/>
       		 		</p>
       		 		<p>
            			<label for="password">Password: </label>
            			<input type="password" id="password" name="password"/>
        			</p>
        				<input class="reg-button2" type="submit" value="GO"/>
    				</form:form> 
    			</div>
     	 	</div>
  		</div>
  <!--    </div> -->


</body>
</html>