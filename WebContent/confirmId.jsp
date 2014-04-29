<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.LogonDBBean"%>

<html>
<head>
<title>Email 중복확인</title>
</head>

<%
	request.setCharacterEncoding("UTF-8");
%>

<%
	String email = request.getParameter("email");
	LogonDBBean manager = LogonDBBean.getInstance();

	int check = manager.confirmEmail(email);
%>

<body>
	<%
		if (check == 1) {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td height="39"><%=email%>이미 사용중인 이메일입니다.</td>
		</tr>
	</table>
	<form name="checkForm" method="post" action="confirmId.jsp">
		<table width="270" border="0" cellspacing="0" cellpadding="5">
			<tr>
				<td align="center">다른 이메일을 사용하세요.
					<p>
						<input type="text" size="10" maxlength="12" name="id"> <input
							type="submit" value="이메일중복확인">
				</td>
			</tr>
		</table>
	</form>
	<%
		} else {
	%>
	<table width="270" border="0" cellspacing="0" cellpadding="5">
		<tr>
			<td align="center"><p>
					입력하신
					<%=email%>는 사용하실 수 있는 이메일입니다. <input type="button" value="닫기"
						onclick="setEmail()"></td>
		</tr>
	</table>
	<%
		}
	%>
</body>
</html>
<script language="javascript">
<!-- 
      function setEmail()
      {
            opener.document.userinput.email.value emailemail %>
	";
		self.close();
	}
	-->
</script>