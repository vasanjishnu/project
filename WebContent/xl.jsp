<%@ page language="java" contentType="application/vnd.ms-excel; charset=UTF-8" pageEncoding="UTF-8"%>

<%-- Set the content type header with the JSP directive --%>
                                                                                                                  
<%-- Set the content disposition header --%>
<% response.setHeader("Content-Disposition", "inline; filename=\"analysis_content.xls\""); %>
 <%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>                                                                                                                  
<%Statement stmt=null;

try
{   String email=(String)session.getAttribute("email");
    String name= (String)session.getAttribute("name");
	Connection con= null;int col_no;
	ResultSet res;int row_no;
	Class.forName("com.ibm.db2.jcc.DB2Driver");
	String jdbcurl ="jdbc:db2://yp-dashdb-small-01-lon02.services.eu-gb.bluemix.net:50000/BLUDB";
    String user ="dash120642";
    String password ="Dz3iWPRFJoxd";
    con = DriverManager.getConnection(jdbcurl,user,password);
    stmt=con.createStatement(); 
    
if(((String)request.getParameter("type")).equals("1"))
{
    res= stmt.executeQuery("select count(*) from users ");
    if(res.next()){
    col_no=Integer.parseInt(res.getString(1));}
    row_no=13;
    ResultSet output=stmt.executeQuery("Select * from users");
    
    %><table><tr><td>NAME</td><td>EMAIL</td><td>LOCALITY</td><td>CITY</td><td>STATE</td><td>COUNTRY</td><td>PASSWORD</td><td>CHANGED PASSWORD</td><td>BIRTH MONTH</td><td>BIRTH DAY</td><td>BIRTH YEAR</td><td>GENDER</td><td>PHONE</td> </tr>
<% 	while(output.next()){%>
  <tr>
    <% for(int j = 1; j <= 13; j++)
    { %>
      <td>
        <%
        out.println(output.getString(j));}  %>
      </td>
    <% } %>
  </tr>
<%  %>
</table>
<%}
else if(((String)request.getParameter("type")).equals("2"))
{
    res= stmt.executeQuery("select count(*) from blog ");
    if(res.next()){
        col_no=Integer.parseInt(res.getString(1));}
    row_no=5;
    ResultSet output=stmt.executeQuery("Select * from blog");
    %><table><tr><td>BLOG ID</td><td>EMAIL</td><td>NAME</td><td>TITLE</td><td>BODY</td> </tr>

<% while(output.next()){%>
<tr>

    <% for(int j = 1; j <= 5; j++)
    { %>
      <td>
        <%out.println(output.getString(j)); %>
      </td>
    <% } %>
  </tr>
<% } %>
</table>
<%}
else if(((String)request.getParameter("type")).equals("3"))
{
    res= stmt.executeQuery("select count(*) from poll ");
    if(res.next()){
        col_no=Integer.parseInt(res.getString(1));}
    row_no=11;
    ResultSet output=stmt.executeQuery("Select * from poll");
    %><table><tr><td>POLL ID</td><td>EMAIL</td><td>NAME</td><td>TITLE</td><td>BODY</td><td>OPTION1</td><td>OPTION2</td><td>OPTION3</td><td>OPTION4</td><td>OPTION5</td><td>OPTION6</td> </tr>

<% while(output.next()){%>
<tr>
    <% for(int j = 1; j <= 11; j++)
    { %>
      <td>
        <%out.println(output.getString(j)); %>
      </td>
    <% } %>
  </tr>
<% } %>
</table>
<%}
else if(((String)request.getParameter("type")).equals("4"))
{
    res= stmt.executeQuery("select count(*) from postjob ");
    if(res.next()){
        col_no=Integer.parseInt(res.getString(1));}
    row_no=8;
    ResultSet output=stmt.executeQuery("Select * from postjob");
    %><table><tr><td>EMAIL</td><td>JOB TITLE</td><td>JOB DESCRIPTION</td><td>JOB LOCATION</td><td>MONTH </td><td>DAY</td><td>YEAR</td><td>POST ID</td></tr>

<% while(output.next()){%>
<tr>
   <% for(int j = 1; j <= 8; j++)
    { %>
      <td>
        <%out.println(output.getString(j));%>
      </td>
    <% } %>
  </tr>
<% } %>
</table>
<%}
else if(((String)request.getParameter("type")).equals("5"))
{   Statement stmt2=con.createStatement();
Statement stmt3=con.createStatement();
String id= (String)session.getAttribute("id");
ResultSet noa = stmt.executeQuery("select uemail from applied where jid='"+id+"'");
{
	 while(noa.next())
{String uemail=noa.getString(1);
ResultSet rs=stmt2.executeQuery("select * from users where uemail='"+uemail+"'");
%><table><tr><td>NAME</td><td>EMAIL</td><td>Address</td><td>Phone </td><td>BODY</td> </tr>
<%while (rs.next())
  {%><tr>
   <td> <%out.println(rs.getString(1));%></td>
   <td><%out.println(rs.getString(2));%></td>
   <td><% String add=rs.getString(3)+","+rs.getString(4)+","+rs.getString(5)+","+ rs.getString(6);
   out.println(add);%></td>
   <td><%out.println(rs.getString(13));%></td>
	</tr>
	<%}%>
	</table>
	<%

}}}
}catch(Exception ee){out.println(ee);}%>