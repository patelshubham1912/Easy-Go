package com;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONTokener;

import com.sun.org.apache.xml.internal.security.utils.Base64;

/**
 * Servlet implementation class xyz
 */
public class xyz extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public xyz() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action=request.getParameter("action");
		if(action.equals("auto"))
		{
		String dcity1="",acity1="",date="";
			String dcity=request.getParameter("dcity");
			dcity1=dcity.substring(dcity.indexOf('(')+1,dcity.length()-1);
			String acity=request.getParameter("acity");
			acity1=acity.substring(acity.indexOf('(')+1,acity.length()-1);
			date=request.getParameter("date");
			System.out.println(date);
		
		String fres=fRes(dcity1,acity1,date,request,response);
		String bares=baRes(request,response);
		System.out.println(fres);
		System.out.println(bares);
		System.out.println(fres);
		ArrayList<bainfo> temp1=new ArrayList<bainfo>();
		try {
			temp1=baparse(bares,request,response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		for(bainfo b:temp1)
		{
			System.out.println(b.getCityname());
		}
		System.out.println(temp1.size());
		
		ArrayList<Flightinfo> temp = new ArrayList<Flightinfo>();
		try {
			temp=fparse(fres,request,response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("temp", temp);
		request.setAttribute("acity", acity);
		request.setAttribute("dcity", dcity);
		request.setAttribute("date", date);
		RequestDispatcher rd= request.getRequestDispatcher("flightDisp.jsp");
		rd.forward(request, response);
		}
		else if(action.equals("auto2"))
		{
			String hcity=request.getParameter("hcity");
			String hcity1=hcity.substring(0,hcity.indexOf('('));
			request.setAttribute("hcity",hcity1);
			RequestDispatcher rd= request.getRequestDispatcher("hotelDisp.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("auto3"))
		{
			String ccity=request.getParameter("ccity");
			String ccity1=ccity.substring(0,ccity.indexOf('('));
			request.setAttribute("ccity",ccity1);
			RequestDispatcher rd= request.getRequestDispatcher("carDisp.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("auto4"))
		{
			String rcity=request.getParameter("rcity");
			String rcity1=rcity.substring(0,rcity.indexOf('('));
			request.setAttribute("rcity",rcity1);
			RequestDispatcher rd= request.getRequestDispatcher("restaurantDisp.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("findhotel"))
		{
			String acity=request.getParameter("acity");
			String acity1=acity.substring(0,acity.indexOf('('));
			request.setAttribute("acity",acity1);
			String bares=baRes(request,response);
			ArrayList<bainfo> temp=new ArrayList<bainfo>();
			try {
				temp=baparse(bares,request,response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double latitude=0.0;
			double longitude=0.0;
			for(bainfo b:temp)
			{
				if(b.getCityname().equals(acity1))
				{
					latitude=b.getLatitude();
					longitude=b.getLongitude();
				}
			}
			System.out.println(latitude+","+longitude);
			String hotelResponse = hotelResponse(latitude,longitude,request, response);
			ArrayList<Rest> hotelResult=new ArrayList<Rest>();
			try {
				hotelResult = hotelParse(hotelResponse,request,response);
				//System.out.println(restResult);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("Result", hotelResult);
			request.setAttribute("city",acity1);
			RequestDispatcher rd = request.getRequestDispatcher("displayHotel.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("findres"))
		{
			String acity=request.getParameter("acity");
			String acity1=acity.substring(0,acity.indexOf('('));
			request.setAttribute("acity",acity1);
			String bares=baRes(request,response);
			ArrayList<bainfo> temp=new ArrayList<bainfo>();
			try {
				temp=baparse(bares,request,response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double latitude=0.0;
			double longitude=0.0;
			for(bainfo b:temp)
			{
				if(b.getCityname().equals(acity1))
				{
					latitude=b.getLatitude();
					longitude=b.getLongitude();
				}
			}
			System.out.println(latitude+","+longitude);
			String restResponse = restResponse(latitude,longitude,request, response);
			ArrayList<Rest> restResult=new ArrayList<Rest>();
			try {
				restResult = restParse(restResponse,request,response);
				//System.out.println(restResult);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("Result", restResult);
			request.setAttribute("city",acity1);
			RequestDispatcher rd = request.getRequestDispatcher("displayRestaurant.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("placestovisit"))
		{
			String acity=request.getParameter("acity");
			String acity1=acity.substring(0,acity.indexOf('('));
			request.setAttribute("acity",acity1);
			String bares=baRes(request,response);
			ArrayList<bainfo> temp=new ArrayList<bainfo>();
			try {
				temp=baparse(bares,request,response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double latitude=0.0;
			double longitude=0.0;
			for(bainfo b:temp)
			{
				if(b.getCityname().equals(acity1))
				{
					latitude=b.getLatitude();
					longitude=b.getLongitude();
				}
			}
			System.out.println(latitude+","+longitude);
			String restResponse = ptvResponse(latitude,longitude,request, response);
			ArrayList<Rest> ptvResult=new ArrayList<Rest>();
			try {
				ptvResult = ptvParse(restResponse,request,response);
				//System.out.println(restResult);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("Result", ptvResult);
			request.setAttribute("city",acity1);
			RequestDispatcher rd = request.getRequestDispatcher("displayPlacestovisit.jsp");
			rd.forward(request, response);
		}
		else if(action.equals("weather"))
		{
			String acity=request.getParameter("acity");
			String acity1=acity.substring(0,acity.indexOf('('));
			request.setAttribute("acity",acity1);
			
			String bares=baRes(request,response);
			ArrayList<bainfo> temp1=new ArrayList<bainfo>();
			try {
				temp1=baparse(bares,request,response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			double latitude=0.0;
			double longitude=0.0;
			for(bainfo b:temp1)
			{
				if(b.getCityname().equals(acity1))
				{
					latitude=b.getLatitude();
					longitude=b.getLongitude();
				}
			}
			
			String weatherResponse = weatherResponse(acity1,latitude,longitude,request, response);
			System.out.println(weatherResponse(acity1,latitude,longitude,request, response));
			ArrayList<Forcast> temp=new ArrayList<Forcast>();
			Weather weather = new Weather();
			try {
				temp = forcastParse(weatherResponse,request,response);
				weather = weatherParse(weatherResponse, request, response);
			} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("forcastResult", temp);
			request.setAttribute("weatherResult", weather);
			request.setAttribute("destination", acity1);
			RequestDispatcher rd = request.getRequestDispatcher("displayWeather.jsp");
			rd.forward(request, response);
		
		}
		else if(action.equals("contactus"))
		{
			String name=request.getParameter("contact_name");
	        String email=request.getParameter("contact_email"); 
	        String subject=request.getParameter("contact_subject");
	        String message=request.getParameter("contact_message");
	        
	        DAO dao=new DAO();
	        Contact contact =new Contact();
	        contact.setName(name);
	        contact.setEmail(email);
	        contact.setMessage(message);
	        contact.setSubject(subject);
	        
	        String msg="";
	        try{
	        	
	        	msg=dao.addMsg(contact);
	        }
	        catch(SQLException e){
	        	e.printStackTrace();
	        }
	        catch(ClassNotFoundException e){
	        	e.printStackTrace();
	        }
	        
	        request.setAttribute("msg", msg);
	        RequestDispatcher rd=request.getRequestDispatcher("dispErr.jsp");
	        rd.forward(request, response);
		}
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	public ArrayList<bainfo> getData(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		
		String bares=baRes(request,response);
		//System.out.println(bares);
		ArrayList<bainfo> temp1=new ArrayList<bainfo>();
		try {
			temp1=baparse(bares,request,response);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp1;
	}
	public static String baRes(HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = null;
		String url = "http://apphonics.tcs.com/public/ba/locations/1.0";
		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			URL object = new URL(url);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			// int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(60 * 1000);
			connection.setConnectTimeout(60 * 1000);
			connection.setRequestProperty("Client-Key", "afptn86747hsbd5jdvzvw9sd");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			// String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
							new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
					jsonResponse=buffer.toString();
					System.out.println(jsonResponse);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return jsonResponse;
		
	}
	
	public static String fRes(String dcity1,String acity1,String date,HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = null;
		String url = "https://api.ba.com/rest-v1/v1/flights;departureLocation="+dcity1+";arrivalLocation="+acity1+";scheduledDepartureDate="+date+".json";
		//String url = "https://api.ba.com/rest-v1/v1/flights;departureLocation=LON;arrivalLocation=NYC;scheduledDepartureDate=2016-09-01.json";
		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			URL object = new URL(url);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			// int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(60 * 1000);
			connection.setConnectTimeout(60 * 1000);
			connection.setRequestProperty("Client-Key", "wja7u3thhu2bvennpkwfra7v");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			// String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
							new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
					jsonResponse=buffer.toString();
					System.out.println(jsonResponse);
			}
			else
			{
				System.out.println("reached");
				String msg="Sorry No flights Available";
				request.setAttribute("msg", msg);
		        RequestDispatcher rd=request.getRequestDispatcher("dispErr.jsp");
		        rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		return jsonResponse;
		
	}
	
	public static String weatherResponse(String city,double latitude,double longitude,HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = null;
		String url1="http://apphonics.tcs.com/public/wwo-weather/v1.0/weather.ashx?q="+latitude+","+longitude+"&format=json&no_of_days=5&key=a9d1ef2c00429bfd8537697dc6564";

		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			
			URL object = new URL(url1);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			//int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(600 * 1000);
			connection.setConnectTimeout(600 * 1000);
			//connection.setRequestProperty("Client-Key", "afptn86747hsbd5jdvzvw9sd");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			//String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
					new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
				jsonResponse=buffer.toString();
					System.out.println(jsonResponse);
				
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return jsonResponse;
	}
	
	
	public ArrayList<bainfo> baparse(String res,HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		ArrayList<bainfo> baarr=new ArrayList<bainfo>();		
		JSONObject obj=new JSONObject(res);
		JSONArray carr = obj.getJSONObject("GetBA_LocationsResponse").getJSONArray("Country");
		for(int i=0;i<carr.length();i++)
		{
			
			String cityname="";
			String citycode="";
			String airportname="";
			String airportcode="";
			double latitude=0.0;
			double longitude=0.0;
			JSONObject city=carr.getJSONObject(i).optJSONObject("City");
			if(city!=null)
			{
				JSONObject airport=carr.getJSONObject(i).getJSONObject("City").optJSONObject("Airport");
				
				if(airport!=null)
				{
					JSONObject ciarr2=carr.getJSONObject(i).getJSONObject("City");
					cityname= ciarr2.getString("CityName");
					citycode= ciarr2.getString("CityCode");
					airportname= ciarr2.getJSONObject("Airport").getString("AirportName");
					airportcode= ciarr2.getJSONObject("Airport").getString("AirportCode");
					latitude= ciarr2.getJSONObject("Airport").getJSONObject("Position").getDouble("Latitude");
					longitude= ciarr2.getJSONObject("Airport").getJSONObject("Position").getDouble("Longitude");
					bainfo baobj=new bainfo();
					baobj.setCityname(cityname);
					baobj.setCitycode(citycode);
					baobj.setAirportname(airportname);
					baobj.setAirportcode(airportcode);
					baobj.setLatitude(latitude);
					baobj.setLongitude(longitude);
					baarr.add(baobj);
					//System.out.println(cityname+" "+citycode+" "+airportname+" "+airportcode+" "+latitude+" "+longitude);
				}
				else
				{
					JSONArray aiarr2=carr.getJSONObject(i).getJSONObject("City").optJSONArray("Airport");
					if(aiarr2!=null)
					{
					for(int k=0;k<aiarr2.length();k++)
					{
						cityname= aiarr2.getJSONObject(i).getString("CityName");
						citycode= aiarr2.getJSONObject(i).getString("CityCode");
						airportname= aiarr2.getJSONObject(k).getJSONObject("Airport").getString("AirportName");
						airportcode= aiarr2.getJSONObject(k).getJSONObject("Airport").getString("AirportCode");
						latitude= aiarr2.getJSONObject(k).getJSONObject("Position").getDouble("Latitude");
						longitude= aiarr2.getJSONObject(k).getJSONObject("Position").getDouble("Longitude");
						bainfo baobj=new bainfo();
						baobj.setCityname(cityname);
						baobj.setCitycode(citycode);
						baobj.setAirportname(airportname);
						baobj.setAirportcode(airportcode);
						baobj.setLatitude(latitude);
						baobj.setLongitude(longitude);
						baarr.add(baobj);
						//System.out.println(cityname+" "+citycode+" "+airportname+" "+airportcode+" "+latitude+" "+longitude);
					}
					}
				}
				
			}
			else
			{
				JSONArray ciarr2 = carr.getJSONObject(i).getJSONArray("City");
				for(int j=0;j<ciarr2.length();j++)
				{
					JSONObject airport=ciarr2.getJSONObject(j).optJSONObject("Airport");
					
					if(airport!=null)
					{
						cityname= ciarr2.getJSONObject(j).getString("CityName");
						citycode= ciarr2.getJSONObject(j).getString("CityCode");
						airportname= airport.getString("AirportName");
						airportcode= airport.getString("AirportCode");
						latitude= airport.getJSONObject("Position").getDouble("Latitude");
						longitude= airport.getJSONObject("Position").getDouble("Longitude");
						bainfo baobj=new bainfo();
						baobj.setCityname(cityname);
						baobj.setCitycode(citycode);
						baobj.setAirportname(airportname);
						baobj.setAirportcode(airportcode);
						baobj.setLatitude(latitude);
						baobj.setLongitude(longitude);
						baarr.add(baobj);
						
						
						//System.out.println(cityname+" "+citycode+" "+airportname+" "+airportcode+" "+latitude+" "+longitude);
					}
					else
					{
						JSONArray aiarr2=ciarr2.getJSONObject(j).optJSONArray("Airport");
						if(aiarr2!=null)
						{
						for(int k=0;k<aiarr2.length();k++)
						{
							cityname= ciarr2.getJSONObject(j).getString("CityName");
							citycode= ciarr2.getJSONObject(j).getString("CityCode");
							airportname= aiarr2.getJSONObject(k).getString("AirportName");
							airportcode= aiarr2.getJSONObject(k).getString("AirportCode");
							latitude= aiarr2.getJSONObject(k).getJSONObject("Position").getDouble("Latitude");
							longitude= aiarr2.getJSONObject(k).getJSONObject("Position").getDouble("Longitude");
							bainfo baobj=new bainfo();
							baobj.setCityname(cityname);
							baobj.setCitycode(citycode);
							baobj.setAirportname(airportname);
							baobj.setAirportcode(airportcode);
							baobj.setLatitude(latitude);
							baobj.setLongitude(longitude);
							baarr.add(baobj);
							//System.out.println(cityname+" "+citycode+" "+airportname+" "+airportcode+" "+latitude+" "+longitude);
						}
						}
					}
					
				}
			}
			
		}
		return baarr;
	}
	public ArrayList<Flightinfo> fparse(String res,HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		
		System.out.println("reached12345");
		System.out.println(res);
		JSONObject obj=new JSONObject(res);
		ArrayList<Flightinfo> temp = new ArrayList<Flightinfo>();
		JSONObject flightopt=obj.getJSONObject("FlightsResponse").optJSONObject("Flight");
		if(flightopt!=null)
		{
			System.out.println("Object");

			JSONObject obj1=obj.getJSONObject("FlightsResponse").getJSONObject("Flight");
			String arr1 = obj1.getString("MarketingCarrierCode");
			String arr2 = obj1.getString("FlightNumber");
			System.out.println(arr1);
			System.out.println(arr2);
			JSONObject sector=obj1.optJSONObject("Sector");
			
			if(sector!=null)
			{
				JSONObject objj = obj1.getJSONObject("Sector");
				String arr3=objj.getString("DepartureStatus");
				String arr4=objj.getString("ArrivalStatus");
				String arr5=objj.getString("DepartureAirport");
				String arr6=objj.getString("ArrivalAirport");
				int arr77=objj.optInt("DepartureTerminal");
				String arr7="";
				if(arr77!=0)
				{
					arr7=objj.getInt("DepartureTerminal")+"";
				}
				else
				{
					//String arr777=objj.optString("DepartureTerminal");
					//if(arr777!=null)
					//	arr7=objj.getString("DepartureTerminal");
				//	else
						arr7="ND";
				}
				int arr88=objj.optInt("ArrivalTerminal");
				String arr8="";
				if(arr88!=0)
				{
					arr8=objj.getInt("ArrivalTerminal")+"";
				}
				else
				{
					//String arr888=objj.optString("ArrivalTerminal");
					//if(arr888!=null)
					//	arr8=objj.getString("ArrivalTerminal");
					//else 
					arr8="ND";
				}
				String arr9=objj.getString("ScheduledDepartureDateTime");
				String arr10=objj.getString("ScheduledArrivalDateTime");
				//String arr11=objj.getString("ReportedDepartureDateTime");
				//String arr12=objj.getString("ReportedArrivalDateTime");
				String arr13=objj.getString("OperatingCarrierCode");
				int arr144=objj.optInt("AircraftTypeCode");
				String arr14="";
				if(arr144!=0)
				{
					arr14=objj.getInt("AircraftTypeCode")+"";
				}
				else
				{
					arr14=objj.getString("AircraftTypeCode");
				}
				boolean arr15=objj.getBoolean("MatchesRequest");
				
				Flightinfo flightinfo= new Flightinfo();
				flightinfo.setMarketingCarrierCode(arr1);
				flightinfo.setFlightNumber(arr2);
				flightinfo.setDepartureStatus(arr3);
				flightinfo.setArrivalStatus(arr4);
				flightinfo.setDepartureAirport(arr5);
				flightinfo.setArrivalAirport(arr6);
				flightinfo.setDepartureTerminal(arr7);
				flightinfo.setArrivalTerminal(arr8);
				flightinfo.setScheduledDepartureDateTime(arr9);
				flightinfo.setScheduledArrivalDateTime(arr10);
				//flightinfo.setReportedDepartureDateTime(arr11);
				//flightinfo.setReportedArrivalDateTime(arr12);
				flightinfo.setOperatingCarrierCode(arr13);
				flightinfo.setAircraftTypeCode(arr14);
				flightinfo.setMatchesRequest(arr15);
				temp.add(flightinfo);
			}
			else
			{
				JSONArray arrr = obj1.getJSONArray("Sector");
				for(int j=0;j<arrr.length();j++)
				{
					String arr3=arrr.getJSONObject(j).getString("DepartureStatus");
					String arr4=arrr.getJSONObject(j).getString("ArrivalStatus");
					String arr5=arrr.getJSONObject(j).getString("DepartureAirport");
					String arr6=arrr.getJSONObject(j).getString("ArrivalAirport");
					int arr77=arrr.getJSONObject(j).optInt("DepartureTerminal");
					String arr7="";
					if(arr77!=0)
					{
						arr7=arrr.getJSONObject(j).getInt("DepartureTerminal")+"";
					}
					else
					{
						//Object arr777=arrr.getJSONObject(j).optJSONObject("DepartureTerminal");
						//if(arr777 instanceof String)
						//	arr7=arrr.getJSONObject(j).getString("DepartureTerminal");
						//else
							arr7="ND";
						
					}
					int arr88=arrr.getJSONObject(j).optInt("ArrivalTerminal");
					
					String arr8="";
					if(arr88!=0)
					{
						arr8=arrr.getJSONObject(j).getInt("ArrivalTerminal")+"";
					}
					else
					{
						//Object arr888=arrr.getJSONObject(j).optJSONObject("ArrivalTerminal");
						//if(arr888 instanceof String)
						//	arr8=arrr.getJSONObject(j).getString("ArrivalTerminal");
						//else
							arr8="ND";
					}
					
					String arr9=arrr.getJSONObject(j).getString("ScheduledDepartureDateTime");
					String arr10=arrr.getJSONObject(j).getString("ScheduledArrivalDateTime");
					//String arr11=arrr.getJSONObject(j).getString("ReportedDepartureDateTime");
					//String arr12=arrr.getJSONObject(j).getString("ReportedArrivalDateTime");
					String arr13=arrr.getJSONObject(j).getString("OperatingCarrierCode");
					int arr144=arrr.getJSONObject(j).optInt("AircraftTypeCode");
					String arr14="";
					if(arr144!=0)
					{
						arr14=arrr.getJSONObject(j).getInt("AircraftTypeCode")+"";
					}
					else
					{
						arr14=arrr.getJSONObject(j).getString("AircraftTypeCode");
					}
					boolean arr15=arrr.getJSONObject(j).getBoolean("MatchesRequest");
					Flightinfo flightinfo= new Flightinfo();
					flightinfo.setMarketingCarrierCode(arr1);
					flightinfo.setFlightNumber(arr2);
					flightinfo.setDepartureStatus(arr3);
					flightinfo.setArrivalStatus(arr4);
					flightinfo.setDepartureAirport(arr5);
					flightinfo.setArrivalAirport(arr6);
					flightinfo.setDepartureTerminal(arr7);
					flightinfo.setArrivalTerminal(arr8);
					flightinfo.setScheduledDepartureDateTime(arr9);
					flightinfo.setScheduledArrivalDateTime(arr10);
					//flightinfo.setReportedDepartureDateTime(arr11);
					//flightinfo.setReportedArrivalDateTime(arr12);
					flightinfo.setOperatingCarrierCode(arr13);
					flightinfo.setAircraftTypeCode(arr14);
					flightinfo.setMatchesRequest(arr15);
					temp.add(flightinfo);
				}
			
			}
		}
			
		else
		{
			System.out.println("Array");
		JSONArray arr = obj.getJSONObject("FlightsResponse").getJSONArray("Flight");
		
		for(int i=0;i<arr.length();i++)
		{
			String arr1 = arr.getJSONObject(i).getString("MarketingCarrierCode");
			String arr2 = arr.getJSONObject(i).getString("FlightNumber");
			System.out.println(arr1);
			System.out.println(arr2);
			JSONObject sector=arr.getJSONObject(i).optJSONObject("Sector");
			
			if(sector!=null)
			{
				
				JSONObject objj = arr.getJSONObject(i).getJSONObject("Sector");
				String arr3=objj.getString("DepartureStatus");
				String arr4=objj.getString("ArrivalStatus");
				String arr5=objj.getString("DepartureAirport");
				String arr6=objj.getString("ArrivalAirport");
				int arr77=objj.optInt("DepartureTerminal");
				String arr7="";
				if(arr77!=0)
				{
					arr7=objj.getInt("DepartureTerminal")+"";
				}
				else
				{
					//String arr777=objj.optString("DepartureTerminal");
					//if(arr777!=null)
					//	arr7=objj.getString("DepartureTerminal");
				//	else
						arr7="ND";
				}
				int arr88=objj.optInt("ArrivalTerminal");
				String arr8="";
				if(arr88!=0)
				{
					arr8=objj.getInt("ArrivalTerminal")+"";
				}
				else
				{
					//String arr888=objj.optString("ArrivalTerminal");
					//if(arr888!=null)
					//	arr8=objj.getString("ArrivalTerminal");
					//else 
					arr8="ND";
				}
				String arr9=objj.getString("ScheduledDepartureDateTime");
				String arr10=objj.getString("ScheduledArrivalDateTime");
				//String arr11=objj.getString("ReportedDepartureDateTime");
				//String arr12=objj.getString("ReportedArrivalDateTime");
				String arr13=objj.getString("OperatingCarrierCode");
				int arr144=objj.optInt("AircraftTypeCode");
				String arr14="";
				if(arr144!=0)
				{
					arr14=objj.getInt("AircraftTypeCode")+"";
				}
				else
				{
					arr14=objj.getString("AircraftTypeCode");
				}
				boolean arr15=objj.getBoolean("MatchesRequest");
				
				Flightinfo flightinfo= new Flightinfo();
				flightinfo.setMarketingCarrierCode(arr1);
				flightinfo.setFlightNumber(arr2);
				flightinfo.setDepartureStatus(arr3);
				flightinfo.setArrivalStatus(arr4);
				flightinfo.setDepartureAirport(arr5);
				flightinfo.setArrivalAirport(arr6);
				flightinfo.setDepartureTerminal(arr7);
				flightinfo.setArrivalTerminal(arr8);
				flightinfo.setScheduledDepartureDateTime(arr9);
				flightinfo.setScheduledArrivalDateTime(arr10);
				//flightinfo.setReportedDepartureDateTime(arr11);
				//flightinfo.setReportedArrivalDateTime(arr12);
				flightinfo.setOperatingCarrierCode(arr13);
				flightinfo.setAircraftTypeCode(arr14);
				flightinfo.setMatchesRequest(arr15);
				temp.add(flightinfo);
			}
			else
			{
				JSONArray arrr = arr.getJSONObject(i).getJSONArray("Sector");
				for(int j=0;j<arrr.length();j++)
				{
					String arr3=arrr.getJSONObject(j).getString("DepartureStatus");
					String arr4=arrr.getJSONObject(j).getString("ArrivalStatus");
					String arr5=arrr.getJSONObject(j).getString("DepartureAirport");
					String arr6=arrr.getJSONObject(j).getString("ArrivalAirport");
					int arr77=arrr.getJSONObject(j).optInt("DepartureTerminal");
					String arr7="";
					if(arr77!=0)
					{
						arr7=arrr.getJSONObject(j).getInt("DepartureTerminal")+"";
					}
					else
					{
						//Object arr777=arrr.getJSONObject(j).optJSONObject("DepartureTerminal");
						//if(arr777 instanceof String)
						//	arr7=arrr.getJSONObject(j).getString("DepartureTerminal");
						//else
							arr7="ND";
						
					}
					int arr88=arrr.getJSONObject(j).optInt("ArrivalTerminal");
					
					String arr8="";
					if(arr88!=0)
					{
						arr8=arrr.getJSONObject(j).getInt("ArrivalTerminal")+"";
					}
					else
					{
						//Object arr888=arrr.getJSONObject(j).optJSONObject("ArrivalTerminal");
						//if(arr888 instanceof String)
						//	arr8=arrr.getJSONObject(j).getString("ArrivalTerminal");
						//else
							arr8="ND";
					}
					
					String arr9=arrr.getJSONObject(j).getString("ScheduledDepartureDateTime");
					String arr10=arrr.getJSONObject(j).getString("ScheduledArrivalDateTime");
					//String arr11=arrr.getJSONObject(j).getString("ReportedDepartureDateTime");
					//String arr12=arrr.getJSONObject(j).getString("ReportedArrivalDateTime");
					String arr13=arrr.getJSONObject(j).getString("OperatingCarrierCode");
					int arr144=arrr.getJSONObject(j).optInt("AircraftTypeCode");
					String arr14="";
					if(arr144!=0)
					{
						arr14=arrr.getJSONObject(j).getInt("AircraftTypeCode")+"";
					}
					else
					{
						arr14=arrr.getJSONObject(j).getString("AircraftTypeCode");
					}
					boolean arr15=arrr.getJSONObject(j).getBoolean("MatchesRequest");
					Flightinfo flightinfo= new Flightinfo();
					flightinfo.setMarketingCarrierCode(arr1);
					flightinfo.setFlightNumber(arr2);
					flightinfo.setDepartureStatus(arr3);
					flightinfo.setArrivalStatus(arr4);
					flightinfo.setDepartureAirport(arr5);
					flightinfo.setArrivalAirport(arr6);
					flightinfo.setDepartureTerminal(arr7);
					flightinfo.setArrivalTerminal(arr8);
					flightinfo.setScheduledDepartureDateTime(arr9);
					flightinfo.setScheduledArrivalDateTime(arr10);
					//flightinfo.setReportedDepartureDateTime(arr11);
					//flightinfo.setReportedArrivalDateTime(arr12);
					flightinfo.setOperatingCarrierCode(arr13);
					flightinfo.setAircraftTypeCode(arr14);
					flightinfo.setMatchesRequest(arr15);
					temp.add(flightinfo);
				}
			
			}
		}
		}
		return temp;
		
	
	}	
	public ArrayList<Forcast> forcastParse(String weatherResponse, HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		
		
		JSONObject data=new JSONObject(weatherResponse);
		JSONArray weather = data.getJSONObject("data").getJSONArray("weather");
		
		ArrayList<Forcast> temp = new ArrayList<Forcast>();
		
		for(int i=0; i<weather.length();i++){
			Forcast forcast=new Forcast();
			JSONArray hourly = weather.getJSONObject(i).getJSONArray("hourly");
			
			forcast.setDate(weather.getJSONObject(i).getString("date"));
					
			
						forcast.setChanceoffog(hourly.getJSONObject(i).getString("chanceoffog"));
						forcast.setChanceofrain(hourly.getJSONObject(i).getString("chanceofrain"));
						forcast.setChanceofsnow(hourly.getJSONObject(i).getString("chanceofsnow"));
						forcast.setCloudcover(hourly.getJSONObject(i).getString("cloudcover"));
						forcast.setHumidity(hourly.getJSONObject(i).getString("humidity"));
						forcast.setTempC(hourly.getJSONObject(i).getString("tempC"));
						forcast.setTempF(hourly.getJSONObject(i).getString("tempF"));
						
							JSONArray weatherDesc = hourly.getJSONObject(i).getJSONArray("weatherDesc");
							forcast.setWeatherDesc(weatherDesc.getJSONObject(i).getString("value"));
						
						
							JSONArray weatherIconUrl = hourly.getJSONObject(i).getJSONArray("weatherIconUrl");
							forcast.setWeatherIconUrl(weatherIconUrl.getJSONObject(i).getString("value"));
						
				temp.add(forcast);
				System.out.println(weather.length());
			}
		
		return temp;
			
	}
	public Weather weatherParse(String weatherResponse, HttpServletRequest request, HttpServletResponse response) throws JSONException{
		JSONObject data=new JSONObject(weatherResponse);
		JSONArray current_condition = data.getJSONObject("data").getJSONArray("current_condition");
		Weather weather = new Weather();
		for(int i=0;i<current_condition.length();i++)
		{	
			weather.setObservation_time(current_condition.getJSONObject(i).getString("observation_time"));
			
			weather.setCloudcover(current_condition.getJSONObject(i).getString("cloudcover"));
			
			weather.setHumidity(current_condition.getJSONObject(i).getString("humidity"));
			
			weather.setTemp_C(current_condition.getJSONObject(i).getString("temp_C"));
			
			weather.setTemp_F(current_condition.getJSONObject(i).getString("temp_F"));
			
			weather.setWindspeedKmph(current_condition.getJSONObject(i).getString("windspeedKmph"));
			
			JSONArray weatherDesc=current_condition.getJSONObject(i).getJSONArray("weatherDesc");
			for(int j=0; j<weatherDesc.length();j++)
			{
				weather.setWeatherDesc(weatherDesc.getJSONObject(j).getString("value"));
				
			}
			JSONArray weatherIconUrl=current_condition.getJSONObject(i).getJSONArray("weatherIconUrl");
			for(int k=0; k<weatherIconUrl.length();k++)
			{
				weather.setWeatherIconUrl(weatherIconUrl.getJSONObject(k).getString("value"));
				
			}

		}
		return weather;
	}
	public static String restResponse(double latitude,double longitude,HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = "";

//		String location = "19.1705611,72.954346";bakery|restaurant|cafe|bar|meal_takeaway
		String url1="http://apphonics.tcs.com/public/google/place/1.0/nearbysearch/json?location="+latitude+","+longitude+"&radius=5000&types=bakery|restaurant|cafe|bar|meal_takeaway&key=AIzaSyDmvosCxAzYcXSSxY5sxVCZ8u-Yjkro9wI";

		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			
			URL object = new URL(url1);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			//int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(600 * 1000);
			connection.setConnectTimeout(600 * 1000);
			connection.setRequestProperty("Authorization", "Bearer 58e2d54aa6b8c7fb4fa8facdd9181b29");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			//String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
					new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
				jsonResponse=buffer.toString();
				//System.out.println(jsonResponse);
				
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return jsonResponse;
		
	}

	
	public ArrayList<Rest> restParse(String restResponse, HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		

		JSONObject data=new JSONObject(restResponse);
		JSONArray results = data.getJSONArray("results");
		
		ArrayList<Rest> restResult = new ArrayList<Rest>();
		
		for(int i=0; i<results.length();i++){
			Rest rest=new Rest();
			rest.setName(results.getJSONObject(i).getString("name"));
			rest.setVicinity(results.getJSONObject(i).getString("vicinity"));
			rest.setIcon(results.getJSONObject(i).getString("icon"));
			System.out.println(rest.getName()+" "+rest.getVicinity()+" "+rest.getIcon());
			restResult.add(rest);
			}
		
		return restResult;
			
	}
	public static String ptvResponse(double latitude,double longitude,HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = "";

//		String location = "19.1705611,72.954346";bakery|restaurant|cafe|bar|meal_takeaway
		String url1="http://apphonics.tcs.com/public/google/place/1.0/nearbysearch/json?location="+latitude+","+longitude+"&radius=20000&types=museum|historic_landmark|zoo|amusement_park&key=AIzaSyDmvosCxAzYcXSSxY5sxVCZ8u-Yjkro9wI";

		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			
			URL object = new URL(url1);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			//int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(600 * 1000);
			connection.setConnectTimeout(600 * 1000);
			connection.setRequestProperty("Authorization", "Bearer 58e2d54aa6b8c7fb4fa8facdd9181b29");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			//String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
					new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
				jsonResponse=buffer.toString();
				//System.out.println(jsonResponse);
				
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return jsonResponse;
		
	}

	
	public ArrayList<Rest> ptvParse(String restResponse, HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		

		JSONObject data=new JSONObject(restResponse);
		JSONArray results = data.getJSONArray("results");
		
		ArrayList<Rest> restResult = new ArrayList<Rest>();
		
		for(int i=0; i<results.length();i++){
			Rest rest=new Rest();
			rest.setName(results.getJSONObject(i).getString("name"));
			rest.setVicinity(results.getJSONObject(i).getString("vicinity"));
			rest.setIcon(results.getJSONObject(i).getString("icon"));
			System.out.println(rest.getName()+" "+rest.getVicinity()+" "+rest.getIcon());
			restResult.add(rest);
			}
		
		return restResult;
			
	}
	
	
	public static String hotelResponse(double latitude,double longitude,HttpServletRequest request, HttpServletResponse response) {
		String jsonResponse = "";

//		String location = "19.1705611,72.954346";bakery|restaurant|cafe|bar|meal_takeaway
		String url1="http://apphonics.tcs.com/public/google/place/1.0/nearbysearch/json?location="+latitude+","+longitude+"&radius=5000&types=lodging&key=AIzaSyDmvosCxAzYcXSSxY5sxVCZ8u-Yjkro9wI";

		try {
			/**************
			 * For getting response from HTTP URL start
			 ***************/
			
			URL object = new URL(url1);

			HttpURLConnection connection = (HttpURLConnection) object.openConnection();
			//int timeOut = connection.getReadTimeout();
			connection.setReadTimeout(600 * 1000);
			connection.setConnectTimeout(600 * 1000);
			connection.setRequestProperty("Authorization", "Bearer 58e2d54aa6b8c7fb4fa8facdd9181b29");
			int responseCode = connection.getResponseCode();
			System.out.println(responseCode);
			//String responseMsg = connection.getResponseMessage();

			if (responseCode == 200) {
				System.out.println("done");
				
					BufferedReader reader = new BufferedReader(
					new InputStreamReader((InputStream) connection.getContent()));
					StringBuffer buffer = new StringBuffer();
					int read;
					char[] chars = new char[1024];
					while ((read = reader.read(chars)) != -1)
						buffer.append(chars, 0, read);
				jsonResponse=buffer.toString();
				//System.out.println(jsonResponse);
				
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
		
		return jsonResponse;
		
	}

	
	public ArrayList<Rest> hotelParse(String restResponse, HttpServletRequest request, HttpServletResponse response) throws JSONException
	{
		

		JSONObject data=new JSONObject(restResponse);
		JSONArray results = data.getJSONArray("results");
		
		ArrayList<Rest> restResult = new ArrayList<Rest>();
		
		for(int i=0; i<results.length();i++){
			Rest rest=new Rest();
			rest.setName(results.getJSONObject(i).getString("name"));
			rest.setVicinity(results.getJSONObject(i).getString("vicinity"));
			rest.setIcon(results.getJSONObject(i).getString("icon"));
			System.out.println(rest.getName()+" "+rest.getVicinity()+" "+rest.getIcon());
			restResult.add(rest);
			}
		
		return restResult;
			
	}
}
