<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://displaytag.sf.net" prefix="display" %>

<html>
<body>
<h3>Available Flights</h3>
<table border="1">
	<tr> 
	<td style='background-color:lightblue'> Flight Number    </td>
	<td style='background-color:lightblue'> Airline          </td>
	<td style='background-color:lightblue'> From             </td>
	<td style='background-color:lightblue'> To               </td>
	<td style='background-color:lightblue'> Date             </td>
	<td style='background-color:lightblue'> Time             </td>
	<tr style='background-color:lightblue'></tr>
<%  String flightnum = null ;%>
 <c:forEach var="DATA" items="${flightdata}" >
 	<c:forEach var="colums" items="${DATA}" varStatus="loop">

 	<c:if test="${loop.count eq 1}">
  		<c:set var="fnum" value="${colums}"/>
  	    <% flightnum=(String)pageContext.getAttribute("fnum"); %>
  	</c:if>
  	<td style='background-color:yellow'>${colums}</td>
  	</c:forEach>
  	
  	<td>
  	<form>
  	<label>
  	<input type="hidden" name="hidBt" />
  	<input type="submit" name="submit" value="Book" onclick="this.form.hidBt.value=<%=flightnum%>;this.form.action='bookflight.jsp';this.form.submit();" />
  	</form>
  	</label>
  	</td>
  	<tr></tr>
  	
</c:forEach>

</table> 
</body>
</html>