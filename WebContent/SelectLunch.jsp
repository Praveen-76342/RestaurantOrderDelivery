<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Lunch</title>
</head>
<body>
<form action="orderLunch.jsp">
<table border="1">
<tr>
<td>Name</td>
<td>Cost</td>
<td>Select Menu</td>
</tr>
<%
try{
	int cust_id=(Integer)session.getAttribute("cust_id");
Class.forName("com.mysql.cj.jdbc.Driver");		
String url="jdbc:mysql://localhost:3306/restaurant";
String user="root";
String pass="1234";
Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from lunch";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs1=ps.executeQuery();

ResultSet rs2=ps.executeQuery();


while(rs2.next())
{

String name=rs2.getString(1);
int cost=rs2.getInt(2);

%>
<tr>
<td><%=name %></td>
<td><%=cost %></td>
<td><input type="checkbox" name="id" value="<%=rs2.getString(3) %>"></td>
</tr>
<%

}
con.close();
}
catch (Exception e)
{
	e.printStackTrace();
}
%>
</table>

<input type="submit" value="Proceed">
</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>