<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>
<style>
body {
	font-family: "Comic Sans MS", sans-serif;
	margin: 0;
	background-size: cover;
	color: black;
}

h1 {
	text-align: center;
}

h2 {
	background-color: Blue;
	color: white;
	text-align: center;
	padding: 10px;
}

td {
	padding: 7px;
	font-size: 18px;
}

input[type='text'], input[type='month'], input[type='number'], input[type='time'],
	input[type='date'] {
	height: 35px;
	border-radius: 20px;
	box-sizing: border-box;
	font-size: 18px;
}

input[type='text']:focus, input[type='month']:focus, input[type='number']:focus,
	input[type='time']:focus, input[type='date']:focus {
	outline: none;
	box-sizing: border-box;
	background-color: lightBlue;
}

textarea:focus {
	outline: none;
	box-sizing: border-box;
	background-color: lightblue;
}

textarea {
	border-radius: 30px;
	box-sizing: border-box;
}

.button {
	background-color: Blue;
	color: black;
	box-sizing: border-box;
	padding: 14px 55px;
	font-size: 18px;
	border-radius: 50px;
}

.button:hover {
	background-color: blue;
	cursor: pointer;
	box-shadow: 5px 5px 15px black;
}
</style>
</head>
<body>

			<%int admin_id=(Integer)session.getAttribute("admin_id"); %>
	<form action="addEmployee" method="post">
		<div id="EmployeeProfile">
			<h2>Employee Profile</h2>
			<table width="100%">
				<tr>
					<td>Full name</td>
					<td><input type="text" name="name" size="30"></td>
				</tr>
				<tr>
					<td>Age</td>
					<td><input type="number" name="age"></td>
				</tr>
				<tr>
					<td colspan="1">Gender</td>
					<td><input type="radio" name="gender" value="male">Male
						<input type="radio" name="gender" value="female">Female</td>
				</tr>
				<tr>
					<td>Mobile number</td>
					<td><input type="number" name="phno"></td>
				</tr>
				<tr>
					<td>Email id</td>
					<td><input type="text" name="email" size="30"></td>
				</tr>

				<tr>
					<td>Current Address</td>
					<td><textarea rows="5" name="address" cols="26"></textarea></td>
				<tr>
					<td>UserName</td>
					<td><input type="text" name="username" size="30"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="npass" size="30"></td>
				</tr>
				<tr>
					<td>Re-Type Password</td>
					<td><input type="text" name="rpass" size="30"></td>
				</tr>
				</tr>
				<tr>
					<td><input type="submit" name="submit" value="Submit"></td>
				</tr>
			</table>
		</div>
	</form>
	<br>
	<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>