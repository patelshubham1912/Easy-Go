<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*, com.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en" xmlns:mso="urn:schemas-microsoft-com:office:office" xmlns:msdt="uuid:C2F41010-65B3-11d1-A29F-00AA00C14882">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Easy Go</title>

<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'
	rel='stylesheet' type='text/css'>
<link href="css/font-awesome.min.css" rel="stylesheet">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">
<link href="css/flexslider.css" rel="stylesheet">
<link href="css/templatemo-style.css" rel="stylesheet">

</head>
<body class="tm-gray-bg">
	<% Weather weather = (Weather)request.getAttribute("weatherResult");
		ArrayList<Forcast> forcastResult = (ArrayList<Forcast>)request.getAttribute("forcastResult");%>
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
							<li><a href="index2.jsp" >Home</a></li>
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
								<div class="form-group">
									<table>
										<tr>
											<td colspan="3" height="100">&nbsp;<font face="sans-serif"> WEATHER REPORT AT:<%=request.getAttribute("destination").toString() %></font></td>
										</tr>

									</table>
								</div>
							</fieldset>

							
						</div>
					</div>
				</div>
			</div>
		</div>



	</section>

<br><br>
	<section class="container tm-home-section-2" id="more">

	




			<fieldset><center>
						<br>		
							
									<div style="display:block; height:480px; width:80%; background-color:white; float: center; box-shadow: 0 10px 15px #656565;">
									<br>
									<table>
									<tr><td colspan="8" ALIGN="center"><font face="sans-serif">CURRENT WEATHER</font></td></tr>
									<tr><td>Observation time</td><td>Temperature in Celsius</td><td>Temperature in fahrenheit</td>
										<td>Humidity</td><td>Cloud cover</td><td>Wind Speed(kmph)</td>
										<td colspan="2" align="center">Overview</td></tr>
									<tr><td><%=weather.getObservation_time() %></td><td><%=weather.getTemp_C() %></td><td><%=weather.getTemp_F() %></td>
										<td><%=weather.getHumidity() %></td><td><%=weather.getCloudcover() %></td><td><%=weather.getWindspeedKmph() %></td>
										<td><%=weather.getWeatherDesc() %></td><td><img src="<%=weather.getWeatherIconUrl() %>"></td></tr>
									</table><br><br>
									<table>
									<tr><td colspan="8" ALIGN="center"><font face="sans-serif">WEATHER FORCAST</font></td></tr>
									<tr><td>Date</td><td>Temperature in Celsius</td><td>Temperature in fahrenheit</td>
										<td>Humidity</td><td>Cloud cover</td><td>Chance of Fog</td><td>Chance of Rain</td>
										<td>Chance of Snow</td><td>Overview</td><td></td></tr>
									<%for(Forcast f:forcastResult) {%>
										<tr><td><%=f.getDate() %></td><td><%=f.getTempC() %></td><td><%=f.getTempF() %></td><td><%=f.getHumidity() %></td>
										<td><%=f.getCloudcover() %></td><td><%=f.getChanceoffog() %></td><td><%=f.getChanceofrain() %></td><td><%=f.getChanceofsnow() %></td>
										<td><%=f.getWeatherDesc() %></td><td><img src="<%=f.getWeatherIconUrl() %>"></td></tr>
									<%} %>
									</table>
									</div>
							
								
								</center>
			</fieldset>
	</section>



<br>
	<footer class="tm-black-bg">
		<div class="container">
			<div class="row">
				<p class="tm-copyright-text">
					Copyright &copy; easy go | Designed by <a rel="nofollow"
						href="about.html" target="_parent">Easy go</a>
				</p>
			</div>
		</div>
	</footer>

</body>
</html>