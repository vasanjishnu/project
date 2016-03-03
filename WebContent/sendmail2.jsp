<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.sendgrid.*,java.util.*" %>
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
	String to1=request.getParameter("id");
	email1.addTo(to1);
	String from1="jishnu191@sendgrid.com";
	email1.setFrom(from1);
	email1.setSubject(request.getParameter("name"));
	String msg1=request.getParameter("Ewomen MD:<br>"+session.getAttribute("name")+"wants to contact you mail id is<br"+session.getAttribute("email"));
	email1.setHtml(msg1);

	SendGrid.Response res1 = sendgrid.send(email1);
	out.println(res1.getMessage());
   response.sendRedirect("http://ewomen1.eu-gb.mybluemix.net/jobstatus.jsp");
	
	}catch(Exception e){
	out.println(e);
	}
%>

</body>
</html>