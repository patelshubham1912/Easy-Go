<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.*,com.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Easy Go</title>

<!--
Holiday Template
http://www.templatemo.com/tm-475-holiday
-->
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'
	rel='stylesheet' type='text/css'>
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

<style>
#test {
	
}
</style>

</head>
<body class="tm-gray-bg">
<%ArrayList<Rest> restResult = (ArrayList<Rest>)request.getAttribute("Result");
String city=request.getAttribute("city").toString();
%>
	<!-- Header -->
	<div class="tm-header">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-4 col-sm-3 tm-site-name-container">
					<img id="icon"
						src="logo.jpg" />
				</div>
				<div class="col-lg-4 col-md-8 col-sm-9">
					<div class="mobile-menu-icon">
						<i class="fa fa-bars"></i>
					</div>
					<nav class="tm-nav">
						<ul>
							<li><a href="index2.jsp">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="contactUs.jsp">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>


	<br>
	<br>
	
	

	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">

				<div class="tab-content">

					<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
						<div class="tm-search-box effect2">

							<fieldset>
								<br>
								<br>
								<div class="form-group">
									<h1><center>Places To Visit at <%=city%></center>
										
								</div>

							</fieldset>

							<fieldset style="width: 100%;">

								<div id="clickhotel">
									<ul>
										<li id="h_yellow_tab">&nbsp;</li>
									</ul>
								</div>

							</fieldset>

						</div>
					</div>
				</div>
			</div>
		</div>
	<br>
	<br>
	
<section class="container tm-home-section-2" id="more" style="position: relative;left: -15px;">
	
	<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
	<div class="tm-search-box effect2">
		<div class="row">
			<fieldset style="position: relative;">
				<div class="form-group">
					<div id="fttbl">
					<table id="disptbl" style="text-align:center;">
						<tr>
							<td style="width: 33.3333%;"><h3>Name</h3></td>							
							<td style="width: 33.3333%;"><h3>Address</h3></td>
							<td style="width: 33.3333%;"><h3>Type</h3></td>		
						</tr>
					
					</table>
					
					</div>
				</div>
			</fieldset>
		</div>
	</div>		
	
	</section>
	<br>
	</section>
<%
			if(restResult.size() != 0){
			for(Rest r:restResult){
			%>
	<section class="container tm-home-section-2" id="more">
	
	<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
	<div class="tm-search-box effect2">
		<div class="row">
			<fieldset style="position: relative;">
				<div class="form-group">
					<div id="fttbl">
					<table id="disptbl" style="text-align:center;">
					
						<tr>
							<td style="width: 33.3333%;"><%=r.getName() %></td>							
							<td style="width: 33.3333%;"><%=r.getVicinity() %></td>
							<td style="width: 33.3333%;"><img src="<%=r.getIcon() %>"></td>		
						</tr>
					
					</table>
					
					</div>
				</div>
			</fieldset>
		</div>
	</div>		
	
	</section>
	<br>
	<%
	}
	 }
	%>

	<footer class="tm-black-bg" id="footcontainerbg">
		<div class="container" id="footcontainer">
			<div class="row">
				<p class="tm-copyright-text" id="foottext">
					Copyright &copy; easy go | Designed by <a rel="nofollow"
						href="about.html" target="_parent">Easy go</a>
				</p>
			</div>
		</div>
	</footer>

</body>
</html>