<%@ page contentType="text/html; charset=euc-kr"%>

<html>
<head>
<title>ȸ�� Ż��</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function begin() {
		document.myform.password.focus();
	}

	function checkIt() {
		if (!document.myform.password.value) {
			alert("��й�ȣ�� �Է����� �����̽��ϴ�.");
			document.myform.password.focus();
			return false;
		}
	}
	-->
</script>

<body onload="begin()">
	<form name="myform" action="deletePro.jsp" method="post"
		onSubmit="return checkIt()">
		<table cellspacing="1" cellpadding="1" width="260" border="1"
			align="center">
			<tr height="30">
				<td colspan="2" align="middle"><font
					size="+1"><b>ȸ�� Ż��</b></font></td>
			</tr>
			<tr>
				<td width="110" align="center">��й�ȣ</td>
				<td width="150" align="center"><input type="password"
					name="password" size="15" maxlength="12"></td>
			</tr>
			<tr height="30">
				<td colspan="2" align="middle"><input
					type="submit" value="ȸ��Ż��"> <input type="button"
					value="��  ��" onclick="javascript:window.location='main.jsp'">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>