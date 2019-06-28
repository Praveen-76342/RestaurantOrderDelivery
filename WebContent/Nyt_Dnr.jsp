<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import ="javax.naming.*" %>
<%@page import ="javax.sql.*" %>
    <%@page import="java.sql.*" %>
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
<%
try {
	Context ctx = new InitialContext();
    DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/vishnu");
    Connection con = ds.getConnection();

	int admin_id=(Integer)session.getAttribute("admin_id");
			String sql="select * from dinner";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			%><table border=1>
			<tr><th>Item Name</th><th>Price</th><th>ID</th></tr>
			<% while(rs.next())
			{
				%>
				<tr><td><%=rs.getString(1) %></td><td><%=rs.getInt(2) %></td><td><%=rs.getString(3)%></td></tr>
				
		<% 		
			}%></table><%
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
%>	
<br/><br/><br/><br/>
<form onsubmit="return valid()" autocomplete="off" name="UpdDin" action="Nyt_Dnr" method="post" class="form">
Enter ID <input type="text" name="id" id="id" autocomplete="off" /><br>
<span id = "iid"> </span><br>
Enter New Price <input type="text" name="cost" id="cost" autocomplete="off" onkeypress="return isNumber(event)"/><br>
<span id = "icost"> </span><br>
<input type="submit" value="update"/><br/>
</form>
<form action="UpdateMenu.jsp">
<input type="submit" value="Go Back"><br>
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
    var cost = document.getElementById("cost").value;  
    var id = document.getElementById("id").value;    
    if (id == "")                        
    { 
    	document.getElementById("iid").innerHTML ="*please fill the id feild";
    	document.getElementById("icost").innerHTML ="";

       return false; 
    } 
    if (cost == "")                        
     { 
     	document.getElementById("icost").innerHTML ="*please fill the password feild";
     	document.getElementById("iid").innerHTML ="";

        return false; 
     }
   
    return true; 
}
</script>
</body>
</html>