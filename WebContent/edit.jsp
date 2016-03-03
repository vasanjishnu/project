<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="sessionValidate.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | EDIT PROFILE</title>
<!-- STYLESHEET CSS FILES -->

  <script src="https://code.jquery.com/jquery-2.1.3.min.js"></script>

  <!-- This is what you need -->
  <script src="dist/sweetalert-dev.js"></script>
  <link rel="stylesheet" href="dist/sweetalert.css">
  <!--.......................-->









<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/animate.min.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/nivo-lightbox.css">
<link rel="stylesheet" href="css/nivo_themes/default/default.css">
<link rel="stylesheet" href="css/templatemo-style.css">

<script>

function checkyear(){

	var  year= document.getElementById('year').value;
	var n=year.trim().length;
	if(isNaN(year))
	{
		alert("invalid input!!");
		document.joinform.year.focus();
		document.getElementById("year").value = "";

	}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.year.focus();
		document.getElementById("year").value = "";
	}
	else if(n!=4)
	{
		alert("please input a valid year!!");
		document.joinform.year.focus();
		document.getElementById("year").value = "";
	}
}



function flname(){
	var name = document.getElementById('name').value;
	var n=name.trim().length;

	if(!isNaN(name))
	{
		alert("input characters only!!");
		document.joinform.name.focus();
		document.getElementById("name").value = "";

	}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.name.focus();
		document.getElementById("name").value = "";
	}
}
function local(){
	var locality = document.getElementById('locality').value;
	var n=locality.trim().length;
		if(!isNaN(locality))
		{
			alert("input characters only!!");
			document.joinform.locality.focus();
			document.getElementById("locality").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.locality.focus();
		document.getElementById("locality").value = "";
	}
}

function checkcity(){
	var c = document.getElementById("city").value;
	var n=c.trim().length;
		if(!isNaN(c))
		{
			alert("input characters only!!");
			document.joinform.city.focus();
			document.getElementById("city").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.city.focus();
		document.getElementById("city").value = "";
	}
}
function checkstate(){
	var state = document.getElementById('state').value;
	var n=state.trim().length;
		if(!isNaN(state))
		{
			alert("input characters only!!");
			document.joinform.state.focus();
			document.getElementById("state").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.state.focus();
		document.getElementById("state").value = "";
	}
}
function checkcountry(){
	var country = document.getElementById('country').value;
	var n=country.trim().length;
		if(!isNaN(country))
		{
			alert("input characters only!!");
			document.joinform.country.focus();
			document.getElementById("country").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.country.focus();
		document.getElementById("country").value = "";
	}
}
function vpass(){
	var password = document.getElementById('password').value;
	var n=password.trim().length;
	if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.password.focus();
		document.getElementById("password").value = "";
	}
	else if(n<8)
	{
			alert("password must be atleast 8 characters long!!");
			document.joinform.password.focus();
			document.getElementById("password").value = "";
	}
}

function cvpass(){
	var password = document.getElementById('password').value;
	var cpassword = document.getElementById('cpassword').value;
	var n=cpassword.trim().length;
	if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.cpassword.focus();
		document.getElementById("cpassword").value = "";
	}
	else if(password!=cpassword)
	{
		alert("password do not match!");
		document.joinform.cpassword.focus();
		document.getElementById("cpassword").value = "";
	}
}

function checkday(){
	var day = document.getElementById('day').value;
	var n=day.trim().length;
		if(isNaN(day))
		{
			alert("invalid day!!");
			document.joinform.day.focus();
			document.getElementById("day").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.day.focus();
		document.getElementById("day").value = "";
	}
}

function ph(){
	var phone = document.getElementById('phone').value;
	var n=phone.trim().length;
		if(isNaN(phone))
		{
			alert("invalid phone number!!");
			document.joinform.phone.focus();
			document.getElementById("ph").value = "";

		}
	else if(n==0)
	{
		alert("please input some alphabets!!");
		document.joinform.phone.focus();
		document.getElementById("ph").value = "";
	}
	else if(n!=10)
		{
			alert("invalid phone number!!");
			document.joinform.phone.focus();
			document.getElementById("ph").value = "";

		}
}

