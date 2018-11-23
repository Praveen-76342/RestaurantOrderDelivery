<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>AdminSection</title>
<link rel="stylesheet" href="../font-awesome.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
body {
	font-family: "Comic Sans MS", sans-serif;
	margin: 0;
}

header {
	background-size: cover;
	padding: 10px;
	color: green;
	text-align: center;
	font-size: 20px;
	line-height: 15px;
}

footer {
	background-size: cover;
	padding: 10px;
	color: green;
	text-align: center;
	line-height: 15px;
}

nav {
	background-color: black;
	overflow: hidden;
}

nav ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

nav ul li {
	float: left;
}

nav ul li a {
	text-decoration: none;
	color: white;
	padding: 10px 25px;
	display: inline-block;
}

nav ul li a:hover {
	background-color: forestgreen;
}

nav ul li a.active {
	background-color: darkgreen;
}

aside {
	background-color: lightgreen;
	float: left;
	width: 200px;
	text-align: center;
}

aside ul {
	list-style-type: none;
	padding: 0;
	margin: 0;
}

aside ul li a {
	text-decoration: none;
	color: black;
	padding: 10px 25px;
	display: block;
}

aside ul li a:hover {
	color: white;
}

section {
	margin-left: 200px;
	border-left: 2px solid forestgreen;
	padding: 15px;
}

details {
	background: white url("../img/forest.jpg") no-repeat fixed bottom;
	background-size: cover;
	padding: 15px;
	color: white;
	margin: 5px;
	border-radius: 50px;
}

summary {
	outline: none;
}
</style>
</head>
<body>
<%

int admin_id=(Integer)session.getAttribute("admin_id");
System.out.println(admin_id);
%>
	<header>
		<h2>AdminSection</h2>
	</header>
	<aside>
		<ul>
			<li><a href="addEmployee.jsp" class="active">Add Employee</a></li>
			<li><a href="InsertMenu.jsp">Insert Food Menu</a></li>
			<li><a href="UpdateMenu.jsp">Update Food Menu</a></li>
			<li><a href="DeleteMenu.jsp">Delete Food Menu</a></li>
		</ul>
	</aside>
<form action="logout"><input type="submit" value="logout"></form>
	<div>
		<img src="" width="1125" height="600">
	</div>
</body>
</html>