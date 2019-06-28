<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee Home Page</title>
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
<a href="logout">Logout</a>
<form action="viewOrders.jsp">
<input type="submit" value="View Placed Orders" >
</form><br>

<form action="PCOrders.jsp">
<input type="submit" value="Place or Cancel Orders" >
</form><br><br>
<form action="ConfirmDelivery.jsp">
<input type="submit" value="Confirm delivery">
</form><br><br>

<%

int emp_id=(Integer)session.getAttribute("emp_id");
System.out.println(emp_id);
%>

</body>
</html>