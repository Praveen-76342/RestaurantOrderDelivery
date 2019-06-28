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
<title>Insert title here</title>
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
.form{
	width: 150px;
	height: 60px;
	background:rgba(0,0,0,.6);
	color:#fff;
	position:absolute;
	margin-left:400px;
	margin-top:100px;
}
</style>
</head>
<body>
<a href="logout">Logout</a>
<form onsubmit="return valid()" autocomplete="off" name="ViewOrders" action="sendDelivery" method="post">
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
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();
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
<center><input type="submit" value="Send to delivery"></center>
</form><br><br><br><br>
<form onsubmit="return valid()" action="viewOrders.jsp" method="post" >
<input type="text" name="id" id="id" autocomplete="off" onkeypress="return isNumber(event)" />
<span id = "iid"> </span><br>
<input type="submit" value="get Customer Details" />

</form>
<%String id = request.getParameter("id");

if (id == null) {
	// myText is null when the page is first requested, 
	// so do nothing
	}
 else { 
		int x =Integer.parseInt(id);
		try{
			int emp_id=(Integer)session.getAttribute("emp_id");
			Context ctx = new InitialContext();
		    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
		    Connection con = ds.getConnection();
		String sql="Select cust_name,phno,cust_address from  cust_details where cust_id=?";
		PreparedStatement ps=con.prepareStatement(sql);
		ps.setInt(1, x);
		ResultSet rs2=ps.executeQuery();
		while(rs2.next())
		{
			%>
			<table><tr><th>Customer ID</th>
			<th>Name</th><th>Phone Number</th><th>Address</th></tr>
			<tr><td><%=x%></td><td><%=rs2.getString(1)%></td><td><%=rs2.getDouble(2)%></td><td><%=rs2.getString(3)%></td> </tr>
			</table>
		<% }
		con.close();
		}
		catch (Exception e)
		{
			e.printStackTrace();
		}	
	}%>
	<br>


<form action="emp_home.jsp">
<input type="submit" value="go back">
</form>

</body>
</html>