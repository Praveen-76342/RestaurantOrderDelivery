<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

			<% int admin_id=(Integer)session.getAttribute("admin_id");%>
<form action="Delete_Brkfst.jsp">
<input type="submit" value="Delete Breakfast" >
</form>
<form action="Delete_Lunch.jsp">
<input type="submit" value="Delete Lunch" >
</form>
<form action="Delete_Dinner.jsp">
<input type="submit" value="Delete Dinner" >

</form>
<form action="AdminSection.jsp">
<input type="submit" value="Go Back"><br></form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>