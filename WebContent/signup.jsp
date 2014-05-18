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
	border: 1px solid white;
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

	// 이메일 중복 여부를 판단
	function openConfirmEmail(userinput) {
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
		}
		// url과 사용자 입력 아이디를 조합합니다.
		//url = "confirmEmail.jsp?id=" + userinput.email.value;
		// 새로운 윈도우를 엽니다.
		userinput.target = "email";
		userinput.action = "confirmEmail.jsp";
		open("confirmEmail.jsp", "email",
				"toolbar = no, location = no, status = no,"
						+ "menubar = no, scrollbars = no, resizable = no,"
						+ "width = 300, height=200");
		userinput.submit();
	}
</script>

<body>

	<jsp:include page="/common/header.jsp" />

	<!--  Sign Up -->
	<section id="login" class="main style4 primary junseok6">
		<div class="content container">

			<div class="box container small junseok4">
				<form method="post" action="signupProcess.jsp" name="userinput"
					onSubmit="return checkIt()">
					<table cellspacing="5" cellpadding="5" align="center">
						<tr>
							<td colspan="3" align="center" class="junseok7"
								style="font-size: 3em;">Sign Up</td>
						</tr>
						<tr>
							<td class="junseok7">User E-Mail</td>
							<td class="junseok8"><input type="text" name="email"
								id="email" class="color" size="10" maxlength="35"
								placeholder="Email"></td>
							<td class="junseok8"><input type="button"
								name="confirm_email" value=" Double Check "
								class="button junseok9" onclick="openConfirmEmail(this.form)">
							</td>
						</tr>
						<tr>
							<td class="junseok7">Password</td>
							<td class="junseok8"><input type="password" name="password"
								id="password" class="color" size="15" maxlength="12"
								placeholder="Password"></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7">Check Password</td>
							<td class="junseok8"><input type="password" name="password2"
								id="password2" class="color" size="15" maxlength="12"
								placeholder="Check Password"></td>
							<td></td>
						</tr>
						<tr>
							<td class="junseok7" align="center"><input type="submit"
								name="confirm" class="button junseok9" value=" Confirm ">
							</td>
							<td class="junseok7" align="center" id="reset"><input
								type="reset" name="reset" class="button junseok9"
								value=" ReEnter "></td>
							<td class="junseok7" align="center"><input type="button"
								class="button junseok5" value=" Cancel "
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
