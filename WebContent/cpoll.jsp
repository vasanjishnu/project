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


<script language="javascript">
    function enableDisable(bEnable, textBoxID)
    {    
          document.getElementById(textBoxID).disabled = !bEnable

    }
</script>







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

<%if(request.getParameter("title")==null || request.getParameter("body")==null ){
%>
<form action='cpoll.jsp' method=post>
	<h2>TITLE:</h2><input name=title type=text placeholder="title your poll">
    <h2>BODY:</h2><textarea rows=4 cols=500 name=body placeholder="type your poll question here...or write a brief on what poll is about?"></textarea>
    <h2>option1:</h2><input id=t1 name=option1 type=text placeholder="Op1" required="">
    <h2>option2:</h2><input id=t2 name=option2 type=text placeholder="Op2" required="">
    <h2>option3:</h2><input id=t3 name=option3 type=text placeholder="Op3" value="" disabled ><input type="checkbox" id="checkBox" onclick="enableDisable(this.checked, 't3')">
    <h2>option4:</h2><input id=t4 name=option4 type=text placeholder="Op4" value="" disabled ><input type="checkbox" id="checkBox" onclick="enableDisable(this.checked, 't4')">
    <h2>option5:</h2><input id=t5 name=option5 type=text placeholder="Op5"  value="" disabled ><input type="checkbox" id="checkBox" onclick="enableDisable(this.checked, 't5')">
    <h2>option6:</h2><input id=t6 name=option6 type=text placeholder="Op6"  value="" disabled ><input type="checkbox" id="checkBox" onclick="enableDisable(this.checked, 't6')">
     <br><input type= submit value="Post" ></form>

	<a href="dpoll.jsp"><input type=submit value="take part in polls" ></a>
	<%}
     else
    	 try
 	{   String email=(String)session.getAttribute("email");
    String name= (String)session.getAttribute("name");
	String title=request.getParameter("title");
	String op1= request.getParameter("option1");
	String body= request.getParameter("body");
	String op2= request.getParameter("option2");
	String op3= request.getParameter("option3");
	String op4= request.getParameter("option4");
	String op5= request.getParameter("option5");
	String op6= request.getParameter("option6");
	
	Connection con= null;
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
    String user ="dash120642";
    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);
  Statement stmt=con.createStatement(); 
 int i= stmt.executeUpdate("insert into poll(email,name,title,body,op1,op2,op3,op4,op5,op6) values('"+email+"','"+name+"','"+title+"','"+body+"','"+op1+"','"+op2+"','"+op3+"','"+op4+"','"+op5+"','"+op6+"')");
 {
	 if (i==1)
 {
   
   out.println("<h2><br><br>Your blog has been successfully posted .<a href='dpoll.jsp'>See polls</a></h2> ");
    
 }
 }
}
catch(Exception ee)
{
    out.println(ee); 	
}%>

</div>

<%@ include file="footer.html" %>

</body>
</html>