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
<table border="1">
<tr>
<td>custid</td>
<td>food item</td>
<td>no of plates</td>
<td>Cost</td>
<td>orderid</td>
</tr>
<%
try{
	int emp_id=(Integer)session.getAttribute("emp_id");
	Class.forName("com.mysql.cj.jdbc.Driver");		
	String url="jdbc:mysql://localhost:3306/restaurant";
	String user="root";
	String pass="1234";
	Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from cust_orders";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();

while(rs.next())
{


%>
<tr>
    <td><%=rs.getInt(1) %></td>
    <td><%=rs.getString(2) %></td>
    <td><%=rs.getInt(3)%></td>
    <td><%=rs.getDouble(4)%></td>
    <td><%=rs.getInt(5)%></td>

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
        <form action="placeorder" method="post">
        <table>
            
            <tr><td>Orderid: </td><td><input type="text" name="pcust"><input type="submit" value="place order"></td></tr>
        </table>
        </form> 
       
        <form action="cancelorder" method="post">
        <table>
            
            <tr><td>Orderid: </td><td><input type="text" name="ccust"><input type="submit" value="cancel order">
        </table>
        </form> 
        <form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>