function valid()
{
flname();
local();
city();
state();
country();
vpass();
day();
date();
ph();
}


</script>


</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">





<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>


<!-- preloader section -->
<div class="preloader">
  <div class="sk-spinner sk-spinner-rotating-plane"></div>
</div>

<%@ include file="header.jsp" %>

<DIV>

<section id="contact">
  <div class="container">
    <div class="row">
      <div class="col-md-offset-3 col-md-6 col-md-offset-3  col-sm-offset-2 col-sm-8 col-sm-offset-2 title">
        <h2>EDIT PROFILE</h2>
        <hr>
      </div>
      <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 contact-form wow fadeInUp" data-wow-delay="0.9s">
        <form action="update.jsp" method="post" name="joinform">


		    			<input id="name" name="name" type="text" class="form-control" value="<%= session.getAttribute("name") %>" onblur="flname()">


		    			<input type="text" id="email" class="form-control" value="<%= session.getAttribute("email")%>" disabled>


		    			<input id="locality" name="locality"  type="text" class="form-control" value="<%=session.getAttribute("local") %>" onblur="local()">


		    			<input id="city" name="city" type="text" class="form-control" value="<%= session.getAttribute("city") %>" onblur="checkcity()">


		    			<input id="state" name="state" type="text" class="form-control" value="<%= session.getAttribute("state") %>" onblur="checkstate()">


		    			<input id="country" name="country" type="text" class="form-control" value="<%= session.getAttribute("country") %>" onblur="checkcountry()">


		    			<input type="password" id="password" name="password" class="form-control" value="<%= session.getAttribute("pass") %>" onblur="vpass()">

		    			<input type="password" id="cpassword" name="cpassword" class="form-control" value="<%= session.getAttribute("cpass") %>" onblur="cvpass()">


		                  <input id="birthmonth" name="BirthMonth" type="text" class="form-control" value="<%= session.getAttribute("BirthMonth") %>">
		                  
		                  
		                  
                          <input type="hidden" value="<%= session.getAttribute("BirthMonth")%>" name="BirthMonth">

		                <input  class="form-control" maxlength="2" name="day" id="day" onblur="checkday()" value="<%= session.getAttribute("bd") %>"></label>
		                <input  class="form-control" maxlength="4" name="year" id="year" onblur="checkyear()" value="<%= session.getAttribute("by") %>"></label>
  
                          <input id="gendercon" name="gendercon" type="hidden" class="form-control" value="<%= session.getAttribute("gender") %>" onblur="checkcity()" disabled >
                          <input type="hidden" value="<%= session.getAttribute("gender")%>" name="gender">
		             <% if(((String)session.getAttribute("gender")).equals("male")){ %>     
		            <select  class="form-control" name="gender" value="<%= session.getAttribute("gender")%>">
		            <option  disabled>i am..</option>
		            <option value="male" selected>Male</option>
		            <option value="female">Female</option>
		            <option value="others">Other</option>
		            </select>
                 <% }
                 else if(((String)session.getAttribute("gender")).equals("female")) {%>
                 <select  class="form-control" name="gender" value="<%= session.getAttribute("gender")%>">
		            <option  disabled>i am..</option>
		            <option value="male" >Male</option>
		            <option value="female" selected>Female</option>
		            <option value="others">Other</option>
		            </select>
		            <%} 
		           
                 else {%>
                 <select  class="form-control" name="gender" value="<%= session.getAttribute("gender")%>">
		            <option  disabled>i am..</option>
		            <option value="male" >Male</option>
		            <option value="female" >Female</option>
		            <option value="others" selected>Other</option>
		            </select>
		            <%} %>
                 

		            <input id="phone" name="phone" type="text"  class="form-control" onblur="ph()" value="<%= session.getAttribute("phone") %>"> <br>
					<input type="hidden" value="<%= session.getAttribute("email")%>" name="email">
                   <!--  				<input type="hidden" value="<%= session.getAttribute("BirthMonth")%>" name="BirthMonth">--> 	
                   
                    
          <input type="submit" class="form-control" value="UPDATE" onclick="valid()">
        </form>
      </div>
    </div>
  </div>
</section>

</DIV>




<%@ include file="footer.html" %>

</body>
</html>