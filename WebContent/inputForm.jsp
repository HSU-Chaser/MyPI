<%@ page contentType="text/html; charset=euc-kr"%>


<html>
<head>
<title>ȸ������</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.email.value) {
			alert("�̸����� �Է��ϼ���");
			return false;
		}

		if (!userinput.password.value) {
			alert("��й�ȣ�� �Է��ϼ���");
			return false;
		}
	}

	function EmailCheck() {
		var bol = true;
		var exptext = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/; //^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+
		var userinput = eval("document.userinput");
		if (exptext.test(userinput.email.value) != true) {
			alert("�̸��� ������ �ùٸ��� �ʽ��ϴ�.");
			userinput.email.focus();
			bol = false;
		}
		return bol;
	}

	// ���̵� �ߺ� ���θ� �Ǵ�
	function openConfirmid(userinput) {
		// ���̵� �Է��ߴ��� �˻�
		if (userinput.email.value == "") {
			alert("�̸����� �Է��ϼ���");
			return;
		}

		// url�� ����� �Է� ���̵� �����մϴ�.
		url = "confirmId.jsp?id=" + userinput.email.value;

		// ���ο� �����츦 ���ϴ�.
		open(url, "confirm", "toolbar = no, location = no, status = no,"
				+ "menubar = no, scrollbars = no, resizable = no,"
				+ "width = 300, height = 200");
	}
</script>

<body>
	<form method="post" action="inputPro.jsp" name="userinput"
		onSubmit="return checkIt(),EmailCheck()">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center"><font size="+1"><b>ȸ������</b></font>
				</td>
			</tr>
			<tr>
				<td width="200"><b>�̸��� �Է�</b></td>
				<td width="400"></td>
			</tr>
			<tr>
				<td width="200">����� E-Mail</td>
				<td width="400"><input type="text" name="email" size="10"
					maxlength="30"> <input type="button" name="confirm_id"
					value="Email�ߺ�Ȯ��" onclick="openConfirmid(this.form)"></td>
			</tr>
			<tr>
				<td width="200">��й�ȣ</td>
				<td width="400"><input type="password" name="password"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td width="200">��й�ȣ Ȯ��</td>
				<td width="400"><input type="password" name="password2"
					size="15" maxlength="12"></td>
			</tr>
			<tr>
				<td colspan="2" align="center""><input type="submit"
					name="confirm" value="��  ��"> <input type="reset"
					name="reset" value="�ٽ��Է�"> <input type="button"
					value="���Ծ���" onclick="javascript:window.location='index.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
</html>
