<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.Flightinfo"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
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
<script language="javascript"> 

	function toggle(i) {
		var ele1 = document.getElementById(i);
		if (ele1.style.display == "block") {
			ele1.style.display = "none";
		} 
		else {
			ele1.style.display = "block";
		}
	}
	</script>
</head>
<body class="tm-gray-bg">
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

							<fieldset >
							<br>
							<br>
								<div class="form-group">
								<center><h1>Departure Details:&nbsp;&nbsp;&nbsp;&nbsp;</h1></center>
									<table align="center">
										<tr>
											<td colspan="3" height="100"><h3><%=request.getAttribute("dcity")%>&nbsp;&nbsp;&nbsp;&nbsp;</h3></td>
											<td colspan="3" height="100"><h3>to&nbsp;&nbsp;&nbsp;&nbsp;</h3></td>
											<td colspan="3" height="100"><h3><%=request.getAttribute("acity")%>&nbsp;&nbsp;&nbsp;&nbsp;</h3></td>
											<td colspan="3" height="100"><h3>on&nbsp;&nbsp;&nbsp;&nbsp;</h3></td>
											<td colspan="3" height="100"><h3><%=request.getAttribute("date")%></h3></td>	 
										</tr>
									</table>
								</div>
								
							</fieldset>

							<fieldset style="width: 100%;">
							
							<div id="click">
								<ul>
									<a href="/ba11234567890/xyz?acity=<%=request.getAttribute("acity")%>&action=findres">
									<li>Find Restaurants</li></a>
									<a href="/ba11234567890/xyz?acity=<%=request.getAttribute("acity")%>&action=findhotel">
									<li>Find Hotels</li></a>
									<a href="/ba11234567890/xyz?acity=<%=request.getAttribute("acity")%>&action=placestovisit">
									<li >Places to Visit</li></a>
									<a href="/ba11234567890/xyz?acity=<%=request.getAttribute("acity")%>&action=weather">
									<li >Weather</li></a>
									
								</ul>
								</div>
							
							</fieldset>
								
						</div>
					</div>
				</div>
			</div>
		</div>
		
</section>
<% 
ArrayList<Flightinfo> temp=(ArrayList<Flightinfo>)request.getAttribute("temp");
if(temp!=null)
{
	int i=0;
	for(Flightinfo f:temp)
	{
%>
<section class="container tm-home-section-2" id="more">
	<div role="tabpanel" class="tab-pane fade in active tm-white-bg">
	<div class="tm-search-box effect2">
		<div class="row">
			<a href="javascript:toggle(<%=i%>);">
			<fieldset style="position: relative;">
				<div class="form-group">
					<div id="fttbl">
					<table id="disptbl" width="100%"
						style="margin: auto; text-align: center; ">
						<tr>
							<td><h3><%=f.getDepartureAirport()%></h3><br><h3><%=f.getScheduledDepartureDateTime().substring(f.getScheduledDepartureDateTime().indexOf('T')+1,f.getScheduledDepartureDateTime().length())%></h3><br><h4>(HH:MM:SS)</h4></td>
							<td><img src="flight1.png"/></td>
							<td><h3><%=f.getArrivalAirport()%></h3><br><h3><%=f.getScheduledArrivalDateTime().substring(f.getScheduledArrivalDateTime().indexOf('T')+1,f.getScheduledArrivalDateTime().length())%></h3><br><h4>(HH:MM:SS)</h4></td>
						</tr>
						</table>
						<div id="<%=i%>" style="display: none">
						<table id="disptb2" width="60%"
						style="margin: auto; text-align: left; ">
						<tr>
						<td></td>
						<td><h5>Flight Number: <%=f.getFlightNumber()%></h5></td>
						<td></td>
						</tr>
						<tr>
						<td><h5>Departure Status: <%=f.getDepartureStatus()%></h5></td>
						<td></td>
						<td><h5>Arrival Status: <%=f.getArrivalStatus()%></h5></td>
						</tr>
						<tr>
						<td><h5>Departure Terminal: <%=f.getDepartureTerminal()%></h5></td>
						<td></td>
						<td><h5>Arrival Terminal: <%=f.getArrivalTerminal()%></h5></td>
						</tr>
						<tr>
						<td><h5>Operating Carrier Code: <%=f.getOperatingCarrierCode()%></h5></td>
						<td></td>
						<td><h5>Aircraft Type Code <%=f.getAircraftTypeCode()%></h5></td>
						</tr>
						</table>
						</div>
					</div>
				</div>
			</fieldset></a>
		</div>
	</div>		
	</section>
	<br>
<%
i++;
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