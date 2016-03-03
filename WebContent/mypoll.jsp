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

<div>

<%
	
	try
	{   String email=(String)session.getAttribute("email");
	    String name= (String)session.getAttribute("name");
		Connection con= null;
		ResultSet res;Statement stmt=null,stmt1=null;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	  stmt=con.createStatement(); stmt1=con.createStatement(); 
     res= stmt.executeQuery("select * from poll where email='"+email+"'");
     {
    	 while(res.next())
     {
     out.println("<h3>"+res.getString(4)+"</h3><h4>Body:"+res.getString(5)+"</h4><br><h5>By:"+res.getString(3)+"</h5><br><hr>");
     out.println("<form method=post action='pollfin.jsp'><input type= hidden name=id value='"+res.getString(1)+"'> <input type=submit value='Participate'></form><hr>");
     out.println("<div><form method=post action='delete.jsp'><input type=hidden name=id value='"+res.getString(1)+"'><input type= hidden name=type value='2'> <input type=submit value='delete post' ></form><div>");
     int bid=Integer.parseInt(res.getString(1));   
     String c[]=new String[7];
    	 for(int i=1;i<=6;i++){
    		 c[i]=res.getString(i+5);
 		    if(!c[i].equals("null"))
 		    {
 		    ResultSet res1=stmt1.executeQuery("select count(*) from poption where pid="+bid+" and option='"+i+"' ");
 		    out.println("Pollcount");
 		    if(res1.next())
 			{
 			out.println("<br>"+c[i]+": "+res1.getString(1)+"<br><hr width='50%'>");
 			}}}}}
     }catch(Exception ee)
	{
	    out.println(ee); 	
	}
	%>
	<a href="dpoll.jsp"><input type=submit value="take part in polls" class="form-control"></a>
	<a href="cpoll.jsp"><input type=submit value="create your own poll" class="form-control"></a>
	</div>

</div>

<%@ include file="footer.html" %>

</body>
</html>