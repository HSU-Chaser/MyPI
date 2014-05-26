<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Team Chaser</title>
<meta name="description" content="" />
<meta name="keywords" content="" />
<!--[if lte IE 8]><script src="css/ie/html5shiv.js"></script><![endif]-->
<!--bootstrap-->
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen" title="no title" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="js/bootstrap.js"></script>

<script src="js/jquery.min.js"></script>
<script src="js/jquery.poptrox.min.js"></script>
<script src="js/skel.min.js"></script>
<script src="js/init.js"></script>
<script type="text/javascript">
	/* 	$(function() {
	 $('progress').progressbar({
	 value : 37
	 });
	 });
	 */
	var _onLoadData = function() {
		$.ajax({
			type : "POST",
			url : "./searchProcess.jsp",
			success : function(result) {
				$('#result').html(result);
			},
			error : function() {
				$('#result').html("서버 오류입니다.");
			},
			beforeSend : function() {
				$('#information').hide();
				$('#loading').fadeIn(1000);
			},
			complete : function() {
				$('#loading').hide();
				$('#result').fadeIn(1000);
			}
		});
	};

	var moreFilter = function() {
		var status = $('#moreFilter').css('display');
		if (status == 'none') {
			$('#moreFilter').toggle(500);
			$('#extendButton').attr('src', './images/icon/minus.png');
		} else {
			$('#moreFilter').toggle(500);
			$('#extendButton').attr('src', './images/icon/plus.png');
		}
	};
</script>

<noscript>
	<link rel="stylesheet" href="css/skel-noscript.css" />
	<link rel="stylesheet" href="css/style.css" />
</noscript>

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<body>
	<!-- Header -->
	<jsp:include page="/common/header.jsp" />

	<!-- Search Bar -->
	<div id="searchBar"
		style="display: block; margin-bottom: 80px; background: aqua;">
		<!-- Basic Filter -->
		<div id="searchFilter" style="float: left; margin-left: 20px">
			<!-- Default Filter -->
			<img id="email" src="./images/icon/email.png"> <img id="name"
				src="./images/icon/name.png">
		</div>
		<!-- Extended Filter -->
		<div id="moreFilter"
			style="display: none; float: left; margin-left: 5px">
			<img id="cellphone" src="./images/icon/cellphone.png"> <img
				id="homephone" src="./images/icon/homephone.png"> <img
				id="birthday" src="./images/icon/birthday.png"> <img
				id="address" src="./images/icon/address.png"> <img id="school"
				src="./images/icon/school.png"> <img id="workplace"
				src="./images/icon/workplace.png"> <img id="occupation"
				src="./images/icon/occupation.png">
		</div>
		<!-- Filter Toggle -->
		<div id="toggleFilter" style="float: left; margin-left: 5px">
			<img id="extendButton" src="./images/icon/plus.png"
				onclick="moreFilter()">
		</div>

		<!-- Search Button -->
		<div id="searchbutton" style="float: right; margin-right: 20px">
			<img alt="search" id="search" src="./images/icon/search.png"
				onclick="_onLoadData()">
		</div>

	</div>

	<!-- Progress Bar -->
	<div id="progress" align="center">
		<progress value="30" max="100"></progress>
	</div>
	<div id="loading" align="center" style="display: none">
		<img src="./css/images/ajax-loader.gif"> <br> 로딩중입니다...<br>
		<br>
	</div>

	<!-- Result -->
	<div id="result" class="junseok07" style="display: none"></div>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />
</body>
</html>