<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Profile</title>
<style>
body {
	font-family: "Comic Sans MS", sans-serif;
	margin: 0;
	background-size: cover;
	color: black;
}

h1 {
	text-align: center;
}

h2 {
	background-color: Blue;
	color: white;
	text-align: center;
	padding: 10px;
}

td {
	padding: 7px;
	font-size: 18px;
}

input[type='text'], input[type='month'], input[type='number'], input[type='time'],
	input[type='date'] {
	height: 35px;
	border-radius: 20px;
	box-sizing: border-box;
	font-size: 18px;
}

input[type='text']:focus, input[type='month']:focus, input[type='number']:focus,
	input[type='time']:focus, input[type='date']:focus {
	outline: none;
	box-sizing: border-box;
	background-color: lightBlue;
}

textarea:focus {
	outline: none;
	box-sizing: border-box;
	background-color: lightblue;
}

textarea {
	border-radius: 30px;
	box-sizing: border-box;
}

.button {
	background-color: Blue;
	color: black;
	box-sizing: border-box;
	padding: 14px 55px;
	font-size: 18px;
	border-radius: 50px;
}

.button:hover {
	background-color: blue;
	cursor: pointer;
	box-shadow: 5px 5px 15px black;
}
</style>
</head>
<body>

			<%int admin_id=(Integer)session.getAttribute("admin_id"); %>
	<form action="addEmployee" method="post" onsubmit="return valid()" autocomplete="off">
		<div id="EmployeeProfile">
			<h2>Employee Profile</h2>
			<table >
				<tr>
					<td>Full name</td>
					<td><input type="text" name="name" size="30" id="name1" autofocus /><br></td>
				<td><span id = "iname"> </span><br>
				</td></tr>
				<tr>
					<td>Age</td>
					<td><input type="number" name="age" id = "age1" onkeypress="return isNumber(event)" /><br></td>
				<td><span id = "iage"> </span><br>
</td></tr>
				<tr>
					<td colspan="1">Gender</td>
					<td><input type="radio" name="gender" value="male">Male
						<input type="radio" name="gender" value="female">Female</td>
				</tr>
				<tr>
					<td>Mobile number</td>
					<td><input type="text" name="phno" id="phone" onkeypress="return isNumber(event)"><br></td>
					<td><br><span id ="iphno1"> </span></td>
				</tr>
				<tr>
					<td>Email id</td>
					<td><input type="text" name="email" size="30" id="email" ><br></td>
				<td><span id = "iemail"> </span><br>
				</td></tr>

				<tr>
					<td>Current Address</td>
					<td><textarea rows="5" name="address" id="address1" cols="26"></textarea><br></td>
				<td><span id = "iaddress"> </span><br>
				</td>
				<tr>
					<td>UserName</td>
					<td><input type="text" name="username" size="30" id ="username"><br></td>
				<td><span id = "iusername"> </span><br>
				</td></tr>
				<tr>
					<td>Password</td>
					<td><input type="text" name="npass" size="30" id="newpass"><br></td>
				<td><span id = "inewpass1"> </span><br>
				</td></tr>
				<tr>
					<td>Re-Type Password</td>
					<td><input type="text" name="rpass" size="30" id="conpass"><br></td>
				<td><span id = "iconpass"> </span><br>
				</td></tr>
				
				<tr>
					<td><input type="submit" name="submit" value="Submit"></td>
				</tr>
			</table>
		</div>
	</form>
	<br>
	<form action="AdminSection.jsp">
<input type="submit" value="go back" >
</form><br><br>
	<form action="logout">
<input type="submit" value="Logout" >
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
    var Fname = document.getElementById("name1").value;
    var age = document.getElementById("age1").value;
    var Uname = document.getElementById("username").value;
    var npassword = document.getElementById("newpass").value;
    var rpassword = document.getElementById("conpass").value;
    var email = document.getElementById("email").value;
    var address =document.getElementById("address1").value;
    var phno1 = document.getElementById("phone").value;
    if (Fname == "")                                  
    { 
        document.getElementById("iname").innerHTML ="*please fill the full name feild";
        document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="";
    	document.getElementById("iphno1").innerHTML ="";
    	document.getElementById("iage").innerHTML ="";
        return false; 
    }  
    if (age == "")                                  
    { 
        document.getElementById("iage").innerHTML ="*please fill age feild";
        document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="";
    	document.getElementById("iphno1").innerHTML ="";
    	document.getElementById("iname").innerHTML ="";
        return false; 
    } 
    if(phno1 == "")
	 {
	 document.getElementById("iphno1").innerHTML ="*Please fill the phone number";
    document.getElementById("iusername").innerHTML ="";
	document.getElementById("inewpass1").innerHTML ="";
	document.getElementById("iconpass").innerHTML ="";
	document.getElementById("iemail").innerHTML ="";
	document.getElementById("iphno").innerHTML ="";
	return false;
	 }

 if((phno1.length<10) || (phno1.length>10) )
	 {
	 document.getElementById("iphno1").innerHTML ="*Length of phone number must be equal to 10 only";
    document.getElementById("iusername").innerHTML ="";
	document.getElementById("inewpass1").innerHTML ="";
	document.getElementById("iconpass").innerHTML ="";
	document.getElementById("iemail").innerHTML ="";
	document.getElementById("iphno").innerHTML ="";
	return false;
	 }

    
    if(email == "")
    	{
    	document.getElementById("iname").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="*Please fill email feild";
    	document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iphno1").innerHTML ="";
    	document.getElementById("iaddress").innerHTML ="";
    	
    	return false; 
    	}
     if (email.indexOf("@", 0) <= 0)                 
    { 
    	 document.getElementById("iname").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="*email should contain @ atleast a letter before";
    	document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iphno1").innerHTML ="";
        return false; 
    } 
     if(address == "")
  	{
  	document.getElementById("iname").innerHTML ="";
  	document.getElementById("iaddress").innerHTML ="*Please fill address feild";
  	document.getElementById("iusername").innerHTML ="";
  	document.getElementById("inewpass1").innerHTML ="";
  	document.getElementById("iconpass").innerHTML ="";
  	document.getElementById("iphno1").innerHTML ="";
  	return false; 
  	}
   
     if (email.indexOf(".", 0) <= 0)                 
    { 
    	 document.getElementById("iname").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="*Email feild should contain a dot operator";
     	document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iphno1").innerHTML ="";
        return false; 
    } 
     
     if (Uname == "")                                  
     { 
         document.getElementById("iname").innerHTML ="";
     	document.getElementById("iusername").innerHTML ="*please fill the username feild";
     	document.getElementById("inewpass1").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno1").innerHTML ="";
         return false; 
     }
     
     if (npassword == "")                        
     { 
     	document.getElementById("inewpass1").innerHTML ="*please fill the password feild";
     	document.getElementById("iusername").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno1").innerHTML ="";
     	document.getElementById("iname").innerHTML ="";
        return false; 
     }
      if ((npassword.length<8) || (npassword.length > 20))                       
     {
     	 document.getElementById("iname").innerHTML ="";
     	document.getElementById("inewpass1").innerHTML="* Length of password feild must be minimum 8 and maximim of 20";
     	document.getElementById("iusername").innerHTML ="";
     	document.getElementById("inewpass1").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno1").innerHTML ="";
         return false; 
     }
      if (!rpassword.equals(npassword))                        
     { document.getElementById("iname").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="*passwords do not match";
     	document.getElementById("iusername").innerHTML ="";
     	document.getElementById("inewpass1").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno1").innerHTML ="";
         return false; 
     } 
    return true; 
}
</script>
</body>
</html>