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
<%!String id;	Statement stmt;ResultSet rs;Statement stmt1=null;
 %>
<div>
<%
	String c[]=new String[7];
	String email=(String)session.getAttribute("email");
	String name=(String)session.getAttribute("name");
	id=request.getParameter("id");
	int bid=Integer.parseInt(id);
	try{
		
		if(request.getParameter("option")==null)
		{
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	Connection con;
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
    String user ="dash120642";
    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);
    stmt=con.createStatement(); 
    stmt1=con.createStatement();
    rs= stmt.executeQuery("select * from poll where pid="+bid);
     while(rs.next())
    {
    out.println("<Center><br>"+rs.getString(4)+"<br>"+rs.getString(5)+"<br>"+rs.getString(3)+"<br></center>");
    %><center><form method=post action="pollfin.jsp">
     <%out.println("<input type=hidden name=id value='"+rs.getString(1)+"'>" ); 
    for(int i=6;i<=11;i++)
    {   String test=rs.getString(i);
        
    	if(!test.equals("null")) 
    	{out.println("<input type=radio name=option value='"+(i-5)+"'>"+test+"<br>");
    	c[i-5]=test;
        }
    }out.println("<center><input type=submit value=done></form></center>");
    }
	}
	else
	{
	String com=request.getParameter("option"); 
	ResultSet result=stmt.executeQuery("Select * from poption where uid='"+email+"' and pid="+bid);
    if(result.next())
    {
    	//out.println("<script>alert("+"Sorry!!! you have already taken part in this poll try another ones!!"+")</script>");
    	out.write("<script type='text/javascript'>\n");
    	out.write("alert(' Sorry!!! you have already taken part in this poll try another ones!! ');\n");
    	out.write("setTimeout(function(){window.location.href='dpoll.jsp'},1000);");
    	out.write("</script>\n");    
    }
    else{
    
	stmt1.executeUpdate("insert into poption(pid,option,uid) values("+bid+",'"+com+"','"+email+"')");
	out.println("Poll successful");}
	//out.println("Poll successful");
	}
		for(int i=1;i<=6;i++){
		    if(!c[i].equals("null"))
		    {
		    ResultSet res=stmt.executeQuery("select count(*) from poption where pid="+bid+" and option='"+i+"' ");
		    out.println("Pollcount");
		    if(res.next())
			{
			out.println("<br>"+c[i]+": "+res.getString(1)+"<br><hr width='50%'>");
			}}}}
	catch(NullPointerException e){}
    catch(Exception ee)
    {
    out.println(ee);
    }%>

</div>

<%@ include file="footer.html" %>

</body>
</html>