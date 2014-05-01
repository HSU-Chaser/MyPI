<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>

<html>
<head>
<title>회원 탈퇴</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">

<%
	String email = (String) session.getAttribute("memEmail");
	String password = request.getParameter("password");
	LogonDBBean manager = LogonDBBean.getInstance();

	int check = manager.deleteMember(email, password);

	if (check == 1) {
		session.invalidate();
%>

<body>
	<form method="post" action="index.jsp" name="userinput">
		<table width="270" border="0" cellspacing="0" cellpadding="5"
			align="center">
			<tr>
				<td height="39" align="center"><font size="+1"><b>회원정보가
							삭제되었습니다.</b></font></td>
			</tr>
			<tr>
				<td align="center">
					<p>
						안녕히 가세요.
						<meta http-equiv="Refresh" content="5;url=index.jsp">
				</td>
			</tr>
			<tr>
				<td align="center"><input type="submit" value="확인"></td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<script>
		alert("비밀번호가 맞지 않습니다.");
		history.go(-1);
	</script>
	<%
		}
	%>
</body>
</html>