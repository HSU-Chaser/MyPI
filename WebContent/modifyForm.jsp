<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page import="main.logon.*"%>

<html>
<head>
<title>ȸ����������</title>
</head>
<link href="style.css" rel="stylesheet" type="text/css">
<script language="javascript">
<!--
	function checkIt() {
		var userinput = eval("document.userinput");

		if (!userinput.passwd.value) {
			alert("��й�ȣ�� �Է��ϼ���.");
			return false;
		}

		if (userinput.passwd.value != userinput.passwd2.value) {
			alert("��й�ȣ�� �����ϰ� �Է��ϼ���.");
			return false;
		}

		if (!userinput.username.value) {
			alert("����� �̸��� �Է��ϼ���.");
			return false;
		}

		if (!userinput.jumin1.value || !userinput.jumin2.value) {
			alert("�ֹε�Ϲ�ȣ�� �Է��ϼ���.");
			return false;
		}
	}

	function zipCheck() {
		url = "ZipCheck.jsp?check=y";
		open(url, "post", "toolbar = no, status = yes, menubar = no,"
				+ "scrollbars = yes, directories = no,"
				+ "width = 500, height = 300");
	}
	-->
</script>

<%
	String email = (String) session.getAttribute("memEmail");

	LogonDBBean manager = LogonDBBean.getInstance();
	LogonDataBean c = manager.getMember(email);

	try {
%>

<body>
	<form method="post" action="modifyPro.jsp" name="userinput"
		onSubmit="return checkIt()">
		<table width="600" border="1" cellspacing="0" cellpadding="3"
			align="center">
			<tr>
				<td colspan="2" height="39" align="center">
					<font size="+1"><b>ȸ�� ���� ����</b></font>
				</td>
			</tr>
			<tr>
				<td colspan="2" class="normal" align="center">ȸ���� ������ �����մϴ�.</td>
			</tr>
			<tr>
				<td width="200"><b>�̸��� �Է�</b></td>
				<td width="400" ></td>
			</tr>
			<tr>
				<td width="200">����� �̸���</td>
				<td width="400"><%=c.getEmail()%></td>
			</tr>
			<tr>
				<td width="200">��й�ȣ</td>
				<td width="400"><input type="password" name="passwd" size="10"
					maxlength="10" value="<%=c.getPassword()%>"></td>
			</tr>
			<tr>
				<td colspan="2" align="center" ><input
					type="submit" name="modify" value="��  ��"> <input
					type="button" value="��  ��"
					onclick="javascript:window.location='main.jsp'"></td>
			</tr>
		</table>
	</form>
</body>
<%
	} catch (Exception e) {
	}
%>
</html>