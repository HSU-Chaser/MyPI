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
<script type="text/javascript">
	function checkEmail(userinput) {
		var emailRegex = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
		// 이메일을 입력했는지 검사
		if (userinput.email.value == "") {
			$('#mailMsg').css('color', 'red');
			$('#mailMsg').html('이메일을 입력하세요');
			return false;
		}
		// 이메일 형식여부 검사
		else if (!emailRegex.test(userinput.email.value)) {
			$('#mailMsg').css('color', 'red');
			$('#mailMsg').html('이메일 형식이 맞지 않습니다.');
			return false;
		}
		// 이메일 형식 맞으면 중복검사
		else {
			$.ajax({
				type : "GET",
				dataType : "text",
				url : "mailCheck.jsp?email=" + userinput.email.value,
				success : function(result) {
					if (result == "true") {
						$('#mailMsg').css('color', 'rgb(184, 138, 120)');
						$('#mailMsg').html('사용 가능한 이메일입니다.');
						return true;
					} else {
						$('#mailMsg').css('color', 'red');
						$('#mailMsg').html('이메일이 중복됩니다.');
						return false;
					}
				},
				error : function() {
					alert("서버 통신 오류");
				}
			});
		}
	}
	function sendCertKey(userinput) {
		$.ajax({
			type : "GET",
			url : "sendKey.jsp?email=" + userinput.email.value,
			success : function(result) {
				if (result == "true") {
					alert("인증키를 보냈습니다.");
				} else {
					alert("인증키를 보내는 데 실패하였습니다.");
				}
			},
			error : function() {
				alert("이메일 인증 오류");
			}
		});
	}

	function confirmCertKey(userinput) {
		if (userinput.certkey.value == "") {
			alert("인증키를 입력하세요.");
			$('#keyMsg').css('color', 'red');
			$('#keyMsg').html("인증키를 입력하세요.");
		} else {
			$.ajax({
				type : "GET",
				url : "mailCert.jsp?key=" + userinput.certkey.value,
				success : function(result) {
					if (result == "true") {
						alert("인증을 완료하였습니다.");
						$('#keyMsg').css('color', 'rgb(184, 138, 120)');
						$('#keyMsg').html('이메일이 인증되었습니다.');
						return true;
					} else {
						alert("인증을 실패하였습니다.");
						return false;
					}
				},
				error : function() {
					alert("이메일을 확인하세요.");
				}
			});
		}
	}

	function checkPass1(userinput) {
		var passwdRegex = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,16}/;
		// 입력이 아예 없을 경우
		if (userinput.password.value == "") {
			$('#pass1Msg').css('color', 'red');
			$('#pass1Msg').html('비밀번호를 입력하세요');
			return false;
		}
		// 규칙에 안맞았을 경우.
		else if (!passwdRegex.test(userinput.password.value)) {
			$('#pass1Msg').css('color', 'red');
			$('#pass1Msg').html('6자에서 16자의 영문과 숫자를 혼합해야합니다.');
			return false;
		}
		// 메일 확인 부분에 비번이 있는데 다를경우.
		else if (userinput.password2.value) {
			if (userinput.password.value != userinput.password2.value) {
				$('#pass1Msg').css('color', 'red');
				$('#pass1Msg').html('두 값이 다릅니다.');
				$('#pass2Msg').css('color', 'red');
				$('#pass2Msg').html('두 값이 다릅니다.');
				return false;
			} else {
				$('#pass1Msg').css('color', 'rgb(184, 138, 120)');
				$('#pass1Msg').html('적합한 비밀번호입니다.');
				$('#pass2Msg').css('color', 'rgb(184, 138, 120)');
				$('#pass2Msg').html('적합한 비밀번호입니다.');
				return 0;
			}
		}
		// ㅇㅋ 통과.
		else {
			$('#pass1Msg').css('color', 'rgb(184, 138, 120)');
			$('#pass1Msg').html('아래의 비밀번호을 입력하세요.');
			return 0;
		}
	}

	function checkPass2(userinput) {
		var checkpasswd = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,16}/;
		// 입력이 아예 없을 경우
		if (userinput.password2.value == "") {
			$('#pass2Msg').css('color', 'red');
			$('#pass2Msg').html('비밀번호를 입력하세요');
			return false;
		}
		// 규칙에 안맞았을 경우.
		else if (!checkpasswd.test(userinput.password2.value)) {
			$('#pass2Msg').css('color', 'red');
			$('#pass2Msg').html('6자에서 16자의 영문과 숫자를 혼합해야합니다.');
			return false;
		}
		// 메일 확인 부분에 비번이 있는데 다를경우.
		else if (userinput.password.value) {
			if (userinput.password.value != userinput.password2.value) {
				$('#pass1Msg').css('color', 'red');
				$('#pass1Msg').html('두 값이 다릅니다.');
				$('#pass2Msg').css('color', 'red');
				$('#pass2Msg').html('두 값이 다릅니다.');
				return false;
			} else {
				$('#pass1Msg').css('color', 'rgb(184, 138, 120)');
				$('#pass1Msg').html('적합한 비밀번호입니다.');
				$('#pass2Msg').css('color', 'rgb(184, 138, 120)');
				$('#pass2Msg').html('적합한 비밀번호입니다.');
				return 0;
			}
		}
		// ㅇㅋ 통과.
		else {
			$('#pass2Msg').css('color', 'rgb(184, 138, 120)');
			$('#pass2Msg').html('위의 비밀번호를 입력하세요.');
			return 0;
		}
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
							<td class="junseok9"><input type="button" id="sendKey"
								name="sendKey" value=" 인증키 전송 "
								class="button junseok5 font_GODOM"
								onclick="sendCertKey(this.form)"></td>
						</tr>
						<tr>
							<td class="junseok7 font_GODOM">이메일 인증</td>
							<td class="junseok8 font_GODOM"><input type="text"
								name="certkey" id="certkey" class="color font_GODOM" size="10"
								maxlength="35" placeholder="인증키"><span id="keyMsg"></span></td>
							<td class="junseok9 font_GODOM"><input type="button"
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

	<jsp:include page="/common/footer.jsp" />

</body>
</html>
