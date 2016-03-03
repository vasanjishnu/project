<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<%@ page import="java.sql.*,java.lang.*" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | UPDATES</title>
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
</div>-->
<%if(request.getParameter("title")==null || request.getParameter("body")==null ){
%>
<form method=post action="bpost.jsp">
<table>
<h2>TITLE:</h2><input name=title type=text placeholder="title">
<h2>BODY:</h2><textarea rows=10 cols=500 name=body placeholder="type your matter here"></textarea><br>
<input type= submit value="Post" >
</table>
</form>
<!--typography-page -->
	<div>
	<h2>Help people by sharing your experiences and get help from others by just sharing your problem !! </h2>
	<a href="bpost.jsp"><input type= "submit" value="Post a blog" ></a>
	<a href="brecent.jsp"><input type= "submit" value="View recent blogs" ></a>
	<a href="myblogs.jsp"><input type= "submit" value="My blogs" ></a>
    	
	</div>
<!-- //typography-page -->
<%}
else
{
	try
	{   String email=(String)session.getAttribute("email");
	    String name= (String)session.getAttribute("name");
		String title=request.getParameter("title");
		String body= request.getParameter("body"); 
		Connection con= null;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
		    String user ="dash120642";
		    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	  Statement stmt=con.createStatement(); 
     int i= stmt.executeUpdate("insert into blog(email,name,title,body) values('"+email+"','"+name+"','"+title+"','"+body+"')");
     {
    	 if (i==1)
     {
       %>
      <div> <h3><br><br>Your blog has been successfully posted</h3>. <h3> <a href="myblogs.jsp">See My blogs</a></h3> <% 
     }
     }
	}
	catch(Exception ee)
	{
	    out.println(ee); 	
	}
	
}
%>

</div>

<%@ include file="footer.html" %>

</body>
</html>