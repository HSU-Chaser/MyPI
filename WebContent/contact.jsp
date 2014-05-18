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

	<!-- Contact -->
	<section id="contact" class="main style3 secondary">
		<div class="content container">
			<header>
				<h2>Sending &nbsp;&nbsp;Message</h2>
				<p>
					<font size="+1">Please send your comments</font>
				</p>
			</header>
			<div class="box container small">

				<!--
							 Contact Form
							 
							 To get this working, place a script on your server to receive the form data, then
							 point the "action" attribute to it (eg. action="http://mydomain.tld/mail.php").
							 More on how it all works here: http://www.1stwebdesigner.com/tutorials/custom-php-contact-forms/
						-->
				<form action="mail.php" method="post">
					<div class="row half">
						<div class="6u">
							<input type="text" id="fname" name="fname" placeholder="Name" />
						</div>
						<div class="6u">
							<input type="text" id="fmail" name="fmail" placeholder="Email" />
						</div>
					</div>
					<div class="row half">
						<div class="12u">
							<textarea id="message" name="message" placeholder="Message"
								rows="6"></textarea>
						</div>
					</div>
					<div class="row">
						<div class="12u">
							<ul class="actions">
								<li><input type="submit" class="button"
									value="Send Message" /></li>
							</ul>
						</div>
					</div>
				</form>

			</div>
		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>