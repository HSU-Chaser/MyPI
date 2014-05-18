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

	<jsp:include page="/common/header.jsp" />

	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen">
		<div class="content container small">
			<header>
				<h2>Hey.</h2>
			</header>
			<p>
				Welcome to <strong>Big Picture</strong> a responsive site template
				designed by, built on skelJS, and released for free under the
				Creative Commons Attribution 3.0 license.
			</p>
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
			<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas
				dolore condimentum. Fusce blandit ultrices sapien, in accumsan orci
				rhoncus eu. Sed sodales venenatis arcu, id varius justo euismod in.
				Curabitur egestas consectetur magna urna.</p>
		</div>
		<a href="#two" class="button style2 down anchored">Next</a>
	</section>

	<!-- Two -->
	<section id="two" class="main style2 left dark fullscreen">
		<div class="content box style2">
			<header>
				<h2>Who I Am</h2>
			</header>
			<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas
				dolore condimentum. Fusce blandit ultrices sapien, in accumsan orci
				rhoncus eu. Sed sodales venenatis arcu, id varius justo euismod in.
				Curabitur egestas consectetur magna urna.</p>
		</div>
		<a href="#work" class="button style2 down anchored">Next</a>
	</section>

	<!-- Work -->
	<section id="work" class="main style3 primary">
		<div class="content container">
			<header>
				<h2>My Work</h2>
				<p>Lorem ipsum dolor sit amet et sapien sed elementum egestas
					dolore condimentum. Fusce blandit ultrices sapien, in accumsan orci
					rhoncus eu. Sed sodales venenatis arcu, id varius justo euismod in.
					Curabitur egestas consectetur magna vitae urna.</p>
			</header>

			<!--
						 Lightbox Gallery
						 
						 Powered by poptrox. Full docs here: https://github.com/n33/jquery.poptrox
					-->
			<div class="container small gallery">
				<div class="row flush images">
					<div class="6u">
						<a href="images/fulls/01.jpg" class="image full l"><img
							src="images/thumbs/01.jpg" title="The Anonymous Red" alt="" /></a>
					</div>
					<div class="6u">
						<a href="images/fulls/02.jpg" class="image full r"><img
							src="images/thumbs/02.jpg" title="Airchitecture II" alt="" /></a>
					</div>
				</div>
				<div class="row flush images">
					<div class="6u">
						<a href="images/fulls/03.jpg" class="image full l"><img
							src="images/thumbs/03.jpg" title="Air Lounge" alt="" /></a>
					</div>
					<div class="6u">
						<a href="images/fulls/04.jpg" class="image full r"><img
							src="images/thumbs/04.jpg" title="Carry on" alt="" /></a>
					</div>
				</div>
				<div class="row flush images">
					<div class="6u">
						<a href="images/fulls/05.jpg" class="image full l"><img
							src="images/thumbs/05.jpg" title="The sparkling shell" alt="" /></a>
					</div>
					<div class="6u">
						<a href="images/fulls/06.jpg" class="image full r"><img
							src="images/thumbs/06.jpg" title="Bent IX" alt="" /></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Contact -->
	<section id="contact" class="main style3 secondary"></section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>