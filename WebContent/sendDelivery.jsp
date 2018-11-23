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
<form action="sendDelivery" method="post">
<table border="1">
<tr>
<td>cust_id</td>
<td>Name</td>
<td>no of plates</td>
<td>total cost</td>
<td>order_id</td>
<td>Select for delivery</td>

</tr>
<%
try{
	int emp_id=(Integer)session.getAttribute("emp_id");
	Class.forName("com.mysql.cj.jdbc.Driver");		
	String url="jdbc:mysql://localhost:3306/restaurant";
	String user="root";
	String pass="1234";
	
	Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from  placed_orders";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs2=ps.executeQuery();


while(rs2.next())
{
int id1=rs2.getInt(1);
int id2=rs2.getInt(5);
String name=rs2.getString(2);
int num=rs2.getInt(3);
int cost=rs2.getInt(4);

%>
<tr>
<td><%=id1 %></td>
<td><%=name %></td>
<td><%=num %></td>
<td><%=cost %></td>
<td><%=id2 %></td>
<td><input type="checkbox" name="order_id" value="<%=id2%>"></td>
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
<input type="submit" value="afff" />

</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>