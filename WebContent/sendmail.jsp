<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.sendgrid.*,java.util.*,java.sql.*,javax.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	Properties props = new Properties();
	Connection con=null;

	props.put("mail.smtp.host", "smtp.sendgrid.net");
	props.put("mail.smtp.port", "465");
	props.put("mail.smtp.starttls.enable","true");
	props.put("mail.smtp.debug", "true");
	props.put("mail.smtp.auth", "true");
	props.put("mail.smtp.socketFactory.port", "465");
	props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
	props.put("mail.smtp.socketFactory.fallback", "false");

	SendGrid sendgrid = new SendGrid("m_rawat_miet", "ayushdps1");

	SendGrid.Email email = new SendGrid.Email();
	String to=request.getParameter("to");
	email.addTo(to);
	String from="jishnu191@sendgrid.com";
	email.setFrom(from);
	email.setSubject("Message received conformation");
	String msg="<b>MD Ewomen:\n </b> Dear "+request.getParameter("name")+" This is to inform you that we hae received your query It will be responded shortly by our official personals";
	email.setHtml(msg);
	SendGrid.Response res1 = sendgrid.send(email);
	out.println(res1.getMessage());

	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
   con = DriverManager.getConnection(jdbcurl,user,password);

   out.println("connected");
   
   Statement stmt=con.createStatement(); 
   
   {
		 String sqlStatement ="insert into messages(name,from,mesg) values ('"+request.getParameter("name")+"','"+request.getParameter("to")+"','"+request.getParameter("body")+"')";  
	      int i=stmt.executeUpdate(sqlStatement);           
	      if(i==1)
	      {  out.println("executed!");
	                  
	         %><jsp:forward page="index.html"/><% 
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
%>

</body>
</html>