<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script language="javascript" type="text/javascript" src="datetimepicker.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Drop Downlist</title>
<style>
body {  
    background-color: lightblue;  
} 
</style>
</head>
<body>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/userdata";%>
<%!String user = "root";%>
<%!String psw = "password$123$";%>
<form action="searchflights" method="post">
<%
Connection con = null;
PreparedStatement ps = null;
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql = "SELECT * FROM flightdetails";
ps = con.prepareStatement(sql);
ResultSet rs = ps.executeQuery(); 
%>

<h3>Search your flight here.....</h3>
<table>
<tr>
<td>From</td>
<td>
<select name=src>
<%
while(rs.next())
{
String var = rs.getString("source"); 

%>
<option value="<%=var %>"><%=var %></option>
<%
}
%>
</select >
<%
rs = ps.executeQuery();
%>
</td>
<td>
To
</td>
<td>
<select name=dest>
<%
while(rs.next())
{
String var = rs.getString("destination"); 

%>
<option value="<%=var %>"><%=var %></option>
<%
}
%>
</select>
</td>
</tr>
<%
}
catch(SQLException sqe)
{ 
out.println(sqe);
}
%>
<tr>
<td>Date of Travel</td>
<td><input id="demo1" name="demo1" type="text" size="15"><a href="javascript:NewCal('demo1','ddmmyyyy')"><img src="cal.gif" width="16" height="16" border="0" alt="Pick a date""></a><br><br>
</td>
</tr>
<tr>
<td>Number of Passengers</td>
<td><input id="passengers" type="text" size="10" name="numpass"></td>
</tr>
<tr>
<td></td>
<td><input id="Search" type="submit" size="50" value="Search"></td>
</tr>
</table>
</form>
</body>
</html>