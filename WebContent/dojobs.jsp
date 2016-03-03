<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | DO JOBS</title>
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
<script type="text/javascript">
function monthnl()
{
	
}
function daynl()
{
	
}
function yearnl()
{
	
}
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<%@ page import="java.sql.*,java.lang.*" %>
<!-- preloader section -->
<div class="preloader">
  <div class="sk-spinner sk-spinner-rotating-plane"></div>
</div>

<%@ include file="header.jsp" %>



	<%
	
	try
	{   String email=(String)session.getAttribute("email");
	    String name= (String)session.getAttribute("name");	    
		String city=(String)session.getAttribute("city");
	    String id;
	    Connection con= null;
		ResultSet res,res1;
		Statement stmt=null,stmt2=null;
		Class.forName("com.ibm.db2.jcc.DB2Driver");
	     String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";

	    con = DriverManager.getConnection(jdbcurl,user,password);
	  
	    stmt=con.createStatement();	  
	    stmt2=con.createStatement();	  
	    
     res= stmt.executeQuery("select * from postjob where jloc='"+city+"' order by postid desc ");
     {
    	while(res.next())
     {
     out.println("<h4>TITLE : "+res.getString(3)+"<br> DUE DATE : "+res.getString(6)+"/"+res.getString(7)+"/"+res.getString(8)+" LOCATION : </h4>"+res.getString(5)+"<br><H4>DESCRIPTION:</H4>"+res.getString(4)+"<h4>PAY:"+res.getString(9)+"</h4>");
     
     id=res.getString(1);
     //int inid=Integer.parseInt(id);//get id from postjob table respective to the displayed job
     res1= stmt2.executeQuery("select * from applied where jid='"+id+"' and uemail='"+email+"'"); //selecting if the person has applied for the specific job
	
     if(res1.next())	//if the person has alredy applied there will be a result
     {
    	 out.println("APPLIED");
     }
     else	// if not applied yet then applied button shown
     {
    	 out.println("<form method=post action='applied.jsp'><input type= hidden name=id value='"+res.getString(1)+"'> <input type=submit value='APPLY'></form><hr>");	 
     }
     
     }
    }
     }catch(Exception ee)
	{
	    out.println(ee); 	
	}
	%>



<%@ include file="footer.html" %>

</body>
</html>