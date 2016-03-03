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
	String email=(String)session.getAttribute("email");
	String name=(String)session.getAttribute("name");
	String id=request.getParameter("id");
	int bid=Integer.parseInt(id);
   	try{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con;
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	String user ="dash120642";
	String password ="Dz3iWPRFJoxd";
	    
    con = DriverManager.getConnection(jdbcurl,user,password);
    Statement stmt=con.createStatement();
    Statement stmt2=con.createStatement();
    ResultSet res= stmt.executeQuery("select uemail from applied where jid='"+id+"'");
    {
   	 while(res.next())
    {String uemail=res.getString(1);
    ResultSet rs=stmt2.executeQuery("select * from users where uemail='"+uemail+"'");
    while (rs.next())
    {
    	out.println("<h3>NAME: "+rs.getString(1)+"</h3><br><h3>EMAIL:"+rs.getString(2)+"<br>"+rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+rs.getString(6)+"<br>"+rs.getString(13)+"</h3><br><hr>");
        out.println("<center><div><form method=post action='sendmail2.jsp'><input type= hidden name=id value='"+res.getString(2)+"'> <input type=submit value='Mail the Person' ></form><div>");
    }
    }}
    %>
   <!--  <center><div><form method=post action='xl.jsp'><input type= hidden name=type value='5'><input type= hidden name=id value='<%=id%>'> <input type=submit value='GET EXCEL SHEET FOR ABOVE DATA' ></form><div>
    </center>-->
    
    <%
    }catch(NullPointerException e){}
    catch(Exception ee)
    {
    out.println(ee);
    }%>
</div>

<%@ include file="footer.html" %>

</body>
</html>