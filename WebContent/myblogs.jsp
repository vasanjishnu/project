<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<%@ page import="java.sql.*,java.lang.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | RECENT BLOGS</title>
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

<%
	try
	{   String email=(String)session.getAttribute("email");
	    String name= (String)session.getAttribute("name");
		Connection con= null;
		ResultSet res;Statement stmt;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
		    String user ="dash120642";
		    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	  stmt=con.createStatement(); 
     res= stmt.executeQuery("select * from blog where email='"+email+"'order by id desc");
     {
    	 while(res.next())
     {
     out.println("<h3>"+res.getString(4)+"</h3><br><h4>"+res.getString(5)+"</h4><br><h3>"+res.getString(3)+"</h3><br>");
     out.println("<div><form method=post action='comment.jsp'><input type= hidden name=id value='"+res.getString(1)+"'> <input type=submit value='see post' ></form><div>");
     out.println("<div><form method=post action='delete.jsp'><input type= hidden name=id value='"+res.getString(1)+"'><input type= hidden name=type value='1'> <input type=submit value='delete post' ></form><div>");

     }}
     }catch(Exception ee)
	{
	    out.println(ee); 	
	}
	%>
<a href="bpost.jsp"><input type= "submit" value="Post a blog"></a>
	<a href="brecent.jsp"><input type= "submit" value="View recent blogs"></a>
	<a href="myblogs.jsp"><input type= "submit" value="My blogs"></a>

</div>

<%@ include file="footer.html" %>

</body>
</html>