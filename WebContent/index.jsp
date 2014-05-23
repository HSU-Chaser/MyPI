<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
<title>Team Chaser</title>

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
<!-- effecter_start -->
<link rel="stylesheet" type="text/css" href="css/component.css" />
		<script src="js/effecter/modernizr.custom.js"></script>
<!-- effecter_end -->
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
		<%
			if (session.getAttribute("memEmail") != null) {
		%>
		<script type="text/javascript">
			alert("이미 로그인되어있습니다.");
			location.replace("main.jsp");
		</script>
		<%
			}
		%>
		<!-- Nav -->

		<div class="navbar">
			<div class="navbar-inner">
				<div class="container">
					<a class="btn btn-navbar" data-toggle="collapse"
						data-target=".nav-collapse"> <span class="icon-bar"> </span> <span
						class="icon-bar"> </span> <span class="icon-bar"> </span>
					</a> <a id="logo" class="brand" href="index.jsp"><h1
							class="junseok1">∑ π</h1></a>
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


				<form action="signinProcess.jsp" method="post">
					<table cellspacing="5" cellpadding="5">
						<tr>
							<td rowspan="3" class="MyPI_destribute"><img
								class="test_img" src="images/fulls/02.jpg"></td>
							<td colspan="3" class="junseok9"><input type="text" id="fid" name="fid"
								class="color font_GODOM" placeholder="이메일" /> <input
								type="password" id="fpass" name="fpass"
								class="color font_GODOM" placeholder="비밀번호" /></td>
							<td><input type="submit" class="button junseok5 font_GODOM"
								id="button1" value=" 로그인  " /></td>
						</tr>
						<tr>
							<td colspan="4"><p style="color: rgb(184, 138, 120);"
								class="font_GODOM">MyPI가 처음이신가요? </p> <input type="button"
								class="button junseok5 font_GODOM" id="button2" value=" 회원 가입 "
								onclick="location.href='signup.jsp' " /></td>
						</tr>
						<tr>
							<td colspan="4" style="padding-bottom: 4%;"><p
								style="color: rgb(184, 138, 120);" class="font_GODOM">비밀번호를 잊으셨나요?</p> <input
								type="button" class="button junseok5 font_GODOM" id="button3"
								value=" 비밀번호 찾기  " onclick="location.href='main.jsp' " /></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>
	<jsp:include page="/common/footer.jsp" />
</body>
</html>