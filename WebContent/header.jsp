<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="sessionValidate.jsp" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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

</head>
<body data-spy="scroll" data-target=".navbar-collapse" data-offset="50">
<!-- preloader section -->
<div class="preloader">
  <div class="sk-spinner sk-spinner-rotating-plane"></div>
</div>
<!-- navigation section -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="icon icon-bar"></span> <span class="icon icon-bar"></span> <span class="icon icon-bar"></span> </button>
      <a href="#" class="navbar-brand">E-WOMEN</a></div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li>

               <button class="download" id="myP"></button>

				<div class="showcase normal" id="myP1">
					<button></button>
				</div>
				<script>
				    document.getElementById("myP").style.visibility = "hidden";
				    document.getElementById("myP1").style.visibility = "hidden";
				</script>

				<div class="showcase sweet">
					<a class="smoothScroll">LOG OUT</a></li>
		</div>
      </ul>
    </div>
  </div>
</div>

<div style="height:200px; opacity : 0.5px; ">
<%if(((String)(session.getAttribute("email"))).equals("admin@gmail.com"))
	{%>
	<br>
	<h3>Hey!!Admin</h3>
	<h4>Your site is working fine</h4>
	<% 
	}
	else{%>
<br>
<h3><%= session.getAttribute("name") %></h3>
<h4><%= session.getAttribute("email") %></h4>
<%} %>
</div>
<!-- navigation section -->
<div class="navbar navbar-default navbar-static-top" role="navigation">
  <div class="container">
    <div class="navbar-header">
      <button class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="icon icon-bar"></span> <span class="icon icon-bar"></span> <span class="icon icon-bar"></span> </button>
      <a href="#" class="navbar-brand"></a></div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="prohome.jsp" class="smoothScroll">DASHBOARD</a></li>
        <li><a href="profile.jsp" class="smoothScroll">PROFILE</a></li>
        <li><a href="dojobs.jsp" class="smoothScroll">DO JOBS</a></li>
        <li><a href="postjobs.jsp" class="smoothScroll">POST JOBS</a></li>
        <li><a href="poll.jsp" class="smoothScroll">POLLING</a></li>
        <li><a href="blog.jsp" class="smoothScroll">BLOG POST</a></li>
        <li><a href="HTML/index.html" target="_blank"  class="smoothScroll">NGO NETWORK</a></li>
        <li><a href="fund/index.html" target="_blank" class="smoothScroll">GUIDELINES & POLICIES</a></li>
      </ul>
    </div>
  </div>
</div>



<!-- JAVASCRIPT JS FILES -->
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/nivo-lightbox.min.js"></script>
<script src="js/smoothscroll.js"></script>
<script src="js/jquery.sticky.js"></script>
<script src="js/jquery.parallax.js"></script>
<script src="js/wow.min.js"></script>
<script src="js/custom.js"></script>






<script>

document.querySelector('button.download').onclick = function(){
	$("html, body").animate({ scrollTop: $("#download-section").offset().top }, 1000);
};

document.querySelector('.showcase.normal button').onclick = function(){
	alert("Oops... Something went wrong!");
};


document.querySelector('.showcase.sweet a').onclick = function(){
	swal({
		title: "You have sucessfully logged out!",
		text: "See Ya!!",
		timer: 5000,
		showConfirmButton: false
	});   
		setTimeout("location.href = 'logout.jsp';",3000);
};

document.querySelector('ul.examples li.title-text button').onclick = function(){
	swal("Here's a message!", "It's pretty, isn't it?");
};

document.querySelector('ul.examples li.warning.confirm button').onclick = function(){
	swal({
		title: "Are you sure?",
		text: "You will not be able to recover this imaginary file!",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, delete it!',
		closeOnConfirm: false
	},
	function(){
		swal("Deleted!", "Your imaginary file has been deleted!", "success");
	});
};

document.querySelector('ul.examples li.warning.cancel button').onclick = function(){
	swal({
		title: "Are you sure?",
		text: "You will not be able to recover this imaginary file!",
		type: "warning",
		showCancelButton: true,
		confirmButtonColor: '#DD6B55',
		confirmButtonText: 'Yes, delete it!',
		cancelButtonText: "No, cancel plx!",
		closeOnConfirm: false,
		closeOnCancel: false
	},
	function(isConfirm){
    if (isConfirm){
      swal("Deleted!", "Your imaginary file has been deleted!", "success");
    } else {
      swal("Cancelled", "Your imaginary file is safe :)", "error");
    }
	});
};

document.querySelector('ul.examples li.custom-icon button').onclick = function(){
	swal({
		title: "Sweet!",
		text: "Here's a custom image.",
		imageUrl: 'example/images/thumbs-up.jpg'
	});
};

document.querySelector('ul.examples li.message-html button').onclick = function(){
	swal({
		title: "HTML <small>Title</small>!",
		text: 'A custom <span style="color:#F8BB86">html<span> message.',
		html: true
	});
};

document.querySelector('ul.examples li.input button').onclick = function(){
	swal({
		title: "An input!",
		text: 'Write something interesting:',
		type: 'input',
		showCancelButton: true,
		closeOnConfirm: false,
		animation: "slide-from-top",
		inputPlaceholder: "Write something",
	},
	function(inputValue){
		if (inputValue === false) return false;

		if (inputValue === "") {
			swal.showInputError("You need to write something!");
			return false;
		}

		swal("Nice!", 'You wrote: ' + inputValue, "success");

	});
};

document.querySelector('ul.examples li.theme button').onclick = function() {
	swal({
		title: "Themes!",
		text: "Here's the Twitter theme for SweetAlert!",
		confirmButtonText: "Cool!",
		customClass: 'twitter'
	});
};

document.querySelector('ul.examples li.ajax button').onclick = function() {
  swal({
    title: 'Ajax request example',
    text: 'Submit to run ajax request',
    type: 'info',
    showCancelButton: true,
    closeOnConfirm: false,
    showLoaderOnConfirm: true,
  }, function(){
    setTimeout(function() {
      swal('Ajax request finished!');
    }, 2000);
  });
};

</script>

</body>
</html>