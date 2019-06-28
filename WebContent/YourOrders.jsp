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
<title>Your Orders</title>
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
<form action="customer_home.jsp">
<input type="submit" value="Home">
</form><br>

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
	
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();

int cust_id=(Integer)session.getAttribute("cust_id");
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
<form onsubmit="return valid()" autocomplete="off" name="YourOrders" action="cust_cancel" method="post" class="form">
Order id:<input type="text" name="order_id" id="order_id" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "iid" class="text-danger"> </span><br>
<input type="submit" value="Cancel Order" >
</form><br><br>


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