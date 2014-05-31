<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Team Chaser</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<!-- CSS -->
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="css/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="css/main.css" />
<link rel="stylesheet" href="css/component.css" type="text/css" />
<!-- JavaScript -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script src="js/search.js"></script>
<script src="js/effecter/modernizr.custom.js"></script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />

	<!-- Intro -->
	<section id="intro" class="main style1 dark fullscreen">
		<div class="content container">
			<!-- Information -->
			<header>
				<h2>마이파이</h2>
			</header>
			<p>마이파이 내용</p>
		</div>
	</section>

	<!-- Loading -->
	<section id="work" class="main style2 fullscreen" style="display: none">
		<div class="content container">
			<div id="progressbar"
				class="ui-progressbar ui-widget ui-widget-content ui-corner-all">
				<div class="ui-progressbar-value ui-widget-header ui-corner-left"
					style="display: none"></div>
			</div>
			<div class="ui-progress-label">Loading...</div>
		</div>
	</section>

	<!-- Result -->
	<section id="contact" style="display: none">
		<div id="result" class="content"></div>
	</section>
	
	
	

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>