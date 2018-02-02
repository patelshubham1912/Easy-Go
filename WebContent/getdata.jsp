<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="java.util.*"%>
<%@page import="com.xyz"%>
<%@page import="com.bainfo"%>

<% 
		xyz x = new xyz();
		ArrayList<bainfo> temp=new ArrayList<bainfo>();
		temp=x.getData(request,response);
		String query = request.getParameter("q");
		int totalCities;
		List<String> cities=new ArrayList<String>();
		boolean flag=true;
		for(bainfo b:temp)
		{
			for(String c:cities)
			{
				if(c.equals(b.getCityname()+"("+b.getCitycode()+")")){
					flag=false;
				}
			}
			if(flag){
				cities.add(b.getCityname()+"("+b.getCitycode()+")");
				}
			else
			{
				flag=true;
			}
		}
		totalCities = cities.size();
		System.out.println(cities.size());
		String city = null;
		query = query.toLowerCase();
		List<String> matched = new ArrayList<String>();
		for(int i=0; i<totalCities; i++) {
			city = cities.get(i).toLowerCase();
			if(city.startsWith(query)) {
				matched.add(cities.get(i));
			}
		}
		List<String> cities1=matched;
		Iterator<String> iterator = cities1.iterator();
		while(iterator.hasNext()) {
			String city1 = (String)iterator.next();
			out.println(city1);
		}
%>