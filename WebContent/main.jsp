<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<!--bootstrap-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen" title="no title" charset="utf-8" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>




<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>

	<!-- Header -->
	<header id="header">

		<!-- Logo -->
		<!--<h1 id="logo"><a href="index.jsp"><pre>∑ π</pre></a></h1>-->

		<!-- Nav -->

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar junseok10" data-toggle="collapse"data-target=".nav-collapse">
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
						<span class="icon-bar"> </span>
					</a>
					<a id="logo" class="brand" href="main.jsp"><h1
							class="junseok1">∑ π</h1></a>
					<div class="nav-collapse collapse junseok11">
						<ul class="nav pull-right">
							<!--
							<%
								if (session.getAttribute("memEmail") == null) {
							%>
								<script language="JavaScript">
									if(!alert("로그인 정보가 없습니다."))
										location.replace("index.jsp");
								</script>
							<%
								} else {
							%>
							<li><a class="font_HYNAML" href="signout.jsp">&lt; <%=session.getAttribute("memEmail")%>님
									환영합니다. &gt;
							</a></li>
							<%
								}
							%>
							-->
							<li class="active"><a href="main.jsp">Home</a></li>
							<li><a href="changeInfo.jsp">Change Info</a></li>
							<li><a href="how.jsp">How To</a></li>
							<li><a href="play.jsp">Play With</a></li>
							<li><a href="contact.jsp">Contact</a></li>
						</ul>	
					</div>
				</div>
			</div>
		</div>
	</header>

	<!-- Intro -->
			<section id="intro" class="main style1 dark fullscreen">
				<div class="content container small">
					<header>
						<h2>Hey.</h2>
					</header>
					<p>Welcome to <strong>Big Picture</strong> a responsive site template designed
					by, built on skelJS,
					and released for free under the Creative Commons Attribution 3.0 license.</p>
					<footer>
						<a href="#one" class="button style2 down">More</a>
					</footer>
				</div>
			</section>
		
		<!-- One -->
			<section id="one" class="main style2 right dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>What I Do</h2>
					</header>
					<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum. 
					Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu, 
					id varius justo euismod in. Curabitur egestas consectetur magna urna.</p>
				</div>
				<a href="#two" class="button style2 down anchored">Next</a>
			</section>
		
		<!-- Two -->
			<section id="two" class="main style2 left dark fullscreen">
				<div class="content box style2">
					<header>
						<h2>Who I Am</h2>
					</header>
					<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum. 
					Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis arcu, 
					id varius justo euismod in. Curabitur egestas consectetur magna urna.</p>
				</div>
				<a href="#work" class="button style2 down anchored">Next</a>
			</section>
			
		<!-- Work -->
			<section id="work" class="main style3 primary">
				<div class="content container">
					<header>
						<h2>My Work</h2>
						<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas dolore condimentum. 
						Fusce blandit ultrices sapien, in accumsan orci rhoncus eu. Sed sodales venenatis 
						arcu, id varius justo euismod in. Curabitur egestas consectetur magna vitae urna.</p>
					</header>
					
					<!--
						 Lightbox Gallery
						 
						 Powered by poptrox. Full docs here: https://github.com/n33/jquery.poptrox
					-->
						<div class="container small gallery">
							<div class="row flush images">
								<div class="6u"><a href="images/fulls/01.jpg" class="image full l"><img src="images/thumbs/01.jpg" title="The Anonymous Red" alt="" /></a></div>
								<div class="6u"><a href="images/fulls/02.jpg" class="image full r"><img src="images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a></div>
							</div>
							<div class="row flush images">
								<div class="6u"><a href="images/fulls/03.jpg" class="image full l"><img src="images/thumbs/03.jpg" title="Air Lounge" alt="" /></a></div>
								<div class="6u"><a href="images/fulls/04.jpg" class="image full r"><img src="images/thumbs/04.jpg" title="Carry on" alt="" /></a></div>
							</div>
							<div class="row flush images">
								<div class="6u"><a href="images/fulls/05.jpg" class="image full l"><img src="images/thumbs/05.jpg" title="The sparkling shell" alt="" /></a></div>
								<div class="6u"><a href="images/fulls/06.jpg" class="image full r"><img src="images/thumbs/06.jpg" title="Bent IX" alt="" /></a></div>
							</div>
						</div>
				</div>
			</section>
		
		<!-- Footer -->
		<footer id="footer">

		<!--
				     Social Icons
				     
				     Use anything from here: http://fortawesome.github.io/Font-Awesome/cheatsheet/)
				-->
		<ul class="actions">
			<li><a href="#" class="fa solo fa-twitter"><span>Twitter</span></a></li>
			<li><a href="#" class="fa solo fa-facebook"><span>Facebook</span></a></li>
			<li><a href="#" class="fa solo fa-google-plus"><span>Google+</span></a></li>
			<li><a href="#" class="fa solo fa-dribbble"><span>Dribbble</span></a></li>
			<li><a href="#" class="fa solo fa-pinterest"><span>Pinterest</span></a></li>
			<li><a href="#" class="fa solo fa-instagram"><span>Instagram</span></a></li>
		</ul>

		<!-- Menu -->
		<ul class="menu">
			<li>&copy; copyright Team My Pi</li>
			<li>Design: J, Develop: s, s, y, o</li>
		</ul>

	</footer>

</body>
</html>