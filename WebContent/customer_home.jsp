
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer_Home</title>
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

<%

int cust_id=(Integer)session.getAttribute("cust_id");
System.out.println(cust_id);

%>

<a href="logout">Logout</a>
<form action="ViewMenu.jsp">
<input type="submit" value="View Menu" >
</form><br><br>
<form action="OrderFood.jsp">
<input type="submit" value="Order Food">
</form><br><br>

<form action="YourOrders.jsp">
<input type="submit" value="Your Orders">
</form><br><br>
<form action="TrackOrders.jsp">
<input type="submit" value="Track Your Orders">
</form><br><br>

<form action="removeaccount" method="post" >
<input type="submit" value="Delete Account" style="float: right" onclick="return confirm('Are you sure you want to continue deleting your account??')" style="height:20px;width:150px" >
</form>

</body>
</html>