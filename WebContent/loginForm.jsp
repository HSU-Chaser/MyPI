<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>로그인</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function begin() {
		document.myform.email.focus();
	}

	function checkIt() {
		if (!document.myform.email.value) {
			alert("이메일을 입력하세요.");
			document.myform.email.focus();
			return false;
		}

		if (!document.myform.passwd.value) {
			alert("비밀번호를 입력하세요.");
			document.myform.passwd.focus();
			return false;
		}
	}
	-->
</script>

<body onload="begin()">
	<form name="myform" action="loginPro.jsp" method="post"
		onSubmit="return checkIt()">
		<table cellspacing="1" cellpadding="1" width="260" border="1"
			align="center">
			<tr height="30">
				<td colspan="2" align="middle"><strong>회원
						로그인</strong></td>
			</tr>
			<tr height="30">
				<td width="110" align="center">이메일</td>
				<td width="150" align="center"><input
					type="text" name="email" size="15" maxlength="30"></td>
			</tr>
			<tr height="30">
				<td width="110" align="center">비밀번호</td>
				<td width="150" align="center"><input
					type="password" name="passwd" size="15" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle" ><input
					type="submit" value="로그인"> <input type="reset" value="다시입력">
					<input type="button" value="회원가입"
					onclick="javascript:window.location='inputForm.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>
