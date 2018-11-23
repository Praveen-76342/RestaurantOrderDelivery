<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Breakfast</title>
</head>
<body>
<form action="dincheckout">
<table border="1">
<tr>
<td>Name</td>
<td>Cost</td>
<td>Select No. of Plates</td>
</tr>
<%
try{
Class.forName("com.mysql.cj.jdbc.Driver");		
String url="jdbc:mysql://localhost:3306/restaurant";
String user="root";
String pass="1234";
Connection con=DriverManager.getConnection(url,user,pass);

String sql="Select * from dinner";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
String select[] = request.getParameterValues("id"); 
int x=0;
for(int i=0;i<select.length;i++)
{
	x++;
}
String names[]=new String[x];

while(rs.next())
{
	for (int i = 0; i < select.length; i++)
	{
		if(select[i].equals(rs.getString(3)))
		{
			String name=rs.getString(1);
			int cost=rs.getInt(2);
			%>
			<tr>
			<td><%=name%><% names[i]=name;%></td>
			<td><%=cost %></td>
			<td><input type="number" name="num"></td>
			</tr>
			<%
		}
	}

}
for (int i = 0; i < select.length; i++)
{
	System.out.println(names[i]);
}
for (int i = 0; i < select.length; i++)
{
	%>
	<input type="hidden" name="names" value="<%=names[i]%>">
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

<input type="submit" value="Checkout">
</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>