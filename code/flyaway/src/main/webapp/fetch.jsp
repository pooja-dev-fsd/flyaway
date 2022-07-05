<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "userdata";
String userid = "root";
String password = "password$123$";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<body>

<h1>Retrieve data from database in jsp</h1>
<table border="1">
<tr>
<td>FlightNumber</td>
<td>Airline</td>
<td>Source</td>
<td>Destination</td>
<td>Date</td>
<td>Time</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from flightdetails";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("flightnum") %></td>
<td><%=resultSet.getString("airline") %></td>
<td><%=resultSet.getString("source") %></td>
<td><%=resultSet.getString("destination") %></td>
<td><%=resultSet.getString("date") %></td>
<td><%=resultSet.getString("time") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table> 

</body>
</html>


