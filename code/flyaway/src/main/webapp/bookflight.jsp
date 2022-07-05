<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
         <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
     <%@ page import="java.sql.*" %>
     <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Book Flights</title>

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
//String name=request.getParameter("uname");
//String password=request.getParameter("pass");
String flightnumber= request.getParameter("hidBt");
//Run query to find active user first
//INSERT INTO `userdata`.`bookeduserflight` (`userid`, `flightnum`) VALUES ('aish84@gmail.com', '1001');


String sql = "INSERT INTO userdata.bookeduserflight (userid, flightnum) VALUES ( " + "\"smitasingh@gmail.com\", " + '"'+flightnumber+'"' +")";
//out.println(sql);
ps = con.prepareStatement(sql);
int out1 = ps.executeUpdate(sql);
%>
</body>
</html>
