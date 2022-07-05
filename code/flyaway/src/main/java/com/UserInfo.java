package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.sql.Statement;


@WebServlet("/info")
public class UserInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		String driver="com.mysql.cj.jdbc.Driver";
 		String url="jdbc:mysql://localhost:3306/userdata";
 		String username="root";
 		String password="password$123$";
		PrintWriter out= response.getWriter();
		response.setContentType("text/html");
		String fname= request.getParameter("firstname");
		String lname= request.getParameter("lastname");
		String email= request.getParameter("email");
		String pass= request.getParameter("password");
		String phone= request.getParameter("phone");
		
		try {
			//load the driver
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
		if(conn!=null)
		{
			System.out.println("Connection Established");
			String query= "insert into userinfo(firstname,lastname,email,password,phone) values (?,?,?,?,?)";
			PreparedStatement pst= conn.prepareStatement(query);
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, email);
			pst.setString(4, pass);
			pst.setString(5, phone);
			
		
			
			int x= pst.executeUpdate();
			if(x>0)
				out.print("Data Inserted into Database Successfully");
			else
				out.print("Error while inserting data");
		}
 		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
