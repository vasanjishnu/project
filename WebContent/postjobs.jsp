<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>E-WOMEN | POST JOBS</title>
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
<script type="text/javascript">
function monthnl()
{
	
}
function daynl()
{
	
}
function yearnl()
{
	
}
</script>
</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<!-- preloader section -->
<div class="preloader">
  <div class="sk-spinner sk-spinner-rotating-plane"></div>
</div>

<%@ include file="header.jsp" %>

<!-- contact section -->
<section id="contact">
  <div class="container">
    <div class="row">
      <div class="col-md-offset-3 col-md-6 col-md-offset-3  col-sm-offset-2 col-sm-8 col-sm-offset-2 title">
        <h2>POST JOBS</h2>
        <hr>
        <p>Give a Title to the job you want done with a description.</p>
      </div>
      <div class="col-md-offset-3 col-md-6 col-sm-offset-2 col-sm-8 contact-form wow fadeInUp" data-wow-delay="0.9s">
        <form action="postit.jsp" method="post" name="postjobform">
          <input type="text" name="title" class="form-control" placeholder="TITLE" required>
          <input type="text" name="postlocal" class="form-control" placeholder="LOCATION (OPTIONAL)" value="<%=session.getAttribute("local")%>">
          <textarea name="desc" class="form-control" placeholder="DESCRIPTION" rows="6" required></textarea>
          <select  class="form-control" name="dmonth" required onblur="monthnl()">
		                  <option value="" disabled selected>Due Month</option>
		                  <option  value="01">January</option>
		                  <option value="02">February</option>
		                  <option value="03" >March</option>
		                  <option value="04">April</option>
		                  <option value="05">May</option>
		                  <option value="06">June</option>
		                  <option value="07">July</option>
		                  <option value="08">August</option>
		                  <option value="09">September</option>
		                  <option value="10">October</option>
		                  <option value="11">November</option>
		                  <option value="12" >December</option>
		                 </select>

		                <input  class="form-control" maxlength="2" name="dday" id="dday" value="" placeholder="Day" required="" onblur="daynl()"></label>
		                <input  class="form-control" maxlength="4" name="dyear" id="dyear" value="" placeholder="Year" required="" onblur="yearnl()"></label>
		                <input  class="form-control" name="amt" id="amt" value="" placeholder="Maximum Paying Amount" required="" onblur="amt()"></label>
  						
  						<input type="hidden" value="<%= session.getAttribute("email")%>" name="email">        
          
          <input type="submit" class="form-control" value="POST JOB">
        </form>
      </div>
    </div>
  </div>
</section>

<%@ include file="footer.html" %>

</body>
</html>