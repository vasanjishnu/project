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
Connection con = null;
try
{
	String title=request.getParameter("title");
	String desc=request.getParameter("desc");
	String postloc=request.getParameter("postlocal");
	String dm=request.getParameter("dmonth");
	String dd=request.getParameter("dday");
	String dy=request.getParameter("dyear");
	String uemail=request.getParameter("email");
	String pay=request.getParameter("amt");
	
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
	    con = DriverManager.getConnection(jdbcurl,user,password);

    out.println("connected");
    
    Statement stmt=con.createStatement();
    
    String sqlStatement1="insert into postjob(uemail,jtitle,jdesc,jloc,dmon,dday,dyear,pay) values('"+uemail+"','"+title+"','"+desc+"','"+postloc+"','"+dm+"','"+dd+"','"+dy+"','"+pay+"')";

    int i=stmt.executeUpdate(sqlStatement1);
	if(i==1)
	{
		out.println("posted!");
        %><jsp:forward page="prohome.jsp"/><%
	}
	else
	{
    out.println("something went wrong!");
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