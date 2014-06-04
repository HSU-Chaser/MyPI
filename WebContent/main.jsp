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
<script src="js/modal_content.js"></script>
<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>
<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>
	<%
		if (request.getSession().getAttribute("memEmail") == null) {
	%>
	<script>
		alert("로그인을 하셔야 합니다.");
		location.replace("index.jsp");
	</script>
	<%
		} else {
	%>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />
	<!-- effecter1_start -->
	<div class="md-modal md-effect-12" id="question">
		<div class="md-content">
			<h3>qustion_Modal</h3>
			<div>
				<p>This is a modal to question image</p>
				<!--
					<ul>
						<li><strong>Read:</strong> modal windows will probably tell you something important so don't forget to read what they say.</li>
						<li><strong>Look:</strong> a modal window enjoys a certain kind of attention; just look at it and appreciate its presence.</li>
						<li><strong>Close:</strong> click on the button below to close the modal.</li>
					</ul>
					-->
				<button class="button addButton font_GODOM md-close">Close
					me!</button>
			</div>
		</div>
	</div>
	<!-- effecter1_end -->

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
	<div id="questionBar">
		<img id="question_button" class="ui-button md-trigger"
			data-modal="question" style="display: inline;"
			src="images/icon/modal.png">

	</div>
	<div class="md-overlay" style="background: rgba(0, 0, 0, 0.5);"></div>

	<!-- Loading -->
	<section id="work" class="main style2 fullscreen" style="display: none">
		<div id="loadingContainer">
			<div id="loadingLogo">
				<img src="images/ihfb/main_logo/pi_130x44.png">
			</div>
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
	<%
		}
	%>
</body>
</html>