<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style> 
body{
    background-image: url("img/cust_home.jpg");
    background-size: cover;
}
input[type=submit]{
    background-color: orange;
    border: none;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
input[type=submit]:hover{
background-color: grey
}
.form{
	width: 150px;
	height: 190px;
	background:rgba(0,0,0,.35);
	color:#fff;
	position:absolute;
	margin-left:400px;
	margin-top:100px;
}
a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    float: right;
}
a:hover, a:active {
    background-color: black;
}
</style>
</head>
<body>
<% int cust_id=(Integer)session.getAttribute("cust_id"); %>
<a href="logout">Logout</a>
<form action="viewBreakfast.jsp"><br><br>
<input type="submit" value="View Breakfast"></form>
<form action="viewLunch.jsp"><br><br>
<input type="submit" value="View Lunch"></form>
<form action="ViewDinner.jsp"><br><br>
<input type="submit" value="View Dinner"></form>
<form action="customer_home.jsp"><br><br>
<input type="submit" value="Go Home""></form>
<br><br>
</body>
</html>