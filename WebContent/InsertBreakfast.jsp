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
<form action="viewBreakfast.jsp" method="get">
<table border="1">
<tr>
<td>Name</td>
<td>Cost</td>
<td>item id</td>
</tr>
<%
try{
	
	int admin_id=(Integer)session.getAttribute("admin_id");
Class.forName("com.mysql.cj.jdbc.Driver");		
String url="jdbc:mysql://localhost:3306/restaurant";
String user="root";
String pass="1234";
Connection con=DriverManager.getConnection(url,user,pass);
String sql="Select * from breakfast";
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs1=ps.executeQuery();

ResultSet rs2=ps.executeQuery();


while(rs2.next())
{

String name=rs2.getString(1);
int cost=rs2.getInt(2);
String id=rs2.getString(3);
%>
<tr>
<td><%=name %></td>
<td><%=cost %></td>
<td><%=id %></td>
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
<form action="InsertBreakfast" method="post">
Name <input type="text" name="bfname"><br>
cost <input type="number" name="cost"><br>
ID <input type="text" name="id"><br>
<input type="submit" value="submit"> </form><br>
<form action="AdminSection.jsp">
<input type="submit" value="cancel"><br>
</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>