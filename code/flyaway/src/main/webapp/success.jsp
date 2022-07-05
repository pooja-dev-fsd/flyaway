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
<title>Insert title here</title>
</head>
<style>
body {  
    background-color: lightblue;  
} 
</style>
<body>
<h3>Successfully loggedIn |||</h3>
<h4>Welcome <%=request.getParameter("uname") %></h4>
 
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

String sql = "UPDATE userdata.userinfo SET active = 1  WHERE email = "+'"'+name+'"';
//sql= " select * from userinfo";
out.println(sql);
ps = con.prepareStatement(sql);
int outp = ps.executeUpdate();

%>
</body>
</html>