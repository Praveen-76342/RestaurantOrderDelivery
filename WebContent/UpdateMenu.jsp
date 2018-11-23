<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%int admin_id=(Integer)session.getAttribute("admin_id"); %>
<form action="Morn_brkfst.jsp">
<input type="submit" value="Update Breakfast" >
</form>
<form action="Aftrn_Lunch.jsp">
<input type="submit" value="Update Lunch" >
</form>
<form action="Nyt_Dnr.jsp">
<input type="submit" value="Update Dinner" >
</form>
<form action="AdminSection.jsp">
<input type="submit" value="Go Back"><br>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>