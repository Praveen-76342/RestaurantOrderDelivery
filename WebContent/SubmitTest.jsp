<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="SubmitTest.jsp">
<table border="1">
<tr>
<td>Text:</td>
<td><input type="text" name="myText" value=""></td>
<td><input type="Submit" value="Click to Submit"></td>
</tr>
</table>
</form>
<br>
<%
String myText = request.getParameter("myText");
if (myText == null) {
// myText is null when the page is first requested, 
// so do nothing
} else { 
if (myText.length() == 0) {
// There was a querystring like ?myText=
// but no text, so myText is not null, but 
// a zero length string instead.
%>
<b>myText is empty</b>
<% } else { %>
<b>myText is <%= myText %></b>
<%
}
}
%>

</body>
</html>