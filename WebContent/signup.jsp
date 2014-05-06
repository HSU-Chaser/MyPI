<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<title>Sign Up</title>
</head>
<!-- <link href="style.css" rel="stylesheet" type="text/css"> -->
<script language="javascript">
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.email.value) {
			alert("이메일을 입력하세요");
			return false;
		}

		if (!userinput.password.value) {
			alert("비밀번호를 입력하세요");
			return false;
		}
	}

	function EmailCheck() {
		var bol = true;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+
		var userinput = eval("document.userinput");
		if (exptext.test(userinput.email.value) != true) {
			alert("이메일 형식이 올바르지 않습니다.");
			userinput.email.focus();
			bol = false;
		}
		return bol;
	}

	// 아이디 중복 여부를 판단
	function openConfirmEmail(userinput) {
		// 아이디를 입력했는지 검사
		if (userinput.email.value == "") {
			alert("이메일을 입력하세요");
			return;
		}

		// url과 사용자 입력 아이디를 조합합니다.
		url = "confirmEmail.jsp?id=" + userinput.email.value;

		// 새로운 윈도우를 엽니다.
		open(url, "confirm", "toolbar = no, location = no, status = no,"
				+ "menubar = no, scrollbars = no, resizable = no,"
				+ "width = 300, height = 200");
	}
</script>

<body>
	<form method="post" action="signupProcess.jsp" name="userinput"
		onSubmit="return checkIt(),EmailCheck()">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>회원가입</b></font>
				</td>
			</tr>
			<tr>
				<td width="200"><b>이메일 입력</b></td>
				<td width="400"></td>
			</tr>
			<tr>
				<td width="200">사용자 E-Mail</td>
				<td width="400"><input type="text" name="email" size="10"
					maxlength="30"> <input type="button" name="confirm_email"
					value="중복확인" onclick="openConfirmEmail(this.form)"></td>
			</tr>
			<tr>
				<td width="200">비밀번호</td>
				<td width="400"><input type="password" name="password"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">비밀번호 확인</td>
				<td width="400"><input type="password" name="password2"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td colspan="2" align="center""><input type="submit"
					name="confirm" value="등  록"> <input type="reset"
					name="reset" value="다시입력"> <input type="button"
					value="취소" onclick="javascript:window.location='index.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>
