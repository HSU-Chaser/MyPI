<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script language="javascript">
	function checkIt() {
		var userinput = eval("document.userinput");
		var checkemail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		var checkpasswd = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,16}/;

		if (!userinput.email.value) {
			alert("Email을 입력하세요");
			return false;
		} else if (!checkemail.test(userinput.email.value)) {
			alert("Email 형식이 올바르지 않습니다.");
			userinput.email.focus();
			return false;
		} else if (!userinput.password.value) {
			alert("Password를 입력하세요");
			return false;
		} else if (!checkpasswd.test(userinput.password.value)) {
			alert("Password는 6자에서 16자까지 입력 가능하며 영문과 숫자를 혼합해야합니다.");
			userinput.password.focus();
			return false;
		} else if (!(userinput.password.value == userinput.password2.value)) {
			alert("입력하신 Password와 Check Password가 일치하지 않습니다.");
			return false;
		}
	}

	/*
	 비밀번호 체크패턴
	 패턴1(영대/소문자,숫자 및 특수문자 조합 비밀번호 6자리이상 16자리이하체크)
	 /^.*(?=^.{6,16}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/
	 패턴2(영대/소문자,숫자 조합 비밀번호 )
	 /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$)/
	 패턴3(이게좀더 정확한듯)
	 /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,12}/
	 */

	function ConfirmEmail(userinput) {
		var checkemail = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		// 이메일을 입력했는지 검사
		if (userinput.email.value == "") {
			alert("이메일을 입력하세요");
			return false;
			// 이메일 형식여부 검사
		} else if (!checkemail.test(userinput.email.value)) {
			alert("Email 형식이 올바르지 않습니다.");
			userinput.email.focus();
			return false;
		} else {
			$.ajax({
				type : "GET",
				data : userinput,
				url : "./confirmEmail.jsp?email=" + userinput,
				success : function(result) {
					alert(result);
				},
				error : function() {
					alert("서버 오류");
				}
			});
		}
	}

	function ConfirmCertKey(userinput) {
		$.ajax({
			type : "POST",
			data : userinput,
			url : "./mailCert.jsp",
			success : function() {
				alert("인증 완료");
			},
			error : function() {
				alert("서버 오류");
			}
		});
	}
</script>

<body>

	<!-- Header -->
	<header id="header">
		<%
			if (session.getAttribute("memEmail") != null) {
		%>
		<script type="text/javascript">
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
					<table cellspacing="5" cellpadding="5" align="center">
						<tr>
							<td colspan="3" align="center" class="junseok7 font_HYNAML"
								style="font-size: 2em;">회원 가입</td>
						</tr>
						<tr>
							<td class="junseok7 font_HYNAML">계정 이메일</td>
							<td class="junseok8"><input type="text" name="email"
								id="email" class="color font_HYNAML" size="10" maxlength="35"
								placeholder="이메일"></td>
							<td class="junseok8"><input type="button"
								name="confirm_email" value=" 메일 인증 "
								class="button junseok9 font_HYNAML"
								onblur="openConfirmEmail(this.form)"></td>
						</tr>
						<tr>
							<td class="junseok7 font_HYNAML">이메일 인증</td>
							<td class="junseok8"><input type="text" name="email"
								id="cert" class="color font_HYNAML" size="10" maxlength="35"
								placeholder="인증코드"></td>
							<td class="junseok8"><input type="button"
								name="confirm_email" value=" 인증 확인 "
								class="button junseok9 font_HYNAML"
								onclick="openConfirmEmail(this.form)"></td>
						</tr>
						<tr>
							<td class="junseok7 font_HYNAML">비밀번호</td>
							<td class="junseok8"><input type="password" name="password"
								id="password" class="color font_HYNAML" size="15" maxlength="12"
								placeholder="비밀번호"></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7 font_HYNAML">비밀번호 확인</td>
							<td class="junseok8"><input type="password" name="password2"
								id="password2" class="color font_HYNAML" size="15"
								maxlength="12" placeholder="비밀번호 확인"></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7" align="center"><input type="submit"
								name="confirm" class="button junseok9 font_HYNAML"
								value=" 회원가입 "></td>
							<td class="junseok7" align="center" id="reset"><input
								type="reset" name="reset" class="button junseok9 font_HYNAML"
								value=" 다시입력하기 "></td>
							<td class="junseok7" align="center"><input type="button"
								class="button junseok5 font_HYNAML" value=" 취소 "
								onclick="javascript:window.location='index.jsp'"></td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</section>

	<jsp:include page="/common/footer.jsp" />

</body>
</html>