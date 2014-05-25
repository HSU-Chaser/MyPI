<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE HTML>
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
<script src="js/signup.js"></script>
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

table,tr,td,th {
	border: 3px solid white;
}
</style>

<!--[if lte IE 8]><link rel="stylesheet" href="css/ie/v8.css" /><![endif]-->
</head>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->

<body>
	<!-- Header -->
	<header id="header">

		<%
			if (session.getAttribute("memEmail") != null) {
		%>
		<script type="text/javascript">
			alert("로그인 상태입니다.");
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

	<!--  Sign Up -->
	<section id="login" class="main style4 primary junseok6">
		<div class="content container">

			<div class="box container small junseok4">
				<form method="post" action="signupProcess.jsp" name="userinput"
					onSubmit="return checkIt()">
					<table cellspacing="5" cellpadding="5"
						style="text-align: center; background-color: rgba(255, 255, 255, 0.2);">
						<tr>
							<td colspan="3" align="center" class="junseok7 font_GODOM">회원
								가입</td>
						</tr>
						<tr>
							<td class="junseok7 font_GODOM">계정 이메일</td>
							<td class="junseok8 font_GODOM"><input type="text"
								name="email" id="email" class="color font_GODOM" size="10"
								maxlength="35" placeholder="이메일" onblur="checkEmail(this.form)">
								<span id="mailMsg"></span></td>
							<td><input type="button" id="sendKey"
								name="sendKey" value=" 인증키 전송 "
								class="button junseok5 font_GODOM"
								onclick="sendCertKey(this.form)"></td>
						</tr>
						<tr>
							<td class="junseok7 font_GODOM">이메일 인증</td>
							<td class="junseok8 font_GODOM"><input type="text"
								name="certkey" id="certkey" class="color font_GODOM" size="10"
								maxlength="35" placeholder="인증키"><span id="keyMsg"></span></td>
							<td class="font_GODOM"><input type="button"
								name="confirm_email" value=" 인증 확인 "
								class="button junseok5 font_GODOM"
								onclick="confirmCertKey(this.form)"></td>
						</tr>
						<tr>
							<td class="junseok7 font_GODOM">비밀번호</td>
							<td class="junseok8 font_GODOM"><input type="password"
								name="password" id="password" class="color font_GODOM"
								size="15" maxlength="12" placeholder="비밀번호"
								onblur="checkPass1(this.form)"> <span id="pass1Msg"></span></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7 font_GODOM">비밀번호 확인</td>
							<td class="junseok8 font_GODOM"><input type="password"
								name="password2" id="password2" class="color font_GODOM"
								size="15" maxlength="12" placeholder="비밀번호 확인"
								onblur="checkPass2(this.form)"> <span id="pass2Msg"></span></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7" align="center"><input type="submit"
								name="confirm" class="button junseok5 font_GODOM"
								value=" 회원가입 "></td>
							<td class="junseok7" align="center" id="reset"><input
								type="reset" name="reset" class="button junseok5 font_GODOM"
								value=" 다시입력 "></td>
							<td class="junseok7" align="center"><input type="button"
								class="button junseok5 font_GODOM" value=" 취소 "
								onclick="javascript:window.location='index.jsp'"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>

	<!-- Footer -->
	<jsp:include page="/common/footer.jsp" />

</body>
</html>
