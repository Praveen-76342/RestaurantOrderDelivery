<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% session.invalidate(); %>
<a href="basic_cust.jsp"> Customer</a><br>
<a href="Elogin.jsp"> Employee</a><br>
<a href="AdminLogin.jsp"> Admin</a><br>
</body>
</html>