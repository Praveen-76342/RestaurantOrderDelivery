<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Managment</title>
</head>
<body>
	<form action="employeelogin" method="post">
		<table style="background-color: skyblue; margin-left: 20px;margin-left: 20px;">
			<tr>
				<td> UserName: </td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td> Password: </td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Submit"><br></td>
				<br>
			</tr>
		</table>
	</form>
</body>
</html>