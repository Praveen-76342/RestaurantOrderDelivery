<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Managment</title>
</head>
<body>
	<form onsubmit="return valid()" autocomplete="off" name="AdminLogin" action="AdminAuthenticate" method="post">
		<table style="background-color: skyblue; margin-left: 20px;margin-left: 20px;">
			<tr>
				<td> UserName: </td>
				<td><input type="text" name="username" id="username" autocomplete="off" /><br>
<span id = "iname1"> </span><br></td>
			</tr>
			<tr>
				<td> Password: </td>
				<td><input type="password" name="password" id="password"  autocomplete="off"/><br>
<span id = "ipass1"> </span><br></td>
			</tr>
			<tr>
				<td><input type="submit" name="submit" value="Submit"></td>
			</tr>
		</table>
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
    var Uname = document.getElementById("username").value;
    var npassword = document.getElementById("password").value;  
    if (Uname == "")                                  
    { 
    	document.getElementById("iname1").innerHTML ="*please fill the username feild";
    	document.getElementById("ipass1").innerHTML ="";
        return false; 
    }   
     if (npassword == "")                        
     { 
     	document.getElementById("ipass1").innerHTML ="*please fill the password feild";
     	document.getElementById("iname1").innerHTML ="";

        return false; 
     }
    return true; 
}
</script>
</body>
</html>