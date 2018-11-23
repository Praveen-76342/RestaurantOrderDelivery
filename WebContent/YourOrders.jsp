<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Orders</title>
</head>
<body>
<a href="customer_home.jsp">Home</a>
<form action="" >
<table border="1">
<tr>
<td>Item name</td>
<td>No of Plates</td>
<td>Total cost</td>
<td>order id</td>
</tr>
<%
try{
	
Class.forName("com.mysql.cj.jdbc.Driver");		
String url="jdbc:mysql://localhost:3306/restaurant";
String user="root";
String pass="1234";

int cust_id=(Integer)session.getAttribute("cust_id");
Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from cust_orders where cust_id=?";
PreparedStatement ps=con.prepareStatement(sql);
ps.setInt(1,cust_id);


ResultSet rs2=ps.executeQuery();


while(rs2.next())
{

String name=rs2.getString(2);
int num=rs2.getInt(3);
int cost=rs2.getInt(4);
int oid=rs2.getInt(5);

%>
<tr>
<td><%=name %></td>
<td><%=num %></td>
<td><%=cost %></td>
<td><%=oid %></td>
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


</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>