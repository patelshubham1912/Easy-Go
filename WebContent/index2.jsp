<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.util.*,com.xyz,com.bainfo"%>
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
<link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
<script src="http://www.google.com/jsapi"></script>
<script>
	google.load("jquery", "1");
</script>
<script language="javascript"> 

	function toggle1() {

		var ele1 = document.getElementById("flight");
		var ele2 = document.getElementById("hotel");
		var ele3 = document.getElementById("car");
		var ele4 = document.getElementById("restaurant");
			ele2.style.display = "none";
			ele3.style.display = "none";
			ele4.style.display = "none";
			ele1.style.display = "block";
		}
	

	function toggle2() {

		var ele1 = document.getElementById("flight");
		var ele2 = document.getElementById("hotel");
		var ele3 = document.getElementById("car");
		var ele4 = document.getElementById("restaurant");
			ele1.style.display = "none";
			ele3.style.display = "none";
			ele4.style.display = "none";
			ele2.style.display = "block";
		}
	

	function toggle3() {

		var ele1 = document.getElementById("flight");
		var ele2 = document.getElementById("hotel");
		var ele3 = document.getElementById("car");
		var ele4 = document.getElementById("restaurant");
			ele1.style.display = "none";
			ele2.style.display = "none";
			ele4.style.display = "none";
			ele3.style.display = "block";
		}
	

	function toggle4() {

		var ele1 = document.getElementById("flight");
		var ele2 = document.getElementById("hotel");
		var ele3 = document.getElementById("car");
		var ele4 = document.getElementById("restaurant");
			ele1.style.display = "none";
			ele2.style.display = "none";
			ele3.style.display = "none";
			ele4.style.display = "block";
		}
	//validation for Search Flights
	function validate1(checkcity)
	{
		if(checkdcity(checkcity)&checkacity(checkcity)&dcity()&acity()&date())
			return true;
		else
		{
			if(checkdcity(checkcity)&dcity())
			{
				document.getElementById("divdcity").innerHTML="";
			}
			if(checkacity(checkcity)&acity())
			{
				document.getElementById("divacity").innerHTML="";
			}
			
		}
			return false;
		
	}
	function checkdcity(checkcity)
	{
		var x=document.getElementById("dcity").value;
		var test=checkcity.split(',');
		for(var i = 0; i < test.length; i++) {
			var sub=x.substring(0,x.indexOf('('));
            if(sub==test[i])
            	{
            	
            		return true;
            	}
       }
		document.getElementById("divdcity").innerHTML="Enter valid Departure City";
		return false;
	}
	function checkacity(checkcity)
	{
		var x=document.getElementById("acity").value;
		var test=checkcity.split(',');
		for(var i = 0; i < test.length; i++) {
			var sub=x.substring(0,x.indexOf('('));
            if(sub==test[i])
            	{
            
            		return true;
            	}
       }
		document.getElementById("divacity").innerHTML="Enter valid Arrival City";
		return false;
	}
	function dcity()
	{
		var x1=document.getElementById("dcity").value;
		if(x1=="")
		{
			document.getElementById("divdcity").innerHTML="Enter Departure City";
			return false;
		}
		else
			return true;
			
	}
	function acity()
	{
		var x2=document.getElementById("acity").value;
		if(x2=="")
		{
			document.getElementById("divacity").innerHTML="Enter Arrival City";
			return false;
		}
		else
			return true;
	}
	function date()
	{
		var x3=document.getElementById("date").value;
		if(x3=="")
		{
			document.getElementById("divdate").innerHTML="Enter Date";
			return false;
		}
		else
			return true;
	}
	
	function validate2(checkcity)
	{
		if(checkhcity(checkcity)&hcity())
			return true;
		else
			return false;
		
	}
	
	function validate3(checkcity)
	{
		if(checkccity(checkcity)&ccity())
			return true;
		else
			return false;
		
	}
	
	function validate4(checkcity)
	{
		if(checkrcity(checkcity)&rcity())
			return true;
		else
			return false;
		
	}
	function hcity()
	{
		var x=document.getElementById("hcity").value;
		if(x=="")
		{
			document.getElementById("divhcity").innerHTML="Enter City";
			return false;
		}
		else
			return true;
	}
	function checkhcity(checkcity)
	{
		var x=document.getElementById("hcity").value;
		var test=checkcity.split(',');
		for(var i = 0; i < test.length; i++) {
			var sub=x.substring(0,x.indexOf('('));
            if(sub==test[i])
            	{
            		
            		return true;
            	}
       }
		document.getElementById("divhcity").innerHTML="Enter valid City";
		return false;
	}
	function ccity()
	{
		var x=document.getElementById("ccity").value;
		if(x=="")
		{
			document.getElementById("divccity").innerHTML="Enter City";
			return false;
		}
		else
			return true;
	}
	function checkccity(checkcity)
	{
		var x=document.getElementById("ccity").value;
		var test=checkcity.split(',');
		for(var i = 0; i < test.length; i++) {
			var sub=x.substring(0,x.indexOf('('));
            if(sub==test[i])
            	{
            	
            		return true;
            	}
       }
		document.getElementById("divccity").innerHTML="Enter valid City";
		return false;
	}
	function rcity()
	{
		var x=document.getElementById("rcity").value;
		if(x=="")
		{
			document.getElementById("divrcity").innerHTML="Enter City";
			return false;
		}
		else
			return true;
	}
	function checkrcity(checkcity)
	{
		var x=document.getElementById("rcity").value;
		var test=checkcity.split(',');
		for(var i = 0; i < test.length; i++) {
			var sub=x.substring(0,x.indexOf('('));
            if(sub==test[i])
            	{
            		return true;
            	}
       }
		document.getElementById("divrcity").innerHTML="Enter valid City";
		return false;
	}
