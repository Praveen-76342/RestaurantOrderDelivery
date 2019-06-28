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
<title>Lunch</title>
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
<a href="logout">Logout</a>
<form onsubmit="return valid()" autocomplete="off" name="OrdLun" action="lunch_checkout">
<table border="1">
<tr>
<th>Name</th>
<th>Cost</th>
<th>Select No. of Plates</th>
</tr>
<%
try{
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();

String sql="Select * from lunch";
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
			<td><input type="text" name="num" id="num" autocomplete="off" required/><br>
<span id = "inum" class="text-danger"> </span><br></td>
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
<form action="customer_home.jsp">
<input type="submit" value="cancel">
</form>

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
    var num = document.getElementById("num").value;    
    if (num == "")                        
    { 
    	document.getElementById("inum").innerHTML ="*please fill the id feild";
       return false; 
    } 
   
    return true; 
}
</script>
</body>
</html>