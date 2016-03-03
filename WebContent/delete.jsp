<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,java.lang.*" %>
<%@ include file="sessionValidate.jsp" %>
<%  String email=(String)session.getAttribute("email");
String name= (String)session.getAttribute("name");
Connection con= null;
ResultSet res;Statement stmt;
Class.forName("com.ibm.db2.jcc.DB2Driver");
 String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
    String user ="dash120642";
    String password ="Dz3iWPRFJoxd";
con = DriverManager.getConnection(jdbcurl,user,password);
stmt=con.createStatement(); 
String id=request.getParameter("id");
int bid= Integer.parseInt(id);
   String type=(String)request.getParameter("type");
   if(type.equals("1"))
   {
	   stmt.executeUpdate("delete from blog where id="+id);
	   stmt.executeUpdate("delete from comment where bid="+id);
       response.sendRedirect("myblogs.jsp");
   }
   else if(type.equals("2"))
   {
	   stmt.executeUpdate("delete from poll where pid="+id);
	   stmt.executeUpdate("delete from poption where pid="+id);
	   response.sendRedirect("mypoll.jsp");
   }
   else if(type.equals("3"))
   {
	   stmt.executeUpdate("delete from postjob where postid="+id);
	   stmt.executeUpdate("delete from applied where jid="+id);
	   response.sendRedirect("prohome.jsp");
   }
%>	   
