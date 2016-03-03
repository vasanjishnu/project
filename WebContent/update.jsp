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
	String uname=request.getParameter("name");
	String uemail=request.getParameter("email");
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
	
	out.println(uname);
	out.println(uemail);
	out.println(pass);
	out.println(cpass);
	out.println(bm);
	out.println(bd);
	out.println(by);
	out.println(gender);
	out.println(phone);
	out.println(local);
	out.println(city);
	out.println(country);
	out.println(state);
	
	
	
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
	    String user ="dash120642";
	    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);

    out.println("connected");
    
    Statement stmt=con.createStatement(); 
    ResultSet rs=stmt.executeQuery("select * from USERS where uemail='"+uemail+"'");
	
    out.println("ready to execute!");
    
    
    if(rs.next()==true)
    {
   	
     String sqlStatement ="update users set uname='"+uname+"', ulocality='"+local+"', ucity='"+city+"', ustate='"+state+"', ucountry='"+country+"', upass='"+pass+"', ucpass='"+cpass+"', bmonth='"+bm+"', bday='"+bd+"', byear='"+by+"', ugender='"+gender+"', uphone='"+phone+"' where uemail='"+uemail+"'";
  		         
        int i=stmt.executeUpdate(sqlStatement);  
            
        if(i==1)
        {  String sqlStatement1 ="update login set pass='"+pass+"' where email='"+uemail+"'";
           int j=stmt.executeUpdate(sqlStatement1);
           
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

           
           response.sendRedirect("profile.jsp"); 
         }
       else
        {
        out.println("\n something went wrong");
        }    
     }
    else
    {
    	out.println("not done!");
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