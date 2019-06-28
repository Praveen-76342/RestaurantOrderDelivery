<%@page import="java.sql.*"%>
<%@page import="java.io.*"%>
<%@page import ="javax.naming.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Select Lunch</title>
<style>
body{
    background-image: url("img/cel-lisboa-60315-unsplash.jpg");
    background-size: cover;
}
table {
    width: 50%;
    background:rgba(0,0,0,.6);
    color: white;
    margin-left:200px;
	margin-top:100px;
}
th {
    background-color: red;
    color: white;
}
input[type=submit]{
    background-color: orange;
    border: none;
    color: white;
    padding: 16px 32px;
    text-decoration: none;
    margin: 4px 2px;
    cursor: pointer;
}
input[type=submit]:hover{
background-color: grey
}
a:link, a:visited {
    background-color: #f44336;
    color: white;
    padding: 10px 10px;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    float: right;
}
a:hover, a:active {
    background-color: black;
}
</style>
</head>
<body>

<form action="logout">
<input type="submit" value="Logout" style="height:20px;width:100px;float:right" >
</form>

<form action="orderLunch.jsp">
<table border="1">
<tr>
<th>Name</th>
<th>Cost</th>
<th>Select Menu</th>
</tr>
<%
try{
	int cust_id=(Integer)session.getAttribute("cust_id");
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();
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
<form action="OrderFood.jsp">
<input type="submit" value="go back">
</form>
</body>
</html>