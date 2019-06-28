<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hotel Managment</title>
<style> 
body{
    background-image: url("img/Clogin.jpg");
    background-size: cover;
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
.form{
	width: 150px;
	height: 170px;
	background:rgba(0,0,0,.6);
	color:#fff;
	position:absolute;
	margin-left:400px;
	margin-top:100px;
}
</style>
</head>
<body>
	<form onsubmit="return valid()" autocomplete="off" name="EmployeeLogin" action="employeelogin" method="post" class="form">

			
				 UserName:<input type="text" name="username" id="username" autocomplete="off" /><br>
<span id = "iname1"> </span><br>
			
				 Password: 
				<input type="password" name="password" id="password"  autocomplete="off"/><br>
<span id = "ipass1"> </span><br>
		
				<input type="submit" name="submit" value="Submit"><br>
				<br>
			
	</form>
<script> 
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