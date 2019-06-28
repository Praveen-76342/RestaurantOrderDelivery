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

<a href = "logout" >Logout</a>

<% int cust_id=(Integer)session.getAttribute("cust_id");
System.out.println(cust_id);
%>

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
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();
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

while(rs1.next())
{ %><tr><td><%=rs1.getString(2) %></td><td><%=rs1.getInt(3)%></td><td><%=rs1.getInt(4)%></td><td><%=rs1.getInt(5)%></td></tr>
<%
}
String sql2="Select * from delivery_table where cust_id=?";
PreparedStatement ps2=con.prepareStatement(sql2);
ps2.setInt(1,cust_id1);
ResultSet rs2=ps2.executeQuery();

while(rs2.next())
{
	 %><tr><td><%=rs2.getString(2) %></td><td><%=rs2.getInt(3)%></td><td><%=rs2.getInt(4)%></td><td><%=rs2.getInt(5)%></td></tr>
	 <%}
String sql3="Select * from canceled_orders where cust_id=?";
PreparedStatement ps3=con.prepareStatement(sql3);
ps3.setInt(1,cust_id1);
ResultSet rs3=ps3.executeQuery();

while(rs3.next())
{
	 %><tr><td><%=rs3.getString(2) %></td><td><%=rs3.getInt(3)%></td><td><%=rs3.getInt(4)%></td><td><%=rs3.getInt(5)%></td></tr>
	 <%}
String sql4="Select * from delivered_table where cust_id=?";
PreparedStatement ps4=con.prepareStatement(sql4);
ps4.setInt(1,cust_id1);
ResultSet rs4=ps4.executeQuery();

while(rs4.next())
{
	 %><tr><td><%=rs4.getString(2) %></td><td><%=rs4.getInt(3)%></td><td><%=rs4.getInt(4)%></td><td><%=rs4.getInt(5)%></td></tr>
	 <%}
con.close();
}
catch (Exception e)
{
	e.printStackTrace();
}
%>
</table> 
<form onsubmit="return valid()" autocomplete="off" name="TrackOrders" action="trackedorder" method="post" class="form">
Enter order id:<input type="text" name="order_id" id="order_id" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "iid"> </span><br>
<input type="submit" value="Track">
</form><br><br>
<form action="customer_home.jsp">
<input type="submit" value="Go back"></form>

<script> 
function isNumber(evt) {
    evt = (evt) ? evt : window.event;
    var charCode = (evt.which) ? evt.which : evt.keyCode;
    if (charCode > 31 && (charCode < 48)|| (charCode > 57)) {
    	
        return false;
    }
    return true;
}
function valid()                                    
{ 
    var id = document.getElementById("order_id").value;    
    if (id == "")                        
    { 
    	document.getElementById("iid").innerHTML ="*please fill the id feild";
       return false; 
    } 
   
    return true; 
}
</script>
</body>
</html>