</script>
<script>

$(document).ready(function(){
	$("li.tab").click(function(){
		$(this).addClass("active").siblings().removeClass("active");
	});
});

</script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/templatemo-script.js"></script>

<script type="text/javascript" src="js/bootstrap.min.js"></script>

<script type="text/javascript" src="js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>


<script src="js/jquery.autocomplete.js"></script>
<style>
input {
	font-size: 120%;
}
</style>
</head>
<body class="tm-gray-bg">
<%
xyz x=new xyz();
ArrayList<bainfo> ba=new ArrayList<bainfo>();
ba=x.getData(request, response);
String checkcity="";
for(bainfo b:ba)
{
	checkcity+=b.getCityname()+",";
}
String checkcity1=checkcity.substring(0,checkcity.length()-1);
%>

	<!-- <form>
		<h3>Flight</h3>
		Departure City:<input type="text" id="dcity" name="dcity" /><br>
		Arrival City:<input type="text" id="acity" name="acity" /> Date:<input
			type="text" id="date" name="date" />
		<script>
		$("#dcity").autocomplete("getDummy.jsp");
		$("#acity").autocomplete("getDummy.jsp");
	</script>
		<input type="submit" value="Find" /> <input type="hidden"
			name="action" value="auto" />
	</form> -->

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
							<li><a href="index2.jsp" class="active">Home</a></li>
							<li><a href="about.html">About</a></li>
							<li><a href="contactUs.jsp">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</div>
	<div>

		<img src="banner1.jpg" alt="Image" id="banner1" />

	</div>

	<section class="container tm-home-section-1" id="more">
		<div class="row">
			<div class="col-lg-12 col-md-12 col-sm-12">
				<div class="tm-home-box-1">

					<!-- form box -->

					<ul class="nav nav-tabs tm-white-bg" role="tablist"
						id="hotelCarTabs">
						<!-- flight hotel car tabs -->


						<li role="presentation" class="tab active" ><a href="javascript:toggle1();"
							aria-controls="flight" role="tab" data-toggle="tab">Flight</a></li>

						<li role="presentation" class="tab"><a href="javascript:toggle2();"
							aria-controls="hotel" role="tab" data-toggle="tab">Hotel</a></li>

						<li role="presentation"  class="tab"><a href="javascript:toggle3();" aria-controls="car"
							role="tab" data-toggle="tab">Travel Agents</a></li>

						<li role="presentation"  class="tab"><a href="javascript:toggle4();"
							aria-controls="restaurants" role="tab" data-toggle="tab">Restaurants</a></li>

					</ul>


					<div class="tab-content">
						<div role="tabpanel" class="tab-pane fade in active tm-white-bg"
							id="flight" style="display: block">
							<div class="tm-search-box effect2">
								<form action="xyz" method="get" class="hotel-search-form" onsubmit="return validate1('<%=checkcity1%>')">
									<!--effect is margin bottom -->

									<div class="tm-form-inner">
										<div class="form-group">
											<div>
												<input type="text" class="form-control"
													placeholder="Departure-city"  id="dcity" name="dcity"/>
												<script>
													$("#dcity").autocomplete(
															"getdata.jsp");
												</script>
												<div id="divdcity" style="color: red"></div>
											</div>
										</div>

										<div class="form-group">
											<div>
												<input type="text" class="form-control"
													placeholder="Arrival-city" id="acity" name="acity"/>
												<script>
													$("#acity").autocomplete(
															"getdata.jsp");
												</script>
												<div id="divacity" style="color: red"></div>
											</div>
										</div>

										<div class="form-group">
												<input type="date" class="form-control" id="date" name="date"/>
										
											<div id="divdate" style="color: red"></div>
	
										</div>
									</div>
									<div class="form-group tm-yellow-gradient-bg text-center">
										<input type="hidden" name="action" value="auto"/>
										<input type="submit" value="Search Flights" class="tm-yellow-btn value=Check Now ">
									</div>
								</form>
							</div>
						</div>




						<div role="tabpanel" class="tab-pane fade in active tm-white-bg"
							id="hotel"  style="display: none">
							<div class="tm-search-box effect2">
								<form action="xyz" method="get" class="hotel-search-form" onsubmit="return validate2('<%=checkcity1%>')">
									<!--effect is margin bottom -->

									<div class="tm-form-inner">
										<div class="form-group">
											<div>
												<input type="text" class="form-control"
													placeholder="Enter city" name="hcity" id="hcity" />
												<script>
													$("#hcity").autocomplete(
															"getdata.jsp");
												</script>
												<div id="divhcity" style="color: red"></div>
											</div>
										</div>

										<div class="form-group">
											<div>
												<br>
												<br>
											</div>
										</div>
									</div>
									<div class="form-group tm-yellow-gradient-bg text-center">
										<input type="hidden" name="action" value="auto2"/>
										<input type="submit" value="Search Hotels" class="tm-yellow-btn value=Check Now ">
									</div>
								</form>
							</div>
						</div>





						<div role="tabpanel" class="tab-pane fade in active tm-white-bg"
							id="car"  style="display: none">
							<div class="tm-search-box effect2">
								<form action="xyz" method="get" class="hotel-search-form" onsubmit="return validate3('<%=checkcity1%>')">
									<!--effect is margin bottom -->

									<div class="tm-form-inner">
										<div class="form-group">
											<div>
												<input type="text" class="form-control"
													placeholder="Enter city" name="ccity" id="ccity" />
												<script>
													$("#ccity").autocomplete(
															"getdata.jsp");
												</script>
												<div id="divccity" style="color: red"></div>
											</div>
										</div>

										<div class="form-group">
											<div>
												<br>
												<br>
											</div>
										</div>
									</div>
									<div class="form-group tm-yellow-gradient-bg text-center">
										<input type="hidden" name="action" value="auto3"/>
										<input type="submit" value="Search Travel Agents"class="tm-yellow-btn value=Check Now ">
									</div>
								</form>
							</div>
						</div>






						<div role="tabpanel" class="tab-pane fade in active tm-white-bg"
							id="restaurant"  style="display: none">
							<div class="tm-search-box effect2">
								<form action="xyz" method="get" class="hotel-search-form" onsubmit="return validate4('<%=checkcity1%>')">
									<!--effect is margin bottom -->

									<div class="tm-form-inner">
										<div class="form-group">
											<div>
												<input type="text" class="form-control"
													placeholder="Enter city" name="rcity" id="rcity" />
												<script>
													$("#rcity").autocomplete(
															"getdata.jsp");
												</script>
												<div id="divrcity" style="color: red"></div>
											</div>
										</div>

										<div class="form-group">
											<div>
												<br>
												<br>
											</div>
										</div>
									</div>
									<div class="form-group tm-yellow-gradient-bg text-center">
										<input type="hidden" name="action" value="auto4"/>
										<input type="submit" value="Search Restaurants" class="tm-yellow-btn value=Check Now ">
									</div>
								</form>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</section>
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