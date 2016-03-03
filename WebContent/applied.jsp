<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
//mailto the person who posted
Connection con = null;
try
{
	String id=request.getParameter("id");
    String uemail= (String)session.getAttribute("email");		
	
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
    String user ="dash120642";
    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);
    
    Statement stmt=con.createStatement();
    int i=stmt.executeUpdate("insert into applied values('"+id+"','"+uemail+"')");
	if(i==1)
	{
		out.write("<script type='text/javascript'>\n");
    	out.write("alert(' Successfully Applied!! ');\n");
    	out.write("setTimeout(function(){window.location.href='dojobs.jsp'},1000);");
    	out.write("</script>\n");	
    }
	else
	{
    out.println("not executed!");
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