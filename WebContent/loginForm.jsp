<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>�α���</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function begin() {
		document.myform.email.focus();
	}

	function checkIt() {
		if (!document.myform.email.value) {
			alert("�̸����� �Է��ϼ���.");
			document.myform.email.focus();
			return false;
		}

		if (!document.myform.passwd.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
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
				<td colspan="2" align="middle"><strong>ȸ��
						�α���</strong></td>
			</tr>
			<tr height="30">
				<td width="110" align="center">�̸���</td>
				<td width="150" align="center"><input
					type="text" name="email" size="15" maxlength="30"></td>
			</tr>
			<tr height="30">
				<td width="110" align="center">��й�ȣ</td>
				<td width="150" align="center"><input
					type="password" name="passwd" size="15" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle" ><input
					type="submit" value="�α���"> <input type="reset" value="�ٽ��Է�">
					<input type="button" value="ȸ������"
					onclick="javascript:window.location='inputForm.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>
