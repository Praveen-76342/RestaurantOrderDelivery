
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer_Home</title>
</head>
<body>

<%

int cust_id=(Integer)session.getAttribute("cust_id");
System.out.println(cust_id);
%>
<a href="ViewMenu.jsp">View Menu </a><br><br><br>
<a href="OrderFood.jsp">Order Food</a><br><br><br>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
<form action="YourOrders.jsp">
<input type="submit" value="your orders" >
</form>
<form action="TrackOrders.jsp">
<input type="submit" value="Track your orders" >
</form>
</body>
</html>