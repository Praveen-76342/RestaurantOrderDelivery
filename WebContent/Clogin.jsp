<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Login</title>
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
<% session.invalidate(); response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");%>

<form name="CLogin" action="checklogin" method="post" onsubmit="return valid()" autocomplete="off" class="form">
Username <input type="text" name="User" id="username" autocomplete="off" /><br>
<span id = "iname1" class="text-danger"> </span><br>
Password <input type="password" name="npass" id="newpass1"  autocomplete="off"/><br>
<span id = "ipass1" class="text-danger"> </span><br>
<input  type="submit" value="Send"/><br>
<a href="Cregister.jsp"><font color="white">Not a user? click here</font></a>
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
    var npassword = document.getElementById("newpass1").value;  
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