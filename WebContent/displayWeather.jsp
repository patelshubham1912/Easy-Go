<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Holiday - templatemo</title>

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

<script language="javascript"> 

	function toggle1() {

		var ele1 = document.getElementById("weather_forecast");
		var ele2 = document.getElementById("weather_current");
		

		if (ele1.style.display == "block") {
			ele1.style.display = "block";
		} 
		else {

			ele2.style.display = "none";
			ele1.style.display = "block";
		}
	}

	function toggle2() {

		var ele1 = document.getElementById("weather_forecast");
		var ele2 = document.getElementById("weather_current");

		if (ele2.style.display == "block") {
			ele2.style.display = "block";
		} 
		else {
			ele1.style.display = "none";
			ele2.style.display = "block";
		}
	}
</script>

</head>
<body class="tm-gray-bg">
<% Weather weather = (Weather)request.getAttribute("weatherResult");
		ArrayList<Forcast> forcastResult = (ArrayList<Forcast>)request.getAttribute("forcastResult");
		String dcity=request.getAttribute("destination").toString();
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
							<br><br>
								<div class="form-group">
									<h3><center>Weather Details of <%=dcity%></center></h3>
								</div>

							</fieldset>

							<fieldset style="width: 100%;">

								<div id="click_weather">
									<ul>
										<a href="javascript:toggle1();"><li>Weather Forecast</li></a>

										<a href="javascript:toggle2();"><li id="fh">Current Weather</li></a>
										
									</ul>
								</div>

							</fieldset>

						</div>
					</div>
				</div>
			</div>
		</div>

	</section>

	<div id="weather_forecast" style="display: block">
		<section class="container tm-home-section-2" id="more">
			<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
				<div class="tm-search-box effect2">
					<div class="row">
						<fieldset style="position: relative;">
							<div class="form-group">
								<div id="fttbl">
									<table id="disptbl" style="font-size:12px;">

										<tr style="font-weight: bold;">
											<td>Date<br>(YY-MM-DD)</td>
											<td>Temperature(C)</td>
											<td>Humidity(%)</td>
											<td>Cloud cover(%)</td>
											<td>Chance Of Rain(%)</td>
											<td>Chance Of Snow(%)</td>
											<td colspan="2">Weather Overview</td>
								
										</tr>
										<%for(Forcast f:forcastResult) {%>
										<tr><td><%=f.getDate() %></td><td><%=f.getTempC() %></td><td><%=f.getHumidity() %></td>
										<td><%=f.getCloudcover() %></td><td><%=f.getChanceofrain() %></td><td><%=f.getChanceofsnow() %></td>
										<td><%=f.getWeatherDesc() %></td><td><img src="<%=f.getWeatherIconUrl() %>"></td></tr>
									<%} %>

									</table>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
		</section>
	</div>


	<div id="weather_current" style="display: none">
		<section class="container tm-home-section-2" id="more">
			<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
				<div class="tm-search-box effect2">
					<div class="row">
						<fieldset style="position: relative;">
							<div class="form-group">
								<div id="fttbl">
									<table id="disptbl" style="font-size:12px;">

										<tr style="font-weight: bold;">
											<td>Observation</td>
											<td>Temperature(C)</td>
											<td>Temperature(F)</td>
											<td>Humidity(%)</td>
											<td>Cloud cover(%)</td>
											<td>Wind Speed(%)</td>
											<td colspan="2">Weather Overview</td>
											
										</tr>
										<tr>
											<td><%=weather.getObservation_time() %></td><td><%=weather.getTemp_C() %></td><td><%=weather.getTemp_F() %></td>
										<td><%=weather.getHumidity() %></td><td><%=weather.getCloudcover() %></td><td><%=weather.getWindspeedKmph() %></td>
										<td><%=weather.getWeatherDesc() %></td><td><img src="<%=weather.getWeatherIconUrl() %>"></td>
										</tr>

									</table>
								</div>
							</div>
						</fieldset>
					</div>
				</div>
		</section>
		<br><br><br><br><br><br><br><br><br><br>
	</div>

<br><br><br><br><br><br><br><br>



	<footer class="tm-black-bg" id="footcontainerbg">
		
			<div class="row">
				<p class="tm-copyright-text" id="foottext">
					Copyright &copy; easy go | Designed by <a rel="nofollow"
						href="about.html" target="_parent">Easy go</a>
				</p>
			</div>
		
	</footer>

</body>

</html>