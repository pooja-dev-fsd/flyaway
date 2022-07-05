<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"%>
     <%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 <!DOCTYPE html>
 <html>
 <head>
 <meta charset="UTF-8">

 </head>
 <body>
 
 
 <%! String driverName = "com.mysql.jdbc.Driver";%>
 <%!String url = "jdbc:mysql://localhost:3306/userdata";%>
 <%!String user = "root";%>
 <%!String psw = "password$123$";%>
 <% 	

Connection con = null;
PreparedStatement ps = null;
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String name=request.getParameter("uname");
String password=request.getParameter("pass");

String sql = "select * from userinfo where email="+'"'+name+'"'+ " AND " + "password="+'"'+password+'"';
out.println(sql);
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

boolean found = false;
while(rs.next())
{
	found = true;
	String uname = rs.getString("email"); 
	String passwd = rs.getString("password"); 

	%>
		<jsp:forward page="success.jsp">
		<jsp:param value="<%=uname %>" name="uname"/>
	    </jsp:forward>
	<%

}
if (!found){
	%>
	<h3>Invalid Login Credentials</h3>
	 <jsp:include page="login.html"></jsp:include>
	 	
	<%
}
%>
 </body>
 </html> 