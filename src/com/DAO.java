package com;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DAO {
	
	private String driver = "oracle.jdbc.driver.OracleDriver";
	private String url = "jdbc:oracle:thin:@intvmoradb02:1521:ORAJAVADB";
	private String username = "PJ01DEV_TJA170";
	private String pwd = "tcstvm";

	private Connection con = null;
	
	public String addMsg(Contact contact) throws SQLException, ClassNotFoundException{
		PreparedStatement ps = null;
		int i=0;
		String resultString = "";
		try{
			Class.forName(driver);
			con = DriverManager.getConnection(url, username, pwd);
			ps = con.prepareStatement("INSERT INTO CONTACTUS_EASYGO VALUES(?,?,?,?)");
			ps.setString(1, contact.getName());
			ps.setString(2,contact.getEmail());
			ps.setString(3,contact.getSubject());
			ps.setString(4,contact.getMessage());
			
			i=ps.executeUpdate();
				
		}finally{
			if(ps!=null)
				ps.close();
			
			if(con!=null)
				con.close();
		}
		if(i==0){
			resultString="Sorry,your query has not been registered.";	
		}
		else if(i==1){
			resultString="Your query has been successfully registered. Thank you.";
		}
		return resultString;
	}

}
