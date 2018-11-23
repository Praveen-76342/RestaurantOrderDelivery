<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert Menu</title>
</head>
<body>
<%int admin_id=(Integer)session.getAttribute("admin_id"); %>
<form action="InsertBreakfast.jsp">
<input type="submit" value="Insert Breakfast" >
</form><br>
<form action="InsertLunch.jsp">
<input type="submit" value="Insert Lunch" >
</form><br>
<form action="InsertDinner.jsp">
<input type="submit" value="Insert Dinner" >
</form><br>
<form action="AdminSection.jsp">
<input type="submit" value="Cancel" >
</form><br>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>