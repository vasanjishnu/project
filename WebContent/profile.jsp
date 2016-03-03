<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="sessionValidate.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | PROFILE</title>
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
        <h2>PROFILE</h2>
        <hr>
      </div>
      <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 contact-form wow fadeInUp" data-wow-delay="0.9s">
		<table align="right">
		<tr>
			<td><h3>NAME</h3></td>
			<td><h3><%= session.getAttribute("name") %></h3></td>
		</tr>
		<tr>
			<td><h3>EMAIL</h3></td>
			<td><h3><%= session.getAttribute("email") %></h3></td>
		</tr>
		<tr>
			<td><h3>LOCALITY</h3></td>
			<td><h3><%= session.getAttribute("local") %></h3></td>
		</tr>
		<tr>
			<td><h3>CITY</h3></td>
			<td><h3><%= session.getAttribute("city") %></h3></td>
		</tr>
		<tr>
			<td><h3>STATE</h3></td>
			<td><h3><%= session.getAttribute("state") %></h3></td>
		</tr>
		<tr>
			<td><h3>COUNTRY</h3></td>
			<td><h3><%= session.getAttribute("country") %></h3></td>
		</tr>
		<tr>
			<td><h3>BIRTH DATE</h3></td>
			<td><h3><%= session.getAttribute("bd") %>/<%= session.getAttribute("bm") %>/<%= session.getAttribute("by") %></h3></td>
		</tr>
		<tr>
			<td><h3>GENDER</h3></td>
			<td><h3><%= session.getAttribute("gender") %></h3></td>
		</tr>
		<tr>
			<td><h3>PHONE NUMBER</h3></td>
			<td><h3><%= session.getAttribute("phone") %></h3></td>
		</tr>
		</table>
		<form action="edit.jsp">
		<input type="submit" value="EDIT PROFILE"  class="form-control">
		</form>
      </div>
    </div>
  </div>
</section>

</DIV>



<%@ include file="footer.html" %>


</body>
</html>