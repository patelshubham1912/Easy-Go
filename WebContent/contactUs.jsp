<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Holiday - Contact</title>
<!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700' rel='stylesheet' type='text/css'>
	<link href="css/font-awesome.min.css" rel="stylesheet">
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">  
	<link href="css/flexslider.css" rel="stylesheet">
	<link href="css/templatemo-style.css" rel="stylesheet">

	<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->


<!--[if gte mso 9]><xml>
<mso:CustomDocumentProperties>
<mso:IsMyDocuments msdt:dt="string">1</mso:IsMyDocuments>
</mso:CustomDocumentProperties>
</xml><![endif]-->
<script>
function valName(val){

	var pattern= /^[A-Za-z]+$/;
	if(val==""){
		//alert("in");
		document.getElementById("msg").innerHTML = "Please enter name";
		return false;
	}
	else{
		document.getElementById("msg").innerHTML = "";
	}
	if(!(val.match(pattern))){
		//alert("in");
		document.getElementById("msg").innerHTML = "Please enter valid name";
		return false;
	}else{
		document.getElementById("msg").innerHTML = "";
	}
	return true;
}

	
function valEmail(val){

	var pattern1=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(!(val.match(pattern1))){
		//alert("in");
		document.getElementById("msg1").innerHTML = "Please enter valid email";
		return false;
	}else{
		document.getElementById("msg1").innerHTML = "";
	}
	return true;
}
function valSub(val){
	
	if(val==""){
		//alert("in");
		document.getElementById("msg2").innerHTML = "Please enter subject";
		return false;
	}else{
		document.getElementById("msg2").innerHTML = "";
	}
	return true;
}
function valMsg(val){

	if(val==""){
		//alert("in");
		document.getElementById("msg3").innerHTML = "Please enter message";
		return false;
	}else{
		document.getElementById("msg3").innerHTML = "";
	}
	return true;
}
function val(){
	var name = document.getElementById("contact_name").value;
	var email=document.getElementById("contact_email").value;
	var sub=document.getElementById("contact_subject").value;
	var mes=document.getElementById("contact_message").value;
	var pattern= /^[A-Za-z]+$/;
	if(name==""){
		//alert("in");
		document.getElementById("msg").innerHTML = "Please enter name";
		return false;
	}else{
		document.getElementById("msg").innerHTML = "";
	}
	
	if(!(name.match(pattern))){
		//alert("in");
		document.getElementById("msg").innerHTML = "Please enter valid name";
		return false;
	}
	else{
		document.getElementById("msg").innerHTML = "";
	}
	var pattern1=/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
	if(!(email.match(pattern1))){
		//alert("in");
		document.getElementById("msg1").innerHTML = "Please enter valid email";
		return false;
	}
	else{
		document.getElementById("msg1").innerHTML = "";
	}
	if(sub==""){
		//alert("in");
		document.getElementById("msg2").innerHTML = "Please enter subject";
		return false;
	}
	else{
		document.getElementById("msg2").innerHTML = "";
	}
	if(mes==""){
		//alert("in");
		document.getElementById("msg3").innerHTML = "Please enter subject";
		return false;
	}
	else{
		document.getElementById("msg3").innerHTML = "";
	}
	return true;
	
}


