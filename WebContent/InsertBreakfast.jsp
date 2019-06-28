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
	height: 190px;
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
<form action="viewBreakfast.jsp" method="get">
<table border="1">
<tr>
<th>Name</th>
<th>Cost</th>
<th>item id</th>
</tr>
<%
try{
	
	int admin_id=(Integer)session.getAttribute("admin_id");
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();
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
<form onsubmit="return valid()" autocomplete="off" name="InsBrf" action="InsertBreakfast" method="post" class="form">
Name <input type="text" name="bfname" id="bfname" autocomplete="off" /><br>
<span id = "iname1"> </span><br>
cost <input type="text" name="cost" id="cost" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "icost"> </span><br>
ID <input type="text" name="id" id="id" autocomplete="off" /><br>
<span id = "iid"> </span><br>
<input type="submit" value="submit"> </form><br>
<form action="AdminSection.jsp">
<input type="submit" value="cancel"><br>
</form>
<form action="AdminSection.jsp">
<input type="submit" value="go back" >
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
    var bname = document.getElementById("bfname").value;
    var cost = document.getElementById("cost").value;  
    var id = document.getElementById("id").value;  
    if (bname == "")                                  
    { 
    	document.getElementById("iname1").innerHTML ="*please fill the username feild";
    	document.getElementById("icost").innerHTML ="";
    	document.getElementById("iid").innerHTML ="";
        return false; 
    }   
     if (cost == "")                        
     { 
     	document.getElementById("icost").innerHTML ="*please fill the password feild";
     	document.getElementById("iname1").innerHTML ="";
     	document.getElementById("iid").innerHTML ="";

        return false; 
     }
     if (id == "")                        
     { 
     	document.getElementById("iid").innerHTML ="*please fill the id feild";
     	document.getElementById("iname1").innerHTML ="";
     	document.getElementById("icost").innerHTML ="";

        return false; 
     }
    return true; 
}
</script>
</body>
</html>