
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Register Page</title>
<style> 
valid {                                         
    margin-left: 70px; 
    font-weight: bold ; 
    float: left; 
    clear: left; 
    width: 100px; 
    text-align: left; 
    margin-right: 10px; 
    font-family:sans-serif,bold, Arial, Helvetica; 
    font-size:14px; 
} 
   
div {  
    box-sizing: border-box; 
    width: 100%; 
    border: 1px solid black; 
    float: left; 
    align-content: center; 
    align-items: center; 
} 
   
form {                                         
    margin: 0 auto; 
    width: 600px; 
}</style>
</head>
<body>
<div>
<form onsubmit="return valid()" autocomplete="off" name="CRegister" action="CregisterData" method="post" >

Full name    <input type="text" name="Fname" id="name1"  autocomplete="off" autofocus /><br>
<span id = "iname" class="text-danger"> </span><br>
Username     <input type="text" name="User" id="username" autocomplete="off" /><br>
<span id = "iusername" class="text-danger"> </span><br>
Address      <input type="text" name="address" id="address1" autocomplete="off" /><br>
<span id = "iaddress" class="text-danger"> </span><br>
e-mail       <input type="text" name= "email" id="email" autocomplete="off" /><br>
<span id = "iemail" class="text-danger"> </span><br>
Phone-number <input type="text" name="phno" id="phno" autocomplete="off"  onkeypress="return isNumber(event)"/><br>
<span id = "iphno" class="text-danger"> </span><br>
<span id = "iphno1" class="text-danger"> </span><br>
New-Password <input type="password" name="npass" id="newpass1"  autocomplete="off"/><br>
<span id = "inewpass1" class="text-danger"> </span><br>
Re-Password  <input type="password" name="rpass" id="conpass1" autocomplete="off" /><br>
<span id = "iconpass" class="text-danger"> </span><br>
<input type="submit" value="submit" name="register"/>
</form></div>
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
    var Uname = document.getElementById("username").value;
    var npassword = document.getElementById("newpass1").value;
    var rpassword = document.getElementById("conpass1").value;
    var email = document.getElementById("email").value;
    var address =document.getElementById("address1").value;
    var phno = document.getElementById("phno").value;
    if (Fname == "")                                  
    { 
        document.getElementById("iname").innerHTML ="*please fill the full name feild";
        document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="";
    	document.getElementById("iphno").innerHTML ="";
        return false; 
    }  
    if (Uname == "")                                  
    { 
        document.getElementById("iname").innerHTML ="";
    	document.getElementById("iusername").innerHTML ="*please fill the username feild";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="";
    	document.getElementById("iphno").innerHTML ="";
        return false; 
    }
    if(address == "")
    	{
    	document.getElementById("iname").innerHTML ="";
    	document.getElementById("iaddress").innerHTML ="*Please fill address feild";
    	document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
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
    	document.getElementById("iphno").innerHTML ="";
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
    	document.getElementById("iphno").innerHTML ="";
        return false; 
    } 
     
   
     if (email.indexOf(".", 0) <= 0)                 
    { 
    	 document.getElementById("iname").innerHTML ="";
    	document.getElementById("iemail").innerHTML ="*Email feild should contain a dot operator";
     	document.getElementById("iusername").innerHTML ="";
    	document.getElementById("inewpass1").innerHTML ="";
    	document.getElementById("iconpass").innerHTML ="";
    	document.getElementById("iphno").innerHTML ="";
        return false; 
    } 
     if(phno =="")
    	 {
    	 document.getElementById("iphno1").innerHTML ="*Please fill the phone number";
         document.getElementById("iusername").innerHTML ="";
     	document.getElementById("inewpass1").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno").innerHTML ="";
     	return  false;
    	 }
   
     else if((phno.length<10) || (phno.length>10) )
    	 {
    	 document.getElementById("iphno1").innerHTML ="*Length of phone number must be equal to 10 only";
         document.getElementById("iusername").innerHTML ="";
     	document.getElementById("inewpass1").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno").innerHTML ="";
     	return  false;
    	 }
     
     if (npassword == "")                        
     { 
     	document.getElementById("inewpass1").innerHTML ="*please fill the password feild";
     	document.getElementById("iusername").innerHTML ="";
     	document.getElementById("iconpass").innerHTML ="";
     	document.getElementById("iemail").innerHTML ="";
     	document.getElementById("iphno").innerHTML ="";
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
     	document.getElementById("iphno").innerHTML ="";
         return false; 
     }
      var x=rpassword.localeCompare(npassword);    
      if(x==0)
     {return true;
     } 
      else{
    	  document.getElementById("iname").innerHTML ="";
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