<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try {
	Class.forName("com.mysql.cj.jdbc.Driver");		
	String url="jdbc:mysql://localhost:3306/restaurant";
	String user="root";
	String pass="1234";

	int admin_id=(Integer)session.getAttribute("admin_id");
	Connection con=DriverManager.getConnection(url,user,pass);
			String sql="select * from dinner";
			PreparedStatement ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			%><table>
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

<form action="InsertDinner" method="post">
Name <input type="text" name="diname"><br>
cost <input type="number" name="cost"><br>
ID <input type="text" name="id"><br>
<input type="submit" value=submit><br>
</form>
<form action="InsertMenu.jsp">
<input type="submit" value="cancel"><br>
</form>
<form action="logout">
<input type="submit" value="Logout" >
</form><br><br>
</body>
</html>