</script>
</head>
<body>
	<!-- Header -->
	<div class="tm-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-4 col-sm-3 tm-site-name-container">
					<img id="icon"
						src="logo.jpg" />
				</div>
				<div class="col-lg-6 col-md-8 col-sm-9">
					<div class="mobile-menu-icon">
						<i class="fa fa-bars"></i>
					</div>
					<nav class="tm-nav">
						<ul>
							<li><a href="index2.jsp">Home</a></li>
							<li><a href="about.html">About</a></li>
							
							<li><a href="contactUs.jsp" class="active">Contact</a></li>
						</ul>
					</nav>		
				</div>				
			</div>
		</div>	  	
	</div>

	<!-- Banner -->
	<section class="tm-banner">
		<!-- Flexslider -->
		<div class="flexslider flexslider-banner">
		  <ul class="slides">
		    <li>
			    <div class="tm-banner-inner">
					<h1 class="tm-banner-title">Your <span class="tm-yellow-text">Special</span> flight</h1>
					<p class="tm-banner-subtitle">For Upcoming Holidays</p>
				</div>
				<img src="img/banner-3.jpg" alt="Banner 3" />	
		    </li>		    
		  </ul>
		</div>	
	</section>
	
	<!-- white bg -->
	<section class="section-padding-bottom">
		<div class="container">
			<div class="row">
				<div class="tm-section-header section-margin-top">
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>
					<div class="col-lg-4 col-md-6 col-sm-6"><h2 class="tm-section-title">Contact Us</h2></div>
					<div class="col-lg-4 col-md-3 col-sm-3"><hr></div>	
				</div>				
			</div>
			<div class="row">
				<!-- contact form -->
				<form action="xyz" method="get" class="tm-contact-form" onsubmit="return val()">
					<div class="col-lg-6 col-md-6">
						<div id="google-map"></div>
						<b>TCS, Technopark, Trivandarum</b>
					</div> 
					
					
					<div class="col-lg-6 col-md-6 tm-contact-form-input">
						<div class="form-group">
							<input type="text" id="contact_name" name="contact_name" class="form-control" placeholder="NAME" onblur="valName(this.value)"/>
							<div id="msg" style="color: red"></div>
						</div>
						<div class="form-group">
							<input type="email" id="contact_email" name="contact_email" class="form-control" placeholder="EMAIL" onblur="valEmail(this.value)"/>
							<div id="msg1" style="color: red"></div>
						</div>
						<div class="form-group">
							<input type="text" id="contact_subject" name="contact_subject" class="form-control" placeholder="SUBJECT" onblur="valSub(this.value)"/>
							<div id="msg2" style="color: red"></div>
						</div>
						<div class="form-group">
							<textarea id="contact_message" name="contact_message" class="form-control" rows="6" placeholder="MESSAGE" onblur="valMsg(this.value)"></textarea>
							<div id="msg3" style="color: red"></div>						
						</div>
						<div class="form-group">
							<input class="tm-submit-btn" type="submit" name="submit" value="Submit" >
							<input type="hidden" name="action" value="contactus">
						</div>               
					</div>
				</form>
			</div>			
		</div>
	</section>
	
	
	
	<footer class="tm-black-bg" >
		<div class="container" >
			<div class="row">
				<p class="tm-copyright-text" >
					Copyright &copy; easy go | Designed by <a rel="nofollow"
						href="about.html" target="_parent">Easy go</a>
				</p>
			</div>
		</div>
	</footer>
	
	
	
	<script type="text/javascript" src="js/jquery-1.11.2.min.js"></script>      		<!-- jQuery -->
	<script type="text/javascript" src="js/bootstrap.min.js"></script>					<!-- bootstrap js -->
	<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>			<!-- flexslider js -->
	<script type="text/javascript" src="js/templatemo-script.js"></script>      		<!-- Templatemo Script -->
	<script>
		/* Google map
      	------------------------------------------------*/
      	var map = '';
      	var center;

      	function initialize() {
	        var mapOptions = {
	          	zoom: 14,
	          	center: new google.maps.LatLng(8.553188,  76.879705),
	          	scrollwheel: false
        	};
        
	        map = new google.maps.Map(document.getElementById('google-map'),  mapOptions);

	        google.maps.event.addDomListener(map, 'idle', function() {
	          calculateCenter();
	        });
        
	        google.maps.event.addDomListener(window, 'resize', function() {
	          map.setCenter(center);
	        });
      	}

	    function calculateCenter() {
	        center = map.getCenter();
	    }

	    function loadGoogleMap(){
	        var script = document.createElement('script');
	        script.type = 'text/javascript';
	        script.src = 'https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false&' + 'callback=initialize';
	        document.body.appendChild(script);
	    }
	
      	// DOM is ready
		$(function() {

			// https://css-tricks.com/snippets/jquery/smooth-scrolling/
			$('a[href*=#]:not([href=#])').click(function() {
				if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && location.hostname == this.hostname) {
					var target = $(this.hash);
					target = target.length ? target : $('[name=' + this.hash.slice(1) +']');
					if (target.length) {
						$('html,body').animate({
							scrollTop: target.offset().top
						}, 1000);
						return false;
					}
				}
			});

		  	// Flexslider
		  	$('.flexslider').flexslider({
		  		controlNav: false,
		  		directionNav: false
		  	});

		  	// Google Map
		  	loadGoogleMap();
		  });
	</script>
</body>
</html>
