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
	function LoadData() {
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
	}
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

			<div id="loading" style="display: none">
				<img src="./css/images/ajax-loader.gif"> <br>
				로딩중입니다...<br> <br>
			</div>
			<div id="information">
				회원정보를 추가하시면 검색결과 정확도가 높아집니다.
				<form name="search">
					<input class="button" type="button" value="검색" onclick="LoadData()"><br>
				</form>
			</div>
			<div id="result" style="display: none"></div>


		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>

