<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>Team My Pi</title>

		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
		<!--bootstrap-->
		<link rel="stylesheet" href="css/bootstrap.css" type="text/css" media="screen" title="no title" charset="utf-8"/>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script src="js/bootstrap.js"></script>
		
		<script src="js/jquery.min.js"></script>
		<script src="js/jquery.poptrox.min.js"></script>
		<script src="js/skel.min.js"></script>
		<script src="js/init.js"></script>
		<noscript>
			<link rel="stylesheet" href="css/skel-noscript.css" />
			<link rel="stylesheet" href="css/style.css" />
		</noscript>

		<style type="text/css" media="screen">
			/*index Page button remove*/
				.navbar .btn.btn-navbar {
				display: none;
			}
		</style>
		
		<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
	</head>
	<body>

		<!-- Header -->
			<header id="header">
				
				<!-- Nav -->
					
						<div class="navbar">
							<div class="navbar-inner">
							  <div class="container">
								<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
									<span class="icon-bar"> </span>
									<span class="icon-bar"> </span>
									<span class="icon-bar"> </span>
								</a>
								<a id="logo" class="brand" href="index.jsp"><h1 class="junseok1">∑ π</h1></a>
								<div class="nav-collapse collapse">
									<ul class="nav pull-right">
								  		<li><a style="visibility: hidden">1</a></li>
								  </ul>
								</div>
							  </div>
							</div>
						</div>
			</header>
			
		<!--  Login -->
			<section id="login" class="main style4 primary junseok2">
				<div class="content container">
					
					<div class="box container small junseok4">
						<!--
							 Contact Form
							 
							 To get this working, place a script on your server to receive the form data, then
							 point the "action" attribute to it (eg. action="http://mydomain.tld/mail.php").
							 More on how it all works here: http://www.1stwebdesigner.com/tutorials/custom-php-contact-forms/
						-->
							<form action="#" method="post">
								<table cellspacing="5" cellpadding="5">
									<tr>
										<td rowspan="3" class="MyPI_destribute">
											<img class="test_img" src="images/fulls/02.jpg">
										</td>
										<td colspan="2"><input type="text" id="fid" name="fid" onclick="if ( this.value == 'ID' ) { this.value = ''; }" onblur="if ( this.value == '' ) { this.value = 'ID'; }" value="ID" /><br>
											<input type="text" id="fpass" name="fpass" onclick="if ( this.value == 'Password' ) { this.value = ''; }" onblur="if ( this.value == '' ) { this.value = 'Password'; }" value="Password" /></td>
									</tr>
									<tr>
										<td id="button1"><input type="submit" class="button junseok4" value="  Sign  in  " /></td>
										<td id="button2"><input type="button" class="button junseok4" value="  Sign  up " onclick="location.href='#' "/>	</td>	
									</tr>
									<tr>							
										<td colspan="2">
											<p style="color: white;">Lost your ID or Password??</p>
											<input type="button" class="button junseok4" value="  Find Info  " onclick="location.href='main.jsp' "/></td>
									</tr>
								</table>
								<!--
								<div class="row half">
										<div class="6u">
										  	
										</div> 
									<div class="6u"><input type="text" id="fname" name="fname" placeholder="ID" /></div><br><br>
									<div class="6u"><input type="text" id="fmail" name="fmail" placeholder="Password" /></div>
								</div>
								
								<div class="row">
									<div class="3u">
										<ul class="actions">
											<li><input type="submit" class="button" value="  S i g n    i n  " /></li>
										</ul>
									</div>
									<div class="3u">
										<ul class="actions">
											<li><input type="button" class="button" value="  S i g n    u p " onclick="location.href='#' "/>
											</li>
										</ul>
									</div>
								</div>
								-->
							</form>

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