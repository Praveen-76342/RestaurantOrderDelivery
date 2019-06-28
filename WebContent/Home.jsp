<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
body{
    background-image: url("img/Clogin.jpg");
    background-size: cover;
}
input[type=submit]{
    background-color: #4CAF50;
    border: none;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
</style>
</head>
<body>
<% session.invalidate(); %>
<form action="basic_cust.jsp" class="form">
<font color="white">
<input type="submit" value="Customer">
</font>
</form><br><br>
<form action="Elogin.jsp" class="form">
<font color="white">
<input type="submit" value="Employee">
</font>
</form><br><br>
<form action="AdminLogin.jsp" class="form">
<font color="white">
<input type="submit" value="Admin">
</font>
</form><br><br>


</body>
</html>