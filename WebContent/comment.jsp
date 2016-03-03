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
	//if(id!=null)
	//{
	int bid=Integer.parseInt(id);
   	String com=request.getParameter("com");
	try{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con;
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    
    con = DriverManager.getConnection(jdbcurl,user,password);
    Statement stmt=con.createStatement(); 
    ResultSet rs= stmt.executeQuery("select * from blog where id="+id);
    {
   	 while(rs.next())
    {
    out.println("<h3>"+rs.getString(4)+"</h3><br>"+rs.getString(5)+"<h4><br>"+rs.getString(3)+"</h4><br>");
    }}
    if(!com.equals(null))
    {
        	stmt.executeUpdate("insert into comment(bid,email,name,comment) values("+bid+",'"+email+"','"+name+"','"+com+"')");
    }

    out.println("<h4><font color=#0000ff>comments</font></h4><br>");
    ResultSet res=stmt.executeQuery("select * from comment where bid="+bid+"");
	while(res.next())
	{
	out.println(res.getString(5)+"<br>-"+res.getString(4)+"<br><hr>");
	}
	}catch(NullPointerException e){}
    catch(Exception ee)
    {
    out.println(ee);
    }%>
    <form action ="comment.jsp" method=post >
    <input type=text name="com" placeholder="Enter your comment">
    <input type= hidden name=id value='<%=id%>'>
    <input type=submit value="done" >
    </form>
	<% //}
    //else{%>
    <!-- <form action ="comment.jsp" method=post >
    <input type=text name="com" placeholder="Enter your comment">
    <input type= hidden name=id value='<%=id%>'>
    <input type=submit value="done" >
    </form>-->
	</div> 

</div>

<%@ include file="footer.html" %>

</body>
</html>