package com;

import java.io.IOException;
import java.text.SimpleDateFormat;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;


@WebServlet("/searchflights")
public class searchflights extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		String driver="com.mysql.cj.jdbc.Driver";
 		String url="jdbc:mysql://localhost:3306/userdata";
 		String username="root";
 		String password="password$123$";
		PrintWriter out= response.getWriter();
		
		response.setContentType("text/html");
		String source= request.getParameter("src");
		String des= request.getParameter("dest");
		String date= request.getParameter("demo1");
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd");
		date = sdf2.format(sdf.parse(date));
		String passengers= request.getParameter("numpass");
		out.print("<p>Source: "+source+"<br>");
 		out.print("<p>Destination: "+des+"<br>");
 		out.print("<p>Date: "+date+"<br>");
 		out.print("<p>No of passengers: "+passengers+"<br>");
		
			//load the driver
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
		if(conn!=null)
		{
			System.out.println("Connection Established");
			String query= "select * from flightdetails where source="+'"'+source+'"'+ " AND " + "destination="+'"'+des+'"'+ " AND " + "date="+'"'+date+'"';
			out.print(query);
			
			PreparedStatement st= conn.prepareStatement(query);
			
				ResultSet result=st.executeQuery();	
				String airline = null, dest = null,src = null,date1 = null,time=null,fnum=null;
				ArrayList<ArrayList<Object>> data = null;
				data = new ArrayList<ArrayList<Object>>();
				
				while(result.next())
				{
					fnum=result.getString("flightnum");
					airline = result.getString("airline");
					dest = result.getString("destination");
					src = result.getString("source");
					date1 = result.getString("date");
					time = result.getString("time");
					
					
					data.add(new ArrayList<Object>(Arrays.asList(fnum, airline, src,dest,date1,time)));
					
				}
			
				request.setAttribute("flightdata", data);
				request.getRequestDispatcher("searchresults.jsp").forward(request, response);
				}
 		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch(Exception e){
		    e.printStackTrace();
		}
 
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
