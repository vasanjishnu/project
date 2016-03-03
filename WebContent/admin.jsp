<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<%@ page import="java.sql.*,java.lang.*" %>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | ADMIN</title>
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

<div>

<center><h2>Site Analysis</h2><%
	Statement stmt=null;
	String us=null,db=null,dp=null,dj=null;

try
	{   String email=(String)session.getAttribute("email");
	    us=request.getParameter("user");
	    dj=request.getParameter("deljob");
	    dp=request.getParameter("delpoll");
	    db=request.getParameter("delblog");
	    String name= (String)session.getAttribute("name");
		Connection con= null;
		ResultSet res,rs;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	    stmt=con.createStatement(); 
	    
	    if(!us.equals(null))
		{
		rs=stmt.executeQuery("Select * from login where email='"+us+"'");	
		if(rs.next())
		{
			stmt.executeUpdate("delete from login where email='"+us+"'");
		     
			%>			
			<script>	alert("successful");
			</script><%
					
		}
		else 
		{
			%>			
			<script>	alert("Username not found in database");
			</script><%
			
			
		}}
		 if(!db.equals(null))
			{
			rs=stmt.executeQuery("Select * from blog where id="+db);	
			if(rs.next())
			{
				stmt.executeUpdate("delete from blog where id="+db);
			     
				%>			
				<script>	alert("successful");
				</script><%
						
			}
			else 
			{
				%>			
				<script>	alert("Blog id not found in database");
				</script><%
				
				
			}}
			 if(!dp.equals(null))
				{
				rs=stmt.executeQuery("Select * from poll where pid="+dp);	
				if(rs.next())
				{
					stmt.executeUpdate("delete from poll where pid="+dp);
				     
					%>			
					<script>	alert("successful");
					</script><%
							
				}
				else 
				{
					%>			
					<script>	alert("poll id not found in database");
					</script><%
					
					
				}}
				 if(!dj.equals(null))
					{
					rs=stmt.executeQuery("Select * from postjob where postid="+dj);	
					if(rs.next())
					{
						stmt.executeUpdate("delete from postjob where postid="+dj);
					     
						%>			
						<script>	alert("successful");
						</script><%
								
					}
					else 
					{
						%>			
						<script>	alert("job id not found in database");
						</script><%
						
						
					
					
		
		
					}
		}
		
	    
	    
	    
				 Class.forName("com.ibm.db2.jcc.DB2Driver");
					 jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
				     user ="dash120642";
				     password ="Dz3iWPRFJoxd";
				    con = DriverManager.getConnection(jdbcurl,user,password);
	    
				 stmt=con.createStatement();  
	    
	    
        res= stmt.executeQuery("select count(*) from users ");
        if(res.next()){
        %><h4>No. of users</h4><br><h3><%=res.getString(1)%></h3><%
        		}
	
	%></center></div>

<div><center>
      <%
        ResultSet res1= stmt.executeQuery("select count(*) from poll ");
      if(res1.next()){
        %><h4>No. of polls</h4><br><h3><%=res1.getString(1) %></h3></center></div>
<%} %>
<div><center>
<%
        ResultSet res2= stmt.executeQuery("select count(*) from postjob ");
if(res2.next()){
        %><h4>No. of Jobs Still left vacant</h4><br><h3><%=res2.getString(1) %></h3></center></div>
<%} %>
<div><center>
<%
        ResultSet res3= stmt.executeQuery("select count(*) from blog ");
if(res3.next()){
        %><h4>No. of Blogs</h4><br><h3><%=res3.getString(1) %></h3></center></div>
<%}}
catch(NullPointerException ee)
{
	
}

catch(Exception ee)
	{
    out.println(ee); 	
} %>
<div>
<center><h3>Analyse the site services and viewers through Excel sheets</h3>
<hr/><div><form method=post action='xl.jsp'><input type= hidden name=type value='1'> <input type=submit value='GET USERS DATA' ></form><div>
<hr/><div><form method=post action='xl.jsp'><input type= hidden name=type value='4'> <input type=submit value='GET JOBS DATA' ></form><div>
<hr/><div><form method=post action='xl.jsp'><input type= hidden name=type value='3'> <input type=submit value='GET POLLING DATA' ></form><div>
<hr/><div><form method=post action='xl.jsp'><input type= hidden name=type value='2'> <input type=submit value='GET BLOG DATA'></form><div>      
</center></div>


<div>
<center><h3>
Delete User</h3>

<form method=post action='admin.jsp'><input type=text name=user placeholder="type username"><input type=submit></form>
<h3>Delete blog</h3>
<form method=post action='admin.jsp'><input type=text name=delblog placeholder="type bkog id"><input type=submit></form>
<h3>Delete job</h3>
<form method=post action='admin.jsp'><input type=text name=deljob placeholder="type job id"><input type=submit></form>
<h3>Delete poll</h3>
<form method=post action='admin.jsp'><input type=text name=delpoll placeholder="type poll id"><input type=submit></form>

</center> 
<h1>Respond to Pending mails</h1>
<%
	Statement stmt1;
	

try
	{   String email=(String)session.getAttribute("email");
	   
	    String name= (String)session.getAttribute("name");
		Connection con= null;
		ResultSet res1;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
		String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);
	    stmt1=con.createStatement(); 
	   
		res1=stmt1.executeQuery("Select * from messages");	
		if(res1.next())
		{
			 
			%>			<h4>Name:<br><%=res1.getString(2) %><br><h4>Email<br><%=res1.getString(3) %><br>Message:<br><%=res1.getString(4) %></h4>
			<hr>
			
			
			
			</center></div>


<%}	}catch(Exception ee){
out.println(ee);
}%>



<form action="sendmail1.jsp" method="post">
          <input type="text" class="form-control" placeholder="Name" name="name">
          <input type="email" class="form-control" placeholder="Email" name="to">
          <textarea class="form-control" placeholder="Message" rows="6" name="messsage"></textarea>
          <input type="submit" class="form-control" value="SEND EMAIL">
        </form>



</div>

<%@ include file="footer.html" %>

</body>
</html>