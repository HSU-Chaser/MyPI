<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>MyPI</title>
</head>

<link href="style.css" rel="stylesheet" type="text/css">
<%
	try
      {
            if(session.getAttribute("memEmail") == null)
            {
%>
<script language="javascript">
	function focusIt() {
		document.inform.email.focus();
	}

	function checkIt() {
		inputForm = eval("document.inform");

		if (!inputForm.email.value) {
			alert("이메일을 입력하세요.");
			inputForm.email.focus();
			return false;
		}

		if (!inputForm.password.value) {
			alert("비밀번호를 입력하세요.");
			inputForm.password.focus();
			return false;
		}
	}
</script>

<%
	// ID저장
			Cookie[] emailc = request.getCookies();

			String email = "";

			if (emailc != null) {
				for (Cookie emailcs : emailc) {
					if (emailcs.getName().equals("email"))
						email = emailcs.getValue();
				}
			}
%>

<body onLoad="focusIt();">
	<table width="500" cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="300" height="20">&nbsp;</td>

			<form name="inform" method="post" action="loginPro.jsp"
				onSubmit="return checkIt();">
				<td width="30" align="right">Email</td>
				<td width="150"><input type="text" name="email" size="13"
					maxlength="30" value="<%=email%>"> <input type="checkbox"
					name="saveEmail">이메일저장</td>
		</tr>
		<tr>
			<td rowspan="2" width="300">메인입니다.</td>
			<td width="30" align="right">PW</td>
			<td width="150"><input type="password" name="password" size="13"
				maxlength="10"></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="submit"
				name="Submit" value="로그인"> <input type="button" value="회원가입"
				onclick="javascript:window.location='inputForm.jsp'"></td>
		</tr>
		</form>
	</table>
	<%
		} else {
	%>
	<table width="500" cellpadding="0" cellspacing="0" align="center"
		border="1">
		<tr>
			<td width="300" height="20">Hi</td>
			<td rowspan="3" align="center"><%=session.getAttribute("memEmail")%>님<br>
				환영합니다.
				<form method="post" action="logout.jsp">
					<input type="submit" value="로그아웃"> <input type="button"
						value="회원정보변경" onclick="javascript:window.location='modify.jsp'">
				</form></td>
		</tr>
		<tr>
			<td rowspan="2" width="300"><form method="post"
					action="searchResult.jsp">
					<input type="submit" value="검색 시작" />
				</form></td>
		</tr>
	</table>
	<br>
	<%
		}
		} catch (NullPointerException e) {
		}
	%>
</body>
</html>
