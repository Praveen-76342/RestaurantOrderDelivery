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
<%
int emp_id=(Integer)session.getAttribute("emp_id");
System.out.println(emp_id);
%>
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
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();
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
        <form onsubmit="return valid1()" autocomplete="off" name="PlaceOrder" action="placeorder" method="post">
        <table>
            
            <tr><td>Orderid: </td><td><input type="text" name="pcust" id="pcust" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "ipcust"> </span><br><input type="submit" value="place order"></td></tr>
        </table>
        </form> 
       
        <form onsubmit="return valid2()" autocomplete="off" name="CancelOrder" action="cancelorder" method="post">
        <table>
            
            <tr><td>Orderid: </td><td><input type="text" name="ccust" id="ccust" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "iccust"> </span><br><input type="submit" value="cancel order">
        </table>
        </form> 
        <form action="emp_home.jsp">
<input type="submit" value="Home" >
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
function valid1()                                    
{ 
    var pcust = document.getElementById("pcust").value;    
    if (pcust == "")                        
    { 
    	document.getElementById("ipcust").innerHTML ="*please fill the id feild";
       return false; 
    } 
   
    return true; 
}
function valid2()                                    
{ 
    var ccust = document.getElementById("ccust").value;    
    if (ccust == "")                        
    { 
    	document.getElementById("iccust").innerHTML ="*please fill the id feild";
       return false; 
    } 
   
    return true; 
}
</script>
</body>
</html>