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
	String email=(String)request.getParameter("email");


	session.setAttribute("email",email);


	String pwd=(String)request.getParameter("pass");

	if(email.equals("admin@gmail.com")&&pwd.equals("ewomenadmin"))
	{   session.setAttribute("name","admin");
	    session.setAttribute("email","admin@gmail.com");
		response.sendRedirect("admin.jsp");
	}
	out.println(pwd);

	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
con = DriverManager.getConnection(jdbcurl,user,password);


  Statement stmt=con.createStatement();
  
  
  ResultSet rs=stmt.executeQuery("select * from LOGIN where email='"+email+"'");
  out.println("connected1");

  if(rs.next())
  {		
	  
	  if(rs.getString(2).equals(pwd))
	  {
		  out.println("are we here?");
		  ResultSet res=stmt.executeQuery("select * from users where uemail='"+email+"'");
		  out.println("users table done.");
		  if(res.next())
		  {
		  String uname=res.getString(1);
		  String uemail=res.getString(2);
		  String local=res.getString(3);
		  String city=res.getString(4);
		  String state=res.getString(5);
		  String country=res.getString(6);
		  String pass=res.getString(7);
		  String cpass=res.getString(8);
		  String bm=res.getString(9);
		  String bd=res.getString(10);
		  String by=res.getString(11);
		  String gender=res.getString(12);
		  String phone=res.getString(13);
		  
			

	    session.setAttribute("name",uname);
	    session.setAttribute("email",uemail);
	    session.setAttribute("local",local);
	    session.setAttribute("city",city);
	    session.setAttribute("state",state);
	    session.setAttribute("country",country);
	    session.setAttribute("pass",pass);
	    session.setAttribute("cpass",cpass);
	    session.setAttribute("bm",bm);
	    session.setAttribute("bd",bd);
	    session.setAttribute("by",by);
	    session.setAttribute("gender",gender);
	    session.setAttribute("phone",phone);
	
	    out.println("session attribute set.");
		response.sendRedirect("prohome.jsp");
		  }
	  }
	  else
	  {
		  out.println("password do not match.");
	  }	  
  }
  
}
catch(Exception ee)
{out.println(ee);}
finally
{}
%>

</body>
</html>