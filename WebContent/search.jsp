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
<script type="text/javascript">
	/* 	var xhr = null;

	 function getXMLHttpRequest() {
	 if (window.ActiveXObject) {
	 try {
	 return new ActiveXObject("Msxml2.XMLHTTP");
	 } catch (e1) {
	 try {
	 return new ActiveXObject("Microsoft.XMLHTTP");
	 } catch (e2) {
	 return null;
	 }
	 }
	 } else if (window.XMLHttpRequest) {
	 return new XMLHttpRequest();
	 } else {
	 return null;
	 }
	 }

	 function requestResult(URL) {
	 xhr = getXMLHttpRequest();
	 xhr.onreadystatechange = responseResult;
	 xhr.open("POST", URL, true);
	 xhr.send(null);
	 }

	 function responseResult() {
	 if (xhr.readyState == 4) {
	 var str = xhr.responseText;
	 document.getElementById("result").innerHTML = str;
	 } else {
	 alert(!"Fail : " + httpRequest.status);
	 }
	 } */
	function fLoadData() {
		$.ajax({
			type : "POST",
			url : "./searchProcess.jsp",
			data : "",
			success : function(resultText) {
				$('#result').html(resultText);
			},
			error : function() {
				alert("Error.");
			}
		});
	}

	$(document).ready(function($) {
		$('#loading').hide();

		$('#loading').ajaxStart(function() {
			$('#loading').css('position', 'absolute');
			$('#loading').css('left', $('#result').offset().left);
			$('#loading').css('top', $('#result').offset().top);
			$('#loading').css('width', $('#result').css('width'));
			$('#loading').css('height', $('#result').css('height'));

			//$(this).show();
			$(this).fadeIn(500);
		}).ajaxStop(function() {
			//$(this).hide();
			$(this).fadeOut(500);
		});
	});
</script>
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

			<div id="loading">
				<img src="/MyPI/css/images/loader.gif">
			</div>

			<div id="result">
				회원정보를 추가하시면 검색결과 정확도가 높아집니다.
				<form name="search">
					<input type="button" value="검색" onclick="fLoadData()">
				</form>
			</div>


		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>

