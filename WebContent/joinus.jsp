<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.sendgrid.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
Connection con = null;
try
{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pass=request.getParameter("password");
	String cpass=request.getParameter("cpassword");
	String bm=request.getParameter("BirthMonth");
	String bd=request.getParameter("day");
	String by=request.getParameter("year");
	String gender=request.getParameter("gender");
	String phone=request.getParameter("phone");
	String local=request.getParameter("locality");
	String city=request.getParameter("city");
	String country=request.getParameter("country");
	String state=request.getParameter("state"); 
	
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);

    out.println("connected");
    
    Statement stmt=con.createStatement(); 
    ResultSet rs=stmt.executeQuery("select * from login where email='"+email+"'");
	
    out.println("ready to execute!");
    
    if(rs.next()==true)
    {
   	 out.println("\n user already exist");
   	%><jsp:forward page="error.html"/><% 
    }
   else
    {
		 String sqlStatement ="insert into users values ('"+name+"','"+email+"','"+local+"','"+city+"','"+state+"','"+country+"','"+pass+"','"+cpass+"','"+bm+"','"+bd+"','"+by+"','"+gender+"','"+phone+"')";  
	      int i=stmt.executeUpdate(sqlStatement);           
	      if(i==1)
	      {  String sqlStatement2 ="insert into login values ('"+email+"','"+pass+"')";  
	         int j=stmt.executeUpdate(sqlStatement2); 
	         out.println("executed!");
	         
	         Properties props = new Properties();

	     	props.put("mail.smtp.host", "smtp.sendgrid.net");
	     	props.put("mail.smtp.port", "465");
	     	props.put("mail.smtp.starttls.enable","true");
	     	props.put("mail.smtp.debug", "true");
	     	props.put("mail.smtp.auth", "true");
	     	props.put("mail.smtp.socketFactory.port", "465");
	     	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	     	props.put("mail.smtp.socketFactory.fallback", "false");

	     	SendGrid sendgrid = new SendGrid("jishnu191", "vasan123");

	     	SendGrid.Email email1 = new SendGrid.Email();
	     	String to=email;
	     	email1.addTo(to);
	     	String from="jishnu191@sendgrid.com";
	     	email1.setFrom(from);
	     	email1.setSubject("Message received conformation");
	     	String msg="MD Ewomen:\n <b> Dear "+request.getParameter("name")+" This is to inform you that your credentials are ,<br>Username:<b>"+email+"</b><br>Password:<b>"+pass+"<br> follow the link to login or use website navigation<br><a href='http://ewomenfinal.eu-gb.mybluemix.net/login.html'>Login to Ewomen</a>";
	     	email1.setHtml(msg);

	     	SendGrid.Response res = sendgrid.send(email1);
	     	out.println(res.getMessage());


	     	
	     	
	         
	         
	         
	         
	         %><jsp:forward page="afterjoinuslogin.html"/><% 
	       }
	     else
	      {
	    	 %><jsp:forward page="error.html"/><% 
	      }
    }
    
    
    
    
    
    
    
    
    
    
}
  catch(Exception ee)
{
	  out.println(ee);
}
finally
{}
%>

</body>
</html>