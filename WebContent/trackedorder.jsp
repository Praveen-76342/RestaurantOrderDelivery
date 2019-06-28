<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tracked Order</title>
</head>
<body>
<%
String str=(String)request.getAttribute("str");
out.println(str);
%>
<br>
<form action="logout">
<input type="submit" value="Logout" style="height:20px;width:100px;float:right" >
</form>
<br>
<form action="customer_home.jsp">
<input type="submit" value="Home">
</form>
</body>
</html>