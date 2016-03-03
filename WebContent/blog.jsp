<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | BLOG</title>
<!--
ROMNA Template
http://www.templatemo.com/free-website-templates/
-->
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
<!-- preloader section -->
<div class="preloader">
  <div class="sk-spinner sk-spinner-rotating-plane"></div>
</div>

<%@ include file="header.jsp" %>

<!-- <div>

<div>
<h3>LATEST JOBS</h3>
<UL>
	<li></li>
</UL>
</div>

<div>
<h3>JOBS BY ME</h3>
<UL>
	<li></li>
</UL>
</div>

<div>
<h3>MY POLLS</h3>
<UL>
	<li></li>
</UL>
</div>

<div>
<h3>MY BLOG POSTS</h3>
<UL>
	<li></li>
</UL>
</div> -->
<h3>Help people by sharing your experiences and get help from others by just sharing your problem !! </h3>
	<a href="bpost.jsp"><input type= "submit" value="Post a blog" ></a><br>
	<a href="brecent.jsp"><input type= "submit" value="View recent blogs" ></a><br>
	<a href="myblogs.jsp"><input type= "submit" value="My blogs" ></a><br>

</div>

<%@ include file="footer.html" %>

</body>
</html>