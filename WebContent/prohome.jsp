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


<Center><table border='1'><tr><div><%
	Statement stmt=null;
	try
	{   String email=(String)session.getAttribute("email");
	    String name= (String)session.getAttribute("name");
		Connection con= null;
		ResultSet res;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	    stmt=con.createStatement(); 
        		
	
	%></center></div>

<td><a href="mypoll.jsp"><div><center>
      <%
        ResultSet res1= stmt.executeQuery("select count(*) from poll where email= '"+email+"'");
      if(res1.next()){
        %><h4>No. of polls</h4><br><h3><%=res1.getString(1) %></h3><br><h5>click to view</h5></center></a></td>
<%} %>
<td><a href="#myjobs"><div><center>
<%
        ResultSet res2= stmt.executeQuery("select count(*) from postjob where uemail='"+email+"'");
if(res2.next()){
        %><h4>No. of Jobs Still left vacant</h4><br><h3><%=res2.getString(1) %></h3><br><h5>click to view</h5></center></div></a></td>
<%} %>
<td><a href="myblogs.jsp"><div><center>
<%
        ResultSet res3= stmt.executeQuery("select count(*) from blog where email='"+email+"'");
if(res3.next()){
        %><h4>No. of Blogs</h4><br><h3><%=res3.getString(1) %></h3><br><h5>click to view</h5></center></div></a></td>
</tr></table></Center>
<div>
<h3>LATEST JOBS</h3><%
        ResultSet jobs= stmt.executeQuery("select * from postjob order by postid desc");
if(jobs.next()){
         out.println("<h4>TITLE : "+jobs.getString(3)+" <br>DUE DATE : "+jobs.getString(6)+"/"+jobs.getString(7)+"/"+jobs.getString(8)+" <br>LOCATION : </h4>"+jobs.getString(5)+"<br><H4>DESCRIPTION:</H4>"+jobs.getString(4)+"<h4>PAY:"+jobs.getString(9)+"</h4>");
     //out.println("<form method=post action='applied.jsp'><input type= hidden name=id value='"+jobs.getString(1)+"'> <input type=submit value='APPLY'></form><hr>");
} %>
<br><a href="dojobs.jsp"><h5>click to participate in more</h5></a>

</div>

<div id="myjobs">
<h3>JOBS BY YOU</h3>
  <% ResultSet myjobs= stmt.executeQuery("select * from postjob where uemail='"+email+"' order by postid desc");
if(myjobs.next())
         {
         out.println("<h4>TITLE : "+myjobs.getString(3)+"<br> DUE DATE : "+myjobs.getString(6)+"/"+myjobs.getString(7)+"/"+myjobs.getString(8)+"<br> LOCATION : </h4>"+myjobs.getString(5)+"<br><H4>DESCRIPTION:</H4>"+myjobs.getString(4)+"<h4>PAY:"+myjobs.getString(9)+"</h4>");
         out.println("<form method=post action='jobstatus.jsp'><input type= hidden name=id value='"+myjobs.getString(1)+"'> <input type=submit value='SEE STATUS'></form><hr>");
         out.println("<div><form method=post action='delete.jsp'><input type= hidden name=id value='"+myjobs.getString(1)+"'><input type= hidden name=type value='3'> <input type=submit value='delete post' ></form><div>");
         }%>
</div>




<%}}catch(Exception ee)
	{
    out.println(ee); 	
} %>
<%@ include file="footer.html" %>

</body>
</html>