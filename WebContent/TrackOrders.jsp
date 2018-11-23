<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% int cust_id=(Integer)session.getAttribute("cust_id"); %>

<table border="1">
<tr>
<td>food item</td>
<td>no of plates</td>
<td>Cost</td>
<td>orderid</td>
</tr>
<%
try{
	int cust_id1=(Integer)session.getAttribute("cust_id");
	Class.forName("com.mysql.cj.jdbc.Driver");		
	String url="jdbc:mysql://localhost:3306/restaurant";
	String user="root";
	String pass="1234";
	//cust_orders, placed_orders, delivery_table, canceled_orders
	Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from cust_orders where cust_id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,cust_id1);
ResultSet rs=ps.executeQuery();

while(rs.next())
{
	  %><tr><td><%=rs.getString(2) %></td><td><%=rs.getInt(3)%></td><td><%=rs.getInt(4)%></td><td><%=rs.getInt(5)%></td></tr>
	 <%
}
String sql1="Select * from placed_orders where cust_id=?";
PreparedStatement ps1=con.prepareStatement(sql1);
ps1.setInt(1,cust_id1);
ResultSet rs1=ps1.executeQuery();

while(rs.next())
{ %><tr><td><%=rs.getString(2) %></td><td><%=rs.getInt(3)%></td><td><%=rs.getInt(4)%></td><td><%=rs.getInt(5)%></td></tr>
<%
}
String sql2="Select * from delivery_table where cust_id=?";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setInt(1,cust_id1);
ResultSet rs2=ps1.executeQuery();

while(rs.next())
{
	 %><tr><td><%=rs.getString(2) %></td><td><%=rs.getInt(3)%></td><td><%=rs.getInt(4)%></td><td><%=rs.getInt(5)%></td></tr>
	 <%}
String sql3="Select * from canceled_orders where cust_id=?";
PreparedStatement ps3=con.prepareStatement(sql3);
ps3.setInt(1,cust_id1);
ResultSet rs3=ps1.executeQuery();

while(rs.next())
{
	 %><tr><td><%=rs.getString(2) %></td><td><%=rs.getInt(3)%></td><td><%=rs.getInt(4)%></td><td><%=rs.getInt(5)%></td></tr>
	 <%}
con.close();
}
catch (Exception e)
{
	e.printStackTrace();
}
%>
</table> 
<form action="trackedorder" method="post">
Enter order id:<input type="number" name="order_id" required="required" >
<input type="submit" value="Track">
</form><br><br>
<a href = "customer_home.jsp" >Go Back</a>

<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>