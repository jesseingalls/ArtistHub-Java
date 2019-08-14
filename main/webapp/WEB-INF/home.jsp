<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ArtistHub HomePage</title>
<script src="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Rubik+Mono+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="css/style.css"/>


</head>
<body>

	<!-- <div class="container "> -->
  	<div class="row header">
  			
    	<div class="col">
    		<img  class="logo" src="/portal_content/images/logo.png">
    		<!-- <a class="btn btn-outline-dark create-btn-account" href="/registration" role="button">Create Artist Account</a> -->
    		<h2 class="title m12 font-weight-bolder">ArtistHub</h2> 
			<a class="btn btn-outline-dark create-btn-login" href="/registration" role="button">Login</a>
      			<section> 
      				<img class="header-photo bottom" src="/portal_content/images/dj.jpg">
      				<img class="header-photo middle" src="/portal_content/images/soundwave.jpg">
 		    		<img class="header-photo top" src="/portal_content/images/live2.jpg">
 		    	</section>
    	</div>

  	</div>
  	<div class="row">
  	<h4 class="info font-weight-bolder">Top Rated</h4> 
  		<div id="scroller" style="width: 100%; height: 150px; margin: 0 auto;">
    		<div class="col innerScrollArea">
    			<ul>
    			
    				<li><img  class="artist" src="/images/biggie.jpg"></li>
    				<li><img  class="artist" src="/images/tupac.jpg"></li>
    				<li><img  class="artist" src="/portal_content/images/alecBenjamin.jpg"></li>
    				<li><img  class="artist" src="/images/lennon.jpg"></li>
    				<li><img  class="artist" src="/images/ladygaga.jpg"></li>
    				<li><img  class="artist" src="/images/drake.jpg"></li>
    			</ul>
			</div>
		</div>
    </div>
     <div class="row header2">
  			
    	<div class="col">
    		<img  class="logo" src="/portal_content/images/logo.png">
    		<h4 class="low-title font-weight-bolder">Home For Artists</h4>
			<!-- <a class="btn btn-outline-dark create-btn" href="/registration" role="button">Login</a> -->
			
			<form class="form-inline md-form form-sm" action="/search" method="POST">
 				<input class="form-control form-control-sm mr-3 w-75 search" name="artistName" type="search" placeholder="Search Artists"
    			aria-label="Search">
    			<button type="search" class="btn btn-dark ">Search Artists</button>
			</form>
      		<!-- <img class="header-photo" src="/portal_content/images/concert.jpg"> -->
    	</div>
    
	</div>
<!-- </div> -->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.1/jquery.min.js"></script>
<script type="text/javascript">
    $(function(){
        var scroller = $('#scroller div.innerScrollArea');
        var scrollerContent = scroller.children('ul');
        scrollerContent.children().clone().appendTo(scrollerContent);
        var curX = 0;
        scrollerContent.children().each(function(){
            var $this = $(this);
            $this.css('left', curX);
            curX += $this.outerWidth(true);
        });
        var fullW = curX / 2;
        var viewportW = scroller.width();

        // Scrolling speed management
        var controller = {curSpeed:0, fullSpeed:2};
        var $controller = $(controller);
        var tweenToNewSpeed = function(newSpeed, duration)
        {
            if (duration === undefined)
                duration = 600;
            $controller.stop(true).animate({curSpeed:newSpeed}, duration);
        };

        // Pause on hover
        scroller.hover(function(){
            tweenToNewSpeed(0);
        }, function(){
            tweenToNewSpeed(controller.fullSpeed);
        });

        // Scrolling management; start the automatical scrolling
        var doScroll = function()
        {
            var curX = scroller.scrollLeft();
            var newX = curX + controller.curSpeed;
            if (newX > fullW*2 - viewportW)
                newX -= fullW;
            scroller.scrollLeft(newX);
        };
        setInterval(doScroll, 25);
        tweenToNewSpeed(controller.fullSpeed);
    });
</script>
</body>
</html>