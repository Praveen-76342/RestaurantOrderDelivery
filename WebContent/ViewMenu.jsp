<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int cust_id=(Integer)session.getAttribute("cust_id"); %>
<a href="viewBreakfast.jsp">Breakfast</a><br>
<a href="viewLunch.jsp">Lunch</a><br>
<a href="ViewDinner.jsp">Dinner</a><br>
<a href="customer_home.jsp">go back</a>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>