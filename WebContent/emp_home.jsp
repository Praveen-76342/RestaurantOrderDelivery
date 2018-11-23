<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Home Page</title>
</head>
<body>
<form action="viewOrders.jsp">
<input type="submit" value="viewOrders" >
</form><br>

<form action="PCOrders.jsp">
<input type="submit" value="Place or Cancel Orders" >
</form><br><br>
<%

int emp_id=(Integer)session.getAttribute("emp_id");
System.out.println(emp_id);
%>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>