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
			alert("�̸����� �Է��ϼ���.");
			inputForm.email.focus();
			return false;
		}

		if (!inputForm.password.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			inputForm.password.focus();
			return false;
		}
	}
</script>

<%
	// ID����
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
					name="saveEmail">�̸�������</td>
		</tr>
		<tr>
			<td rowspan="2" width="300">�����Դϴ�.</td>
			<td width="30" align="right">PW</td>
			<td width="150"><input type="password" name="password" size="13"
				maxlength="10"></td>
		</tr>
		<tr>
			<td colspan="3" align="center"><input type="submit"
				name="Submit" value="�α���"> <input type="button" value="ȸ������"
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
			<td rowspan="3" align="center"><%=session.getAttribute("memEmail")%>��<br>
				ȯ���մϴ�.
				<form method="post" action="logout.jsp">
					<input type="submit" value="�α׾ƿ�"> <input type="button"
						value="ȸ����������" onclick="javascript:window.location='modify.jsp'">
				</form></td>
		</tr>
		<tr>
			<td rowspan="2" width="300"><form method="post"
					action="searchResult.jsp">
					<input type="submit" value="�˻� ����" />